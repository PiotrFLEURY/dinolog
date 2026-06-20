use dinolog_server::{
    domain::{loader::load_logs_from_files, repositories::user_repository::seed_admin_user},
    presentation::router::build_router,
};
use dotenv::dotenv;
use tracing::info;

#[tokio::main]
async fn main() {
    dotenv().ok();

    tracing_subscriber::fmt()
        .with_max_level(tracing::Level::INFO)
        .with_test_writer()
        .init();

    seed_admin_user().await;
    load_logs_from_files().await;

    let app = build_router();

    let bind_address = std::env::var("BIND_ADDRESS").unwrap_or_else(|_| "0.0.0.0:3000".to_string());

    let listener = tokio::net::TcpListener::bind(&bind_address).await.unwrap();
    info!("Server running on {}", bind_address);
    axum::serve(listener, app).await.unwrap();
}
