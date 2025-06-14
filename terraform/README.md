# 🚀 Terraform AWS Infrastructure as Code (IaC)

This project provisions a complete AWS infrastructure using Terraform, structured into modular and understandable `.tf` files. It supports running Docker containers on EC2 using CI/CD pipelines (like GitHub Actions).

---

## 📦 Components

The following AWS resources are provisioned:

- **VPC** with public and private subnets
- **Internet Gateway** and **Route Tables**
- **Security Groups** for EC2, RDS, and ALB
- **EC2 Launch Template** + **Auto Scaling Group** behind an **Application Load Balancer**
- **Amazon RDS** (PostgreSQL or MySQL)
- **ECR (Elastic Container Registry)** for Docker image storage
- **IAM Roles & Policies** with least privilege
- **User Data** script for bootstrapping EC2 with Docker
- **Outputs** for key resources like ALB DNS, RDS endpoint, etc.

---

## 📁 File Structure

| File               | Purpose                                      |
|--------------------|----------------------------------------------|
| `provider.tf`       | Sets AWS provider and region                 |
| `variables.tf`      | Declares all input variables                 |
| `vpc.tf`            | Creates VPC                                  |
| `subnet.tf`         | Creates public and private subnets           |
| `internet_gateway.tf` | Attaches Internet Gateway to the VPC     |
| `route_table.tf`    | Public and private route tables              |
| `security.tf`       | Security groups for EC2, ALB, RDS            |
| `alb.tf`            | Application Load Balancer, Target Group, Listener |
| `ec2.tf`            | Launch Template and Auto Scaling Group       |
| `ecr.tf`            | ECR repository for storing Docker images     |
| `rds.tf`            | RDS instance (PostgreSQL/MySQL)              |
| `iam.tf`            | IAM roles and instance profile               |
| `user_data.sh`      | Script to install Docker and pull image      |
| `output.tf`         | Useful outputs (ALB DNS, RDS endpoint)       |

---

## 🔧 Prerequisites

- Terraform ≥ 1.3
- AWS CLI with credentials configured
- Docker image pushed to ECR (for EC2 to pull)
- GitHub Actions (for CI/CD) configured if desired

---

## 🚀 Usage

```bash
# Initialize Terraform
terraform init

# Preview the changes
terraform plan

# Apply the infrastructure
terraform apply
