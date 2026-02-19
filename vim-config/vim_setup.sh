#!/usr/bin/env bash

set -e

# Get the directory where this script is located (repo root)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIMRC_SOURCE="$REPO_DIR/.vimrc"
VIMRC_TARGET="$HOME/.vimrc"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

echo "Starting Vim setup..."

# 1. Copy .vimrc to home directory
if [ -f "$VIMRC_SOURCE" ]; then
    echo "Copying .vimrc to $HOME..."
    cp "$VIMRC_SOURCE" "$VIMRC_TARGET"
else
    echo "Error: .vimrc not found in repository directory."
    exit 1
fi

# 2. Install Vundle if not already installed
if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Installing Vundle..."
    mkdir -p "$HOME/.vim/bundle"
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
else
    echo "Vundle already installed. Skipping..."
fi

# 3. Install plugins from .vimrc using Vundle
echo "Installing Vim plugins..."
vim +PluginInstall +qall

echo "Vim setup complete!"
