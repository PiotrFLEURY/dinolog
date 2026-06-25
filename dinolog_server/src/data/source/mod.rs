use sea_orm::{
    ActiveModelTrait,
    ActiveValue::{NotSet, Set},
    ColumnTrait, ConnectOptions, ConnectionTrait, Database, DatabaseConnection, EntityTrait,
    PaginatorTrait, QueryFilter, QueryOrder,
    entity::prelude::DateTimeUtc,
};
use tracing::{error, info};

use crate::{
    data::dao::{log_entry, user},
    domain::models::LogEntry,
};

pub async fn establish_connection() -> Result<DatabaseConnection, &'static str> {
    info!("Establishing database connection...");
    let database_url = std::env::var("DATABASE_URL")
        .unwrap_or_else(|_| "postgres://postgres:postgres@localhost/postgres".to_string());

    let mut opt = ConnectOptions::new(database_url.clone());
    opt.sqlx_logging(false);

    Database::connect(opt)
        .await
        .map_err(|_| "Failed to connect to the database")
}

pub async fn initialize_database() -> Result<(), &'static str> {
    let db = establish_connection().await?;

    // Run Plain SQL scripts to create tables if they don't exist
    let create_user_table_sql = r#"
        CREATE TABLE IF NOT EXISTS users (
            id SERIAL PRIMARY KEY,
            username VARCHAR(255) NOT NULL UNIQUE,
            password_hash TEXT NOT NULL
        );
    "#;
    db.execute(sea_orm::Statement::from_string(
        db.get_database_backend(),
        create_user_table_sql.to_string(),
    ))
    .await
    .map_err(|_| "Failed to create users table")?;

    let create_log_entry_table_sql = r#"
            CREATE TABLE IF NOT EXISTS log_entries (
                id SERIAL PRIMARY KEY,
                remote_addr VARCHAR(45) NOT NULL,
                remote_user TEXT,
                time_local TIMESTAMP WITH TIME ZONE NOT NULL,
                http_method TEXT NOT NULL,
                request_path TEXT NOT NULL,
                http_version TEXT NOT NULL,
                status_code TEXT NOT NULL,
                http_referer TEXT,
                http_user_agent TEXT
            );
    "#;
    db.execute(sea_orm::Statement::from_string(
        db.get_database_backend(),
        create_log_entry_table_sql.to_string(),
    ))
    .await
    .map_err(|_| "Failed to create log entries table")?;

    info!("Database initialized successfully.");
    Ok(())
}

pub async fn clear_log_entries() -> Result<(), &'static str> {
    let db = establish_connection().await?;

    info!("Clearing all log entries from the database...");

    log_entry::Entity::delete_many()
        .exec(&db)
        .await
        .map_err(|_| "Failed to clear log entries from the database")?;

    info!("All log entries have been cleared from the database.");
    Ok(())
}

pub async fn clear_log_entries_older_than(timestamp: DateTimeUtc) -> Result<(), &'static str> {
    let db = establish_connection().await?;

    info!(
        "Clearing log entries older than {} from the database...",
        timestamp
    );

    log_entry::Entity::delete_many()
        .filter(log_entry::Column::TimeLocal.lt(timestamp))
        .exec(&db)
        .await
        .map_err(|_| "Failed to clear old log entries from the database")?;

    info!(
        "All log entries older than {} have been cleared from the database.",
        timestamp
    );
    Ok(())
}

pub async fn insert_log_entries(entries: &[LogEntry]) -> Result<(), &'static str> {
    let db = establish_connection().await?;

    let mut many = vec![];

    // Insert log entries into the database
    for entry in entries {
        let one = log_entry::ActiveModel {
            id: NotSet, // Let the database auto-generate the ID
            remote_addr: Set(entry.remote_addr.clone()),
            remote_user: Set(entry.remote_user.clone()),
            time_local: Set(entry.time_local.clone()),
            http_method: Set(entry.http_method.clone()),
            request_path: Set(entry.request_path.clone()),
            http_version: Set(entry.http_version.clone()),
            status_code: Set(entry.status_code.clone()),
            http_referer: Set(entry.http_referer.clone()),
            http_user_agent: Set(entry.http_user_agent.clone()),
        };
        many.push(one);
    }

    info!("Inserting {} log entries into the database...", many.len());

    log_entry::Entity::insert_many(many)
        .exec(&db)
        .await
        .map_err(|_| "Failed to insert log entries into the database")?;
    Ok(())
}

pub async fn fetch_all_log_entries(
    from: DateTimeUtc,
    to: DateTimeUtc,
) -> Result<Vec<LogEntry>, &'static str> {
    let db = establish_connection().await?;

    let log_entries: Vec<log_entry::Model> = log_entry::Entity::find()
        .filter(log_entry::Column::TimeLocal.between(from.clone(), to.clone()))
        .order_by_desc(log_entry::Column::TimeLocal)
        .all(&db)
        .await
        .map_err(|_| "Failed to fetch log entries from the database")?;

    let log_entries = log_entries
        .into_iter()
        .map(|entry| LogEntry {
            remote_addr: entry.remote_addr,
            remote_user: entry.remote_user,
            time_local: entry.time_local,
            http_method: entry.http_method,
            request_path: entry.request_path,
            http_version: entry.http_version,
            status_code: entry.status_code,
            http_referer: entry.http_referer,
            http_user_agent: entry.http_user_agent,
        })
        .collect();

    Ok(log_entries)
}

pub async fn count_all_logs_entries() -> Result<u64, &'static str> {
    let db = establish_connection().await?;

    let count = log_entry::Entity::find()
        .count(&db)
        .await
        .map_err(|_| "Failed to count log entries in the database")?;

    Ok(count)
}

pub async fn find_user_by_username(username: &str) -> Option<user::Model> {
    let db = match establish_connection().await {
        Ok(conn) => conn,
        Err(e) => {
            error!("Failed to establish database connection: {}", e);
            return None;
        }
    };

    let result = user::Entity::find()
        .filter(user::Column::Username.eq(username))
        .one(&db)
        .await
        .map_err(|_| {
            error!("Failed to query user");
            return None::<user::Model>;
        });

    match result {
        Ok(user) => user,
        Err(_) => None,
    }
}

pub async fn upsert_admin_user(username: &str, password_hash: &str) -> Result<(), &'static str> {
    let db = establish_connection().await?;

    let existing = user::Entity::find()
        .filter(user::Column::Username.eq(username))
        .one(&db)
        .await
        .expect("Failed to query user");

    match existing {
        Some(model) => {
            let mut active: user::ActiveModel = model.into();
            active.password_hash = Set(password_hash.to_string());
            active
                .update(&db)
                .await
                .map_err(|_| "Failed to update admin user")?;
            info!("Admin user '{}' updated", username);
        }
        None => {
            let new_user = user::ActiveModel {
                id: NotSet,
                username: Set(username.to_string()),
                password_hash: Set(password_hash.to_string()),
            };
            user::Entity::insert(new_user)
                .exec(&db)
                .await
                .map_err(|_| "Failed to insert admin user")?;
            info!("Admin user '{}' created", username);
        }
    }

    Ok(())
}

pub async fn count_logs_between_timestamps(
    from: DateTimeUtc,
    to: DateTimeUtc,
) -> Result<u64, &'static str> {
    let db = establish_connection().await?;

    let count = log_entry::Entity::find()
        .filter(log_entry::Column::TimeLocal.between(from.clone(), to.clone()))
        .count(&db)
        .await
        .map_err(|_| "Failed to count log entries between timestamps")?;

    Ok(count)
}
