use wasm_bindgen::prelude::*;
use argon2::Config;

#[global_allocator]
static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

fn salt(input: &[u8]) -> Vec<u8> {
    let mut bytes = Vec::with_capacity(input.len());
    for i in 0..input.len() {
        let prev = input[i.wrapping_sub(1) % input.len()];
        let mixed = input[i].wrapping_pow(prev as u32);
        bytes.push(mixed);
    }
    bytes
}

#[wasm_bindgen]
pub fn hash(password: &str) -> String {
    let salt = salt(password.as_bytes());
    let config = Config::default();
    let bytes = argon2::hash_raw(password.as_bytes(), &salt, &config).unwrap();
    hex::encode(&bytes)
}
