FROM rust:1.95.0-slim-trixie AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y pkg-config libssl-dev && rm -rf /var/lib/apt/lists/*

COPY Cargo.toml Cargo.lock ./
COPY src ./src
RUN cargo build --release

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y ca-certificates libssl3 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /app/target/release/dinolog_server .
COPY --from=builder /app/target/release/init-db .
COPY --from=builder /app/target/release/clear-logs .
COPY --from=builder /app/target/release/load-logs .

EXPOSE 3000

CMD ["sh", "-c", "./init-db && ./dinolog_server"]