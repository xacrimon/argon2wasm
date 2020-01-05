#!/bin/sh

mkdir build
wasm-pack build
terser pkg/argon2wasm.js -c -m > build/argon2.js
wasm-opt -Oz pkg/argon2wasm_bg.wasm -o build/argon2wasm_bg.wasm
