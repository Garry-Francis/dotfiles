# Vim Configuration

## Overview

This script sets up your Vim environment by installing a predefined `.vimrc` configuration and managing plugins using Vundle.

### What does this script do?

The script automates the process of configuring Vim by:

* Copying a custom `.vimrc` file to your home directory
* Installing the Vundle plugin manager (if not already installed)
* Installing all Vim plugins defined in the `.vimrc` file

### Installation

To set up Vim with this configuration:

1. Navigate to the `vim-config` directory:

   ```bash
   cd vim-config
   ```

2. Run the setup script:

   ```bash
   ./vim_setup.sh
   ```

### What happens during setup?

* The script locates its own directory and looks for a `.vimrc` file
* If found, it copies `.vimrc` to your home directory (`~/.vimrc`)
* It checks whether Vundle is already installed:

  * If not, it clones Vundle into `~/.vim/bundle/`
  * If already installed, it skips this step
* Finally, it launches Vim to install all plugins specified in `.vimrc`

### Notes

* Running this script will overwrite any existing `~/.vimrc` file
* Plugin installation is handled automatically via Vundle using:

  ```bash id="9x2kq1"
  vim +PluginInstall +qall
  ```
