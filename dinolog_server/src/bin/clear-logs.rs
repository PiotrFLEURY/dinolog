use dinolog_server::data::source::clear_log_entries;
use dotenv::dotenv;
use tracing::{error, info};

#[tokio::main]
async fn main() {
    dotenv().ok();

    tracing_subscriber::fmt()
        .with_max_level(tracing::Level::INFO)
        .with_test_writer()
        .init();

    match clear_log_entries().await {
        Ok(_) => {
            info!("Old log entries cleared successfully.");
        }
        Err(e) => {
            error!("Failed to clear old log entries: {:?}", e);
        }
    };
}
