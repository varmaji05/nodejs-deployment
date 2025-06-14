#!/bin/bash
apt update -y
apt install -y docker.io
usermod -aG docker ubuntu
systemctl enable docker

apt install -y docker.io docker-compose git -y
systemctl enable docker
systemctl start docker

# Clone your GitHub repo (replace with your actual repo URL)
cd /home/ubuntu
git clone https://github.com/varmaji05/nodejs-deployment.git
cd app

# Create the .env file with dynamic values passed from Terraform
cat <<EOF > .env
PORT=3000
DB_HOST=${db_host}
DB_USER=${db_user}
DB_PASS=${db_pass}
EOF

# Start Docker container
docker-compose up -d
