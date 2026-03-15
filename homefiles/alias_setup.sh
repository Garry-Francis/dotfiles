#!/usr/bin/env bash

set -e

# Get the directory where this script is located
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Variable for repo .bash_aliases
BASH_ALIASES_SOURCE="$REPO_DIR/.bash_aliases"

# Variable for system .bash_aliases
BASH_ALIASES_TARGET="$HOME/.bash_aliases"

echo "Starting bash aliases setup..."

# Copy .bash_aliases to home directory
if [ -f "$BASH_ALIASES_SOURCE" ]; then
    echo "Copying .bash_aliases to $HOME..."
    cp "$BASH_ALIASES_SOURCE" "$BASH_ALIASES_TARGET"
else
    echo "Error: .bash_aliases not found in repository directory."
    exit 1
fi

echo "Bash aliases setup complete! Remember to reload your environment with source .bashrc while inside your home directory."
