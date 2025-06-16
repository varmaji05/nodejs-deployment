#!/bin/bash
# Update and install Docker on Ubuntu
apt-get update -y
apt-get install -y docker.io

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Login to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${ecr_repo_url}

# Pull and run the Docker image
docker pull ${ecr_repo_url}:latest
docker run -d --env-file /app/.env -p 3000:3000 --name nodejs-api ${ecr_repo_url}:latest
