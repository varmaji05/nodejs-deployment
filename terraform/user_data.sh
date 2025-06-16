#!/bin/bash

# Update packages and install dependencies
sudo apt-get update -y
sudo apt-get install -y curl unzip ca-certificates gnupg lsb-release


# Install Docker (official method for Ubuntu 24.04)
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws

# Login to ECR
aws ecr get-login-password --region ${region} | \
  sudo docker login --username AWS --password-stdin ${ecr_repo_url}

# Pull and run the Docker image
sudo docker pull ${ecr_repo_url}:latest

sudo docker run -d \
  -e DB_HOST=${db_host} \
  -e DB_USER=${db_user} \
  -e DB_PASS=${db_pass} \
  -p 3000:3000 \
  --name nodejs-api \
  ${ecr_repo_url}:latest
