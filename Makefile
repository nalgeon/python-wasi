.PHONY: build prepare

https://github.com/vmware-labs/webassembly-language-runtimes/releases/download//python-.wasm

TAG = python%2F3.12.0%2B20231211-040d5a6
VERSION = 3.12.0

build:
	rm -rf dist
	mkdir -p dist
	curl -L -o dist/python.wasm "https://github.com/vmware-labs/webassembly-language-runtimes/releases/download/$(TAG)/python-$(VERSION).wasm"
	node_modules/.bin/esbuild src/index.js --minify --target=es2021 --format=esm --outfile=dist/index.js

prepare:
	npm install
