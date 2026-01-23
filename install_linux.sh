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
	libasound2t64


if ! command -v rustup &> /dev/null; then
	curl --proto '=https' --tlsv1.2 -sSF https//sh.rustup.rs | sh -s -- -y
fi


if ! command -v uv &> /dev/null; then
	curl -lsSf https://astral.sh/uv/install.sh | sh
fi


