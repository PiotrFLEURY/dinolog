use std::{
    env,
    time::{self, Duration},
};

use dinolog_server::{
    data::source::{
        count_all_logs_entries, establish_connection, fetch_all_log_entries, initialize_database,
        insert_log_entries,
    },
    domain::{loader::clear_log_entries_older_than_seven_days, models::LogEntry},
};
use testcontainers::{
    ContainerAsync, GenericImage, ImageExt,
    core::{ContainerPort, WaitFor},
    runners::AsyncRunner,
};

pub async fn setup() -> Result<ContainerAsync<GenericImage>, &'static str> {
    println!("Setting up test context...");
    // Create postgres container
    let container_port = ContainerPort::Tcp(5432);
    let container = GenericImage::new("postgres", "18")
        .with_exposed_port(container_port)
        .with_wait_for(WaitFor::message_on_stdout(
            "PostgreSQL init process complete; ready for start up",
        ))
        .with_env_var("POSTGRES_PASSWORD", "postgres")
        .with_startup_timeout(Duration::from_secs(10))
        .start()
        .await
        .expect("Failed to start Postgres container");

    // Resolve the host and dynamically mapped port for the Postgres container
    let host = match container.get_host().await {
        Ok(host) => host,
        Err(_) => return Err("Failed to get container host"),
    };
    let host_port = match container.get_host_port_ipv4(container_port).await {
        Ok(port) => port,
        Err(_) => return Err("Failed to get container host port"),
    };

    let database_url = format!(
        "postgres://postgres:postgres@{}:{}/postgres",
        host, host_port
    );

    unsafe { env::set_var("DATABASE_URL", database_url) };

    let stat_time = time::Instant::now();
    let timeout_duration = Duration::from_secs(30);
    loop {
        println!("Attempting to establish database connection...");
        if time::Instant::now() - stat_time > timeout_duration {
            return Err("Timeout while waiting for database connection".into());
        }
        match establish_connection().await {
            Ok(_) => break,
            Err(_) => {
                tokio::time::sleep(Duration::from_secs(1)).await;
            }
        };
    }

    println!("Database connection established successfully.");

    println!("Initializing database schema...");
    initialize_database().await?;

    Ok(container)
}

pub async fn teardown(container: ContainerAsync<GenericImage>) {
    println!("Stopping and removing Postgres container...");
    container.stop().await.expect("Failed to stop container");
}

#[tokio::test]
async fn test_delete_old_logs() {
    // GIVEN
    let container = setup().await.expect("Failed to set up test context");

    // Insert log entries with timestamps younger than 7 days
    let recent_timestamp = chrono::Utc::now() - chrono::Duration::days(1);
    let recent_log_entry = LogEntry {
        remote_addr: "127.0.0.1".to_string(),
        remote_user: "-".to_string(),
        time_local: recent_timestamp,
        http_method: "GET".to_string(),
        request_path: "/recent".to_string(),
        http_version: "HTTP/1.1".to_string(),
        status_code: "200".to_string(),
        http_referer: "-".to_string(),
        http_user_agent: "TestAgent".to_string(),
    };

    // Insert log entries with timestamps older than 7 days
    let old_timestamp = chrono::Utc::now() - chrono::Duration::days(8);
    let old_log_entry = LogEntry {
        remote_addr: "127.0.0.1".to_string(),
        remote_user: "-".to_string(),
        time_local: old_timestamp,
        http_method: "GET".to_string(),
        request_path: "/old".to_string(),
        http_version: "HTTP/1.1".to_string(),
        status_code: "200".to_string(),
        http_referer: "-".to_string(),
        http_user_agent: "TestAgent".to_string(),
    };

    insert_log_entries(&[recent_log_entry, old_log_entry])
        .await
        .expect("Unable to insert log entries");

    // WHEN
    clear_log_entries_older_than_seven_days()
        .await
        .expect("Failed to clear old log entries");

    // THEN
    let total_inserted = count_all_logs_entries().await.unwrap();
    assert_eq!(total_inserted, 1, "Old log entries were not cleared");

    let from = chrono::Utc::now() - chrono::Duration::days(7);
    let to = chrono::Utc::now();
    let remaining_entries = match fetch_all_log_entries(from, to).await {
        Ok(entries) => entries,
        Err(e) => {
            teardown(container).await;
            panic!("Failed to fetch remaining log entries: {}", e);
        }
    };

    assert_eq!(
        remaining_entries.len(),
        1,
        "There should be only one log entry remaining"
    );
    assert_eq!(
        remaining_entries[0].request_path, "/recent",
        "The remaining log entry should be the recent one"
    );

    teardown(container).await;
}
