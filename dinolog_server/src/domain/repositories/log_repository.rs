use chrono::{DateTime, Utc};

use crate::{
    data::source::{count_logs_between_timestamps, fetch_all_log_entries},
    domain::models::LogEntries,
};

pub async fn get_logs(from: DateTime<Utc>, to: DateTime<Utc>) -> Result<LogEntries, &'static str> {
    let entries = fetch_all_log_entries(from.into(), to.into()).await?;
    Ok(LogEntries::from_vec(entries))
}

pub async fn get_log_count_between_timestamps(
    from: DateTime<Utc>,
    to: DateTime<Utc>,
) -> Result<u64, &'static str> {
    let log_count = count_logs_between_timestamps(from.into(), to.into())
        .await
        .map_err(|_| "Failed to count log entries between timestamps")?;

    Ok(log_count)
}
