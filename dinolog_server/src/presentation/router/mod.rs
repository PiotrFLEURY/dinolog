use axum::{
    Router,
    routing::{get, post},
};

use crate::presentation::handlers::{handle_get_logs, handle_post_count_logs};

pub fn build_router() -> Router {
    Router::new()
        .route("/logs", get(handle_get_logs))
        .route("/logs/count", post(handle_post_count_logs))
}
