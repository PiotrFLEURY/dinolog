use axum::{
    Router, middleware,
    routing::{get, post},
};

use crate::presentation::{
    handlers::auth::handle_login,
    handlers::{handle_get_logs, handle_post_count_logs},
    middleware::auth::jwt_auth_middleware,
};

pub fn build_router() -> Router {
    let protected = Router::new()
        .route("/logs", get(handle_get_logs))
        .route("/logs/count", post(handle_post_count_logs))
        .route_layer(middleware::from_fn(jwt_auth_middleware));

    Router::new()
        .route("/auth/login", post(handle_login))
        .merge(protected)
}
