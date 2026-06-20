use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LoginRequest {
    pub username: String,
    pub password: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LoginResponse {
    pub token: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CountLogsRequest {
    pub from: DateTime<Utc>,
    pub to: DateTime<Utc>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CountLogsResponse {
    pub from: DateTime<Utc>,
    pub to: DateTime<Utc>,
    pub log_count: u64,
}

impl CountLogsResponse {
    pub fn new(from: DateTime<Utc>, to: DateTime<Utc>, log_count: u64) -> Self {
        CountLogsResponse {
            from,
            to,
            log_count,
        }
    }
}
