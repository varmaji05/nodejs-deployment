#!/bin/bash
# Update and install Docker
apt-get update -y
apt-get install -y docker.io

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Install AWS CLI if needed (optional if AMI already includes it)
apt-get install -y awscli

# Login to Amazon ECR
aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${ecr_repo_url}

# Pull and run Docker container WITHOUT .env file
docker pull ${ecr_repo_url}:latest
docker run -d \
  -e DB_HOST=${db_host} \
  -e DB_USER=${db_user} \
  -e DB_PASS=${db_pass} \
  -p 3000:3000 \
  --name nodejs-api \
  ${ecr_repo_url}:latest
