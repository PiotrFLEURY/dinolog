use tracing::info;

use crate::{
    data::source::{count_all_logs_entries, insert_log_entries},
    domain::{models::LogEntry, parsers::combined::parse_combined_logs},
};

pub async fn load_logs_from_files() {
    let log_files_directory =
        std::env::var("LOG_FILES_DIR").unwrap_or_else(|_| "logs/".to_string());

    info!(
        "Looking for log files in directory: {}",
        log_files_directory
    );

    let first_log_file = std::fs::read_dir(&log_files_directory)
        .expect("Failed to read log files directory")
        .filter_map(|entry| entry.ok())
        .find(|entry| entry.path().is_file())
        .expect("No log files found in the specified directory");

    let file_path = first_log_file.path();
    let log_file_path = file_path.to_string_lossy();

    let entries = parse_combined_logs(&log_file_path);
    info!(
        "Loaded {} log entries from file: {}",
        entries.len(),
        log_file_path
    );

    insert_log_entries_chunks(&entries).await;

    info!("Finished loading log entries from file: {}", log_file_path);
}

async fn insert_log_entries_chunks(entries: &[LogEntry]) {
    for chunk in entries.chunks(1_000) {
        info!(
            "Inserting chunk of {} log entries into the database...",
            chunk.len()
        );
        let entries_chunk = chunk.to_vec();
        insert_log_entries(&entries_chunk).await;
    }

    let total_inserted = count_all_logs_entries().await;
    match total_inserted {
        Ok(count) => info!("Total log entries in the database: {}", count),
        Err(e) => info!("Failed to count log entries in the database: {}", e),
    }
}
