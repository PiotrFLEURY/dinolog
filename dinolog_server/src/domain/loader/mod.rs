use tracing::info;

use crate::{
    data::source::{clear_log_entries_older_than, count_all_logs_entries, insert_log_entries},
    domain::{models::LogEntry, parsers::combined::parse_combined_logs},
};

pub async fn load_logs_from_files() -> Result<(), &'static str> {
    let log_files_directory =
        std::env::var("LOG_FILES_DIR").unwrap_or_else(|_| "logs/".to_string());

    info!(
        "Looking for log files in directory: {}",
        log_files_directory
    );

    let first_log_file = std::fs::read_dir(&log_files_directory)
        .map_err(|_| "Failed to read log files directory")?
        .filter_map(|entry| entry.ok())
        .find(|entry| entry.path().is_file())
        .ok_or("No log files found in the specified directory")?;

    let file_path = first_log_file.path();
    let log_file_path = file_path.to_string_lossy();

    let entries = parse_combined_logs(&log_file_path);
    info!(
        "Loaded {} log entries from file: {}",
        entries.len(),
        log_file_path
    );

    insert_log_entries_chunks(&entries).await?;

    clear_log_entries_older_than_seven_days().await?;

    info!("Finished loading log entries from file: {}", log_file_path);
    Ok(())
}

async fn insert_log_entries_chunks(entries: &[LogEntry]) -> Result<(), &'static str> {
    for chunk in entries.chunks(1_000) {
        info!(
            "Inserting chunk of {} log entries into the database...",
            chunk.len()
        );
        let entries_chunk = chunk.to_vec();
        insert_log_entries(&entries_chunk).await?;
    }

    let total_inserted = count_all_logs_entries().await;
    match total_inserted {
        Ok(count) => info!("Total log entries in the database: {}", count),
        Err(e) => info!("Failed to count log entries in the database: {}", e),
    }
    Ok(())
}

pub async fn clear_log_entries_older_than_seven_days() -> Result<(), &'static str> {
    let seven_days_ago = chrono::Utc::now() - chrono::Duration::days(7);
    info!(
        "Clearing log entries older than: {}",
        seven_days_ago.to_rfc3339()
    );
    clear_log_entries_older_than(seven_days_ago).await?;
    Ok(())
}
