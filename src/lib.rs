use wasm_bindgen::prelude::*;
use argon2::Config;

#[global_allocator]
static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

#[wasm_bindgen]
pub fn hash(password: &str) -> String {
    let config = Config::default();
    let bytes = argon2::hash_raw(password.as_bytes(), &[], &config).unwrap();
    hex::encode(&bytes)
}
