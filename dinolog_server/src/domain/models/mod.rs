use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LogEntries {
    pub entries: Vec<LogEntry>,
}

impl LogEntries {
    pub fn new(entries: Vec<LogEntry>) -> Self {
        LogEntries { entries }
    }

    pub fn from_vec(entries: Vec<LogEntry>) -> Self {
        LogEntries { entries }
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LogEntry {
    pub remote_addr: String,
    pub remote_user: String,
    pub time_local: DateTime<Utc>,
    pub http_method: String,
    pub request_path: String,
    pub http_version: String,
    pub status_code: String,
    pub http_referer: String,
    pub http_user_agent: String,
}

impl LogEntry {
    pub fn new(
        remote_addr: String,
        remote_user: String,
        time_local: DateTime<Utc>,
        http_method: String,
        request_path: String,
        http_version: String,
        status_code: String,
        http_referer: String,
        http_user_agent: String,
    ) -> Self {
        LogEntry {
            remote_addr,
            remote_user,
            time_local,
            http_method,
            request_path,
            http_version,
            status_code,
            http_referer,
            http_user_agent,
        }
    }
}
