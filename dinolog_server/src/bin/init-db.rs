use dinolog_server::data::source::initialize_database;
use dotenv::dotenv;
use tracing::{error, info};

#[tokio::main]
async fn main() {
    dotenv().ok();

    tracing_subscriber::fmt()
        .with_max_level(tracing::Level::INFO)
        .with_test_writer()
        .init();

    match initialize_database().await {
        Ok(_) => {
            info!("Database initialized successfully.");
        }
        Err(e) => {
            error!("Failed to initialize the database: {:?}", e);
        }
    };
}
