use dinolog_server::data::source::clear_log_entries;
use dotenv::dotenv;

#[tokio::main]
async fn main() {
    dotenv().ok();

    tracing_subscriber::fmt()
        .with_max_level(tracing::Level::INFO)
        .with_test_writer()
        .init();

    clear_log_entries().await;
}
