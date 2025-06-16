<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body style="font-family: Arial, sans-serif; line-height: 1.6; max-width: 900px; margin: auto;">

<h1>🚀 Scalable Infrastructure for Node.js App on AWS (Terraform + Docker + GitHub Actions)</h1>

<p>This project demonstrates how to build a <strong>secure, highly available, and automated infrastructure</strong> on AWS to deploy a containerized Node.js application using <strong>Terraform</strong>, <strong>Docker</strong>, and <strong>GitHub Actions</strong>.</p>

<hr>

<h2>📋 Objective</h2>
<p>To set up a fully automated CI/CD pipeline for a containerized Node.js app using:</p>
<ul>
  <li>Docker + ECR</li>
  <li>Terraform-managed infrastructure on AWS (VPC, EC2 ASG, ALB, RDS)</li>
  <li>GitHub Actions for CI/CD</li>
  <li>Secure secret handling via Secret Manager </li>
  <li>Logging, monitoring, and scalability</li>
</ul>

<hr>

<h2>📐 Architecture Diagram</h2>
<pre style="background: #f4f4f4; padding: 10px;">
+---------------+
|   GitHub Repo |
+-------+-------+
        |
        v
+------------------------------+
|      GitHub Actions CI/CD    |
|  - Test -> Build -> Deploy   |
+---------------+--------------+
                |
                v
      +------------------+
      |     AWS ECR      | <-- Docker image pushed
      +------------------+
                ^
                |
        user_data.sh pulls image
                |
      +------------------+        +------------------+
      |  EC2 AutoScale   +<-------+ Application Load |
      |  (LaunchTemplate)|        |   Balancer (ALB) |
      +------------------+        +------------------+
                |
        +------------------+
        |   Dockerized     |
        |  Node.js App     |
        +------------------+
                |
        +------------------+
        |     RDS (Postgres)|
        +------------------+
</pre>

<hr>

<h2>🧾 Project Structure</h2>
<pre style="background: #f4f4f4; padding: 10px;">
.
├── .github/workflows/          # GitHub Actions CI/CD pipeline
│   └── main.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.auto.tfvars
|   ├── ...
├── app/                       
│   ├── index.js
|   ├── test/
│   ├── Dockerfile
│   └── ...                   
├── README.md
</pre>

<hr>

<h2>🛠️ Tools & Technologies</h2>
<ul>
  <li>AWS EC2, ALB, Auto Scaling Group, RDS (Postgres), VPC</li>
  <li>Terraform (IaC)</li>
  <li>Docker & Amazon ECR</li>
  <li>GitHub Actions (CI/CD)</li>
  <li>AWS Secret Mnager</li>
  <li>AWS Certificate Manager</li>
  <li>CloudWatch (monitoring/logs)</li>
</ul>

<hr>

<h2>🔧 Infrastructure Provisioning (Terraform)</h2>
<p>Provisioned resources:</p>
<ul>
  <li>✅ VPC with public & private subnets</li>
  <li>✅ Internet Gateway & Route Tables</li>
  <li>✅ Security Groups: ALB (HTTP, HTTPs only), EC2 (from ALB SG)</li>
  <li>✅ ECR for image storage</li>
  <li>✅ IAM Role for EC2 (ECR + RDS access)</li>
  <li>✅ EC2 Auto Scaling Group</li>
  <li>✅ ALB Target Group + Listener</li>
  <li>✅ RDS PostgreSQL</li>
</ul>

<hr>

<h2>📦 Containerization (Docker)</h2>
<ul>
  <li>Uses Alpine/slim image</li>
  <li>Runs as non-root user</li>
  <li>Exposes port 3000</li>
</ul>

<hr>

<h2>📦 Deliverables</h2>
<ul>
  <li><code>terraform/</code>: Infrastructure as Code</li>
  <li><code>app/</code>: Node.js application + Dockerfile</li>
  <li><code>.github/workflows/</code>: GitHub Actions workflow</li>
  <li><code>README.md</code>: Project documentation</li>
</ul>
<hr>

<h2>🔁 CI/CD Pipeline (GitHub Actions)</h2>
<p><strong>Stages:</strong></p>
<ol>
  <li><strong>Test</strong>: Run Jest/Mocha</li>
  <li><strong>Build & Push</strong>: Docker image to ECR</li>
  <li><strong>Deploy</strong>: Terraform infra apply</li>
</ol>

<hr>

<h2>🛡️ Security Best Practices</h2>
<ul>
  <li>EC2 IAM Role with least privilege (ECR + SSM only)</li>
  <li>Docker runs as non-root user</li>
  <li>Secrets stored in Secret Manager</li>
  <li>Encrypted RDS</li>
  <li>HTTPS (via ACM) - Planned</li>
</ul>

<hr>

<h2>📊 Monitoring</h2>
<ul>
  <li>CloudWatch Logs (via <code>/var/log/user-data.log</code>)</li>
  <li>ALB health checks</li>
  <li>CloudWatch Alarms (CPU)</li>
  <li>Optional: Prometheus + Grafana</li>
</ul>

<hr>

<h2>▶️ Getting Started</h2>
<ol>
  <li><strong>Clone Repo</strong><br/>
    <code>git clone https://github.com/yourname/aws-nodejs-iac.git</code></li>
  <li><strong>Configure AWS Credentials</strong><br/>
    <code>aws configure</code></li>
  <li><strong>Deploy Infra</strong><br/>
    <code>cd terraform && terraform apply -auto-approve</code></li>
  <li><strong>Push Code to Main</strong> - triggers CI/CD</li>
</ol>

<hr>

<h2>👨‍💻 Author</h2>
<p><strong>Vinod Varma</strong> – DevOps Engineer | Cloud | Automation Enthusiast</p>

<hr>

<h2>📜 License</h2>
<p>MIT License</p>

</body>
</html>
