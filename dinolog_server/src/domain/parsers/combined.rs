use crate::domain::models::LogEntry;
use chrono::DateTime;

///
/// nginx combined log format regex pattern
///
const LOG_PATTERN: &str =
    r#"^(\S+) - (\S+) \[([^\]]+)\] "(\S+) (.*?) (\S+)" (\d{3}) (\d+) "([^"]*)" "([^"]*)"$"#;

// 12/Jun/2026:13:12:06 +0000
const DATE_TIME_FORMAT: &str = "%d/%b/%Y:%H:%M:%S %z";

///
/// Parses log files in the nginx combined log format and returns a vector of LogEntry structs.
///
pub fn parse_combined_logs(file_path: &str) -> Vec<LogEntry> {
    let mut entries: Vec<LogEntry> = Vec::new();

    let log_content = std::fs::read_to_string(file_path).expect("Failed to read log file");
    let log_content_lines: Vec<&str> = log_content.lines().collect();

    let regular_expression =
        regex::Regex::new(LOG_PATTERN).expect("Unable to build regex from pattern");

    for line in log_content_lines {
        let cap: Option<regex::Captures<'_>> = regular_expression.captures(line);

        if cap.is_none() {
            // SSL Handshake requests or other non-standard log lines may not match the regex pattern.
            // We can choose to skip these lines or handle them differently.
            continue;
        }

        let cap = cap.unwrap();
        let remote_addr = cap.get(1).map_or("", |m| m.as_str());
        let remote_user = cap.get(2).map_or("", |m| m.as_str());
        let time_local = cap.get(3).map_or("", |m| m.as_str());
        let http_method = cap.get(4).map_or("", |m| m.as_str());
        let request_path = cap.get(5).map_or("", |m| m.as_str());
        let http_version = cap.get(6).map_or("", |m| m.as_str());
        let status_code = cap.get(7).map_or("", |m| m.as_str());
        // The 8th capture group is the body bytes sent, which we are not using.
        let http_referer = cap.get(9).map_or("", |m| m.as_str());
        let http_user_agent = cap.get(10).map_or("", |m| m.as_str());

        let log_entry = LogEntry::new(
            remote_addr.to_string(),
            remote_user.to_string(),
            DateTime::parse_from_str(time_local, DATE_TIME_FORMAT)
                .unwrap()
                .with_timezone(&chrono::Utc),
            http_method.to_string(),
            request_path.to_string(),
            http_version.to_string(),
            status_code.to_string(),
            http_referer.to_string(),
            http_user_agent.to_string(),
        );

        entries.push(log_entry);
    }

    entries
}
