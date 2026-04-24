# AWS CLI

## Overview

This script installs the AWS Command Line Interface (AWS CLI) on your system.

### What is the AWS CLI?

The AWS CLI allows you to interact with AWS services directly from the command line. It’s especially useful for automating tasks and integrating AWS operations into scripts.

### Installation

To install the AWS CLI:

1. Navigate to the `sys-installs` directory:

   ```bash
   cd sys-installs
   ```

2. Run the installation script:

   ```bash
   ./install_aws.sh
   ```

This script will:

* Download the AWS CLI binary from the official AWS source
* Install it on your system
* Prompt you to verify the installation

### Verify Installation

After the script completes, run:

```bash
aws --version
```

If installed correctly, this will display the installed AWS CLI version.

### Reference

The installation steps used in this script are based on the official ![AWS documentation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
