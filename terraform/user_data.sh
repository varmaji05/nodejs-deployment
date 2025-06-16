#!/bin/bash

# Log output to a file for easier debugging
exec > /var/log/user-data.log 2>&1
set -x

# Update system & install Docker + AWS CLI
apt update -y
apt install -y docker.io awscli

# Start Docker service
systemctl start docker
systemctl enable docker

# Login to Amazon ECR
aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${ecr_repo_url}

# Fetch Docker image tag from SSM Parameter Store
IMAGE=$(aws ssm get-parameter --name "/app/docker/image" --query "Parameter.Value" --output text --region ${region})

# Retry pulling image until it's available (max 10 attempts)
for i in {1..10}; do
  if docker pull "$IMAGE"; then
    echo "Image pulled successfully"
    break
  fi
  echo "Waiting for image to become available in ECR..."
  sleep 15
done

# Create .env file with application environment variables
mkdir -p /app
cat <<EOF > /app/.env
PORT=3000
DB_HOST=${db_host}
DB_USER=${db_user}
DB_PASS=${db_pass}
EOF

# Run Docker container
docker run -d --env-file /app/.env -p 3000:3000 --name nodejs-api "$IMAGE"
