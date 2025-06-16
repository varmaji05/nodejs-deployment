#!/bin/bash
# Install Docker if not already installed
yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker

# Login to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${ecr_repo_url}

# Pull and run the latest image with env file (assumes /app/.env is included in AMI or pulled from S3)
docker pull ${ecr_repo_url}:latest
docker run -d --env-file /app/.env -p 3000:3000 --name nodejs-api ${ecr_repo_url}:latest
