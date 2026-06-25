use dinolog_server::domain::loader::load_logs_from_files;
use dotenv::dotenv;
use tracing::{error, info};

#[tokio::main]
async fn main() {
    dotenv().ok();

    tracing_subscriber::fmt()
        .with_max_level(tracing::Level::INFO)
        .with_test_writer()
        .init();

    match load_logs_from_files().await {
        Ok(_) => {
            info!("Log entries loaded successfully.");
        }
        Err(e) => {
            error!("Failed to load log entries: {:?}", e);
        }
    };
}
