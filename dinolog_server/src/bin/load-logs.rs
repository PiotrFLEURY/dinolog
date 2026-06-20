use dinolog_server::domain::loader::load_logs_from_files;
use dotenv::dotenv;

#[tokio::main]
async fn main() {
    dotenv().ok();

    tracing_subscriber::fmt()
        .with_max_level(tracing::Level::INFO)
        .with_test_writer()
        .init();

    load_logs_from_files().await;
}
