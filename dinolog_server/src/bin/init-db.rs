use dinolog_server::data::source::initialize_database;
use dotenv::dotenv;

#[tokio::main]
async fn main() {
    dotenv().ok();

    tracing_subscriber::fmt()
        .with_max_level(tracing::Level::INFO)
        .with_test_writer()
        .init();

    initialize_database().await;
}
