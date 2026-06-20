use sea_orm::{
    ActiveModelTrait,
    ActiveValue::{NotSet, Set},
    ColumnTrait, ConnectOptions, Database, DatabaseConnection, EntityTrait, PaginatorTrait,
    QueryFilter, QueryOrder,
    entity::prelude::DateTimeUtc,
};
use tracing::info;

use crate::{
    data::dao::{log_entry, user},
    domain::models::LogEntry,
};

async fn establish_connection() -> DatabaseConnection {
    info!("Establishing database connection...");
    let database_url = std::env::var("DATABASE_URL")
        .unwrap_or_else(|_| "postgres://postgres:postgres@localhost/postgres".to_string());

    let mut opt = ConnectOptions::new(database_url.clone());
    opt.sqlx_logging(false);

    Database::connect(opt)
        .await
        .expect("Failed to connect to the database")
}

pub async fn clear_log_entries() {
    let db = establish_connection().await;

    log_entry::Entity::delete_many()
        .exec(&db)
        .await
        .expect("Failed to clear log entries from the database");
}

pub async fn insert_log_entries(entries: &[LogEntry]) {
    let db = establish_connection().await;

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
        .expect("Failed to insert log entries into the database");
}

pub async fn fetch_all_log_entries(from: DateTimeUtc, to: DateTimeUtc) -> Vec<LogEntry> {
    let db = establish_connection().await;

    let log_entries: Vec<log_entry::Model> = log_entry::Entity::find()
        .filter(log_entry::Column::TimeLocal.between(from.clone(), to.clone()))
        .order_by_desc(log_entry::Column::TimeLocal)
        .all(&db)
        .await
        .expect("Failed to fetch log entries from the database");

    log_entries
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
        .collect()
}

pub async fn count_all_logs_entries() -> Result<u64, sea_orm::DbErr> {
    let db = establish_connection().await;

    let count = log_entry::Entity::find().count(&db).await?;

    Ok(count)
}

pub async fn find_user_by_username(username: &str) -> Option<user::Model> {
    let db = establish_connection().await;
    user::Entity::find()
        .filter(user::Column::Username.eq(username))
        .one(&db)
        .await
        .expect("Failed to query user")
}

pub async fn upsert_admin_user(username: &str, password_hash: &str) {
    let db = establish_connection().await;

    let existing = user::Entity::find()
        .filter(user::Column::Username.eq(username))
        .one(&db)
        .await
        .expect("Failed to query user");

    match existing {
        Some(model) => {
            let mut active: user::ActiveModel = model.into();
            active.password_hash = Set(password_hash.to_string());
            active.update(&db).await.expect("Failed to update admin user");
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
                .expect("Failed to insert admin user");
            info!("Admin user '{}' created", username);
        }
    }
}

pub async fn count_logs_between_timestamps(
    from: DateTimeUtc,
    to: DateTimeUtc,
) -> Result<u64, sea_orm::DbErr> {
    let db = establish_connection().await;

    let count = log_entry::Entity::find()
        .filter(log_entry::Column::TimeLocal.between(from.clone(), to.clone()))
        .count(&db)
        .await?;

    Ok(count)
}
