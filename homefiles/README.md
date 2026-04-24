# Bash Aliases

## Overview

This directory contains a `.bash_aliases` file along with a helper script to install it.

### What is `.bash_aliases`?

The `.bash_aliases` file lets you define custom shorthand commands (aliases) for frequently used terminal commands, making them quicker and easier to run.

### Installation

To install the aliases:

1. Navigate to the `homefiles` directory:

   ```bash
   cd homefiles
   ```

2. Run the setup script:

   ```bash
   ./alias_setup.sh
   ```

This script will:

* Copy the provided `.bash_aliases` file to your home directory (overwriting the existing one, if present)
* Prompt you to reload your shell configuration

### Apply Changes

After running the script, reload your shell configuration with:

```bash
source ~/.bashrc
```

Your new aliases should now be active.
