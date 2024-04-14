#! /bin/bash

# Download the GPG key
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey
# Add the GPG key
sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

# Download the APT list
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list
# Add the GPG key
sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g'
# Add the APT list
sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

# Refresh the APT list
sudo apt update

# Install the NVIDIA Container Toolkit packages
sudo apt-get install -y nvidia-container-toolkit
