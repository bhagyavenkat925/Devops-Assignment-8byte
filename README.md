#  DevOps Assignment – Octa Byte AI Pvt Ltd

This repository contains a comprehensive DevOps solution built on AWS using Terraform and GitHub Actions. It demonstrates infrastructure provisioning, automated deployment, monitoring, and logging—all aligned with best practices.

---

##  Part 1: Infrastructure Provisioning

###  Resources Provisioned
- VPC with public and private subnets across multiple AZs
- EC2 instance for application hosting
- RDS (PostgreSQL) in private subnet
- Application Load Balancer (ALB)
- Security Groups for SSH, HTTP, and DB access

###  Terraform Highlights
- Modular design for VPC, EC2, RDS, SG, and ALB
- `variables.tf` for configurable parameters
- Remote state management enabled
- Output values for key resources (ALB DNS, EC2 IP, DB endpoint)

---

##  Part 2: Deployment Automation (CI/CD)

###  GitHub Actions Workflow
- **Triggers**: On PR creation, push to `master`, and manual dispatch
- **Jobs**:
  - `test`: Runs unit tests using Node.js
  - `build-and-push`: Builds Docker image and pushes to Docker Hub
  - `scan`: Scans image for vulnerabilities using Trivy
  - `deploy-staging`: SSH deploys to EC2 with secure environment variables
  - `approve-prod`: Manual approval gate for production
  - `post-deploy`: Cleans up unused Docker resources
  - `notify`: Sends Slack alert on failure

---

##  Part 3: Monitoring and Logging

###  Metrics via CloudWatch
- EC2: CPU, memory, disk
- RDS: connections, CPU, latency
- ALB: request count, errors, latency

###  Dashboards
- **Infrastructure Dashboard**: EC2, RDS, ALB metrics
- **Application Dashboard**: Request rate, error rate, latency

###  Logging
- CloudWatch Agent streams:
  - Application logs
  - System logs
  - Access logs

---

##  Part 4: Security & Best Practices

###  Security Measures
- Minimal ports open in SGs
- RDS in private subnet
- Secrets managed via GitHub repository secrets

###  Cost Optimization
- t3.micro instances for dev workloads
- ALB health checks and target groups
- RDS autoscaling disabled for simplicity

###  Backup & Secret Management
- S3-based Terraform state backup
- Secrets injected securely via CI/CD

---

##  Approach & Notes

###  Architecture Decisions
- Modular Terraform for scalability
- Native AWS services for observability and cost control
- GitHub Actions for seamless CI/CD integration

###  Challenges & Resolutions
- EC2 metrics visibility → solved via CloudWatch Agent
- Log streaming errors → resolved with IAM role adjustments
- Dashboard clarity → improved with widget grouping and labeling

---

## Submission Details

- GitHub Repo: [Devops-Assignment-8byte](https://github.com/bhagyavenkat925/Devops-Assignment-8byte.git)
- Contact: ab@8byte.ai
