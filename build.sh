#!/bin/sh

mkdir build
wasm-pack build --target web
terser pkg/argon2wasm.js -c -m > build/argon2wasm.js
wasm-opt -Oz pkg/argon2wasm_bg.wasm -o build/argon2wasm_bg.wasm
