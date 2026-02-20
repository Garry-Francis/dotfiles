#!/usr/bin/env bash

set -e

# Get the directory where this script is located
# Line to get repo directory sourced from ChatGPT
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Variable for repo .vimrc
VIMRC_SOURCE="$REPO_DIR/.vimrc"
# Variable for system .vimrc
VIMRC_TARGET="$HOME/.vimrc"
# Variable for vundle clone directory
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

echo "Starting Vim setup..."

# Copy .vimrc to home directory
if [ -f "$VIMRC_SOURCE" ]; then
    echo "Copying .vimrc to $HOME..."
    cp "$VIMRC_SOURCE" "$VIMRC_TARGET"
else
    echo "Error: .vimrc not found in repository directory."
    exit 1
fi

# Install Vundle if not already installed
if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Installing Vundle..."
    mkdir -p "$HOME/.vim/bundle"
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
else
    echo "Vundle already installed. Skipping..."
fi

# Install plugins from .vimrc using Vundle
echo "Installing Vim plugins..."
vim +PluginInstall +qall

echo "Vim setup complete!"
