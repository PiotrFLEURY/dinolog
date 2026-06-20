use axum::{Json, http::StatusCode};

use crate::{
    domain::repositories::user_repository::authenticate,
    presentation::handlers::dto::{LoginRequest, LoginResponse},
};

pub async fn handle_login(
    Json(payload): Json<LoginRequest>,
) -> Result<Json<LoginResponse>, StatusCode> {
    authenticate(&payload.username, &payload.password)
        .await
        .map(|token| Json(LoginResponse { token }))
        .map_err(|_| StatusCode::UNAUTHORIZED)
}
