use axum::{Json, extract::Query};
use chrono::{DateTime, Utc};
use serde::Deserialize;

use crate::{
    domain::models::LogEntries,
    domain::repositories::log_repository::{get_log_count_between_timestamps, get_logs},
    presentation::handlers::dto::{CountLogsRequest, CountLogsResponse},
};

#[derive(Deserialize)]
pub struct LogPeriodParams {
    from: DateTime<Utc>,
    to: DateTime<Utc>,
}

pub async fn handle_get_logs(
    params: Query<LogPeriodParams>,
) -> Result<Json<LogEntries>, &'static str> {
    let logs = get_logs(params.from, params.to).await?;
    Ok(Json(logs))
}

pub async fn handle_post_count_logs(
    Json(payload): Json<CountLogsRequest>,
) -> Result<Json<CountLogsResponse>, &'static str> {
    let log_count = get_log_count_between_timestamps(payload.from, payload.to).await?;
    Ok(Json(CountLogsResponse::new(
        payload.from,
        payload.to,
        log_count,
    )))
}

pub mod dto;
