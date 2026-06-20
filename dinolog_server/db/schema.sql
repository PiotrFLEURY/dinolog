CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS log_entries (
    id SERIAL PRIMARY KEY,
    remote_addr VARCHAR(45) NOT NULL,
    remote_user TEXT,
    time_local TIMESTAMP WITH TIME ZONE NOT NULL,
    http_method TEXT NOT NULL,
    request_path TEXT NOT NULL,
    http_version TEXT NOT NULL,
    status_code TEXT NOT NULL,
    http_referer TEXT,
    http_user_agent TEXT
);