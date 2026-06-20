use argon2::{
    Argon2,
    password_hash::{PasswordHash, PasswordHasher, PasswordVerifier, SaltString, rand_core::OsRng},
};
use jsonwebtoken::{EncodingKey, Header, encode};
use serde::{Deserialize, Serialize};
use std::time::{SystemTime, UNIX_EPOCH};
use tracing::info;

use crate::data::source::{find_user_by_username, upsert_admin_user};

#[derive(Debug, Serialize, Deserialize)]
pub struct Claims {
    pub sub: String,
    pub exp: usize,
}

pub fn hash_password(password: &str) -> String {
    let salt = SaltString::generate(&mut OsRng);
    Argon2::default()
        .hash_password(password.as_bytes(), &salt)
        .expect("Failed to hash password")
        .to_string()
}

fn verify_password(password: &str, hash: &str) -> bool {
    let parsed_hash = PasswordHash::new(hash).expect("Invalid password hash format");
    Argon2::default()
        .verify_password(password.as_bytes(), &parsed_hash)
        .is_ok()
}

fn generate_jwt(username: &str) -> Result<String, &'static str> {
    let secret =
        std::env::var("JWT_SECRET").expect("JWT_SECRET environment variable must be set");

    let exp = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_secs() as usize
        + 86400; // 24 hours

    let claims = Claims {
        sub: username.to_string(),
        exp,
    };

    encode(
        &Header::default(),
        &claims,
        &EncodingKey::from_secret(secret.as_bytes()),
    )
    .map_err(|_| "Failed to generate JWT token")
}

pub async fn authenticate(username: &str, password: &str) -> Result<String, &'static str> {
    let user = find_user_by_username(username)
        .await
        .ok_or("Invalid credentials")?;

    if !verify_password(password, &user.password_hash) {
        return Err("Invalid credentials");
    }

    generate_jwt(username)
}

pub async fn seed_admin_user() {
    let username = std::env::var("ADMIN_USERNAME").unwrap_or_else(|_| "admin".to_string());
    let password =
        std::env::var("ADMIN_PASSWORD").expect("ADMIN_PASSWORD environment variable must be set");

    let hash = hash_password(&password);
    upsert_admin_user(&username, &hash).await;
    info!("Admin user '{}' ready", username);
}
