#!/bin/bash

sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt update

sudo apt install -y \
	git \
	openssh-client \
	build-essential \
	llvm \
	clang \
	neovim \
	stow \
	unzip \
	libnss3 \
	libatk1.0-0t64 \
	libatk-bridge2.0-0t64 \
	libcups2t64 \
	libdrm2 \
	libxkbcommon-x11-0 \
	libxcomposite1 \
	libxdamage1 \
	libxrandr2 \
	libgbm1 \
	libasound2t64 \
	nodejs \
	npm \
	rustup \
	golang-go \ 
	unzip \
	wget \
	python3 \
	python3-pip


npm install yarn

rustup default stable
cargo install tree-sitter-cli


if ! command -v uv &> /dev/null; then
	curl -lsSf https://astral.sh/uv/install.sh | sh
fi




