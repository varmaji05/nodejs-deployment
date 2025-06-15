#!/bin/bash

apt update -y
apt install -y docker.io

systemctl start docker
systemctl enable docker

# Login to ECR
aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${ecr_repo_url}

# Pull image from ECR
docker pull ${ecr_repo_url}:latest

# Write .env file
mkdir -p /app
cat <<EOF > /app/.env
PORT=3000
DB_HOST=${db_host}
DB_USER=${db_user}
DB_PASS=${db_pass}
EOF

# Run the app container
docker run -d --env-file /app/.env -p 3000:3000 --name nodejs-api ${ecr_repo_url}:latest
