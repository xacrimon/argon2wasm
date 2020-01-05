#!/bin/sh

mkdir build
wasm-pack build
terser pkg/argon2wasm.js -c -m > build/argon2.js
wasm2js -Oz pkg/argon2wasm_bg.wasm > pkg/argon2_bg.js
terser pkg/argon2_bg.js -c -m > build/argon2_bg.js
