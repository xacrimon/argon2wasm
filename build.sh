#!/bin/sh

mkdir build
wasm-pack build
terser pkg/argon2wasm.js -c -m > build/argon2.js
wasm-opt -Oz pkg/argon2wasm_bg.wasm -o pkg/argon2wasm_bg_optimized.wasm
wasm2js pkg/argon2wasm_bg_optimized.wasm > pkg/argon2_bg.js
terser pkg/argon2_bg.js -c -m > build/argon2_bg.js