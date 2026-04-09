#!/bin/bash

# 1. Check Effective User ID
if [ "$EUID" -ne 0 ]; then
  echo "Error: This script requires root or sudo privileges."
  exit 1
fi

# 2. Check for apt package manager
if ! command -v apt &> /dev/null; then
  echo "Error: This script requires the 'apt' package manager."
  exit 1
fi

# 3. Inform the user and get confirmation
echo "This script will install the OFFICIAL AWS CLI v2 (64-bit) for Linux."
echo "Dependencies (unzip, curl) will be managed via apt."
read -p "Do you wish to proceed? (y/n): " confirm

if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
  echo "Installation cancelled by user."
  exit 0
fi

# 4. Check for name conflicts
if command -v aws &> /dev/null; then
  echo "Conflict Detected: The command 'aws' already exists on this system."
  echo "Location: $(command -v aws)"
  echo "Output: $(aws --version 2>&1 || aws)"
  echo "To prevent overwriting existing behavior, this script will now exit."
  exit 1
fi

# 5. Silent Installation
echo "Preparing environment and installing AWS CLI v2..."

# Ensure unzip and curl are present
apt-get update -qq
apt-get install -y unzip curl > /dev/null

# Download and install from the AWS binary
curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install > /dev/null

# Cleanup installation files
rm -rf awscliv2.zip ./aws

# 6. Completion message
if [ $? -eq 0 ]; then
  echo "------------------------------------------------"
  echo "Installation complete!"
  echo "To verify the installation, run the following command:"
  echo "  aws --version"
  echo "------------------------------------------------"
else
  echo "An error occurred during the binary installation."
  exit 1
fi
