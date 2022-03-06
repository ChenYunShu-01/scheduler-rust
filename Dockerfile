FROM rust:latest

WORKDIR /usr/src/scheduler-rust

COPY . .

RUN cargo build --release

CMD cargo run