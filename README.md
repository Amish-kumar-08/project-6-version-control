# AWS EC2 Web Server Deployment using Terraform

## Project Overview

This project demonstrates the deployment of a Linux-based web server on AWS using **Terraform (Infrastructure as Code)**.

The infrastructure is provisioned automatically, and an Ubuntu 24.04 LTS EC2 instance is configured to install and run the Nginx web server using a Bash User Data script.

After deployment, the instance hosts a custom HTML webpage accessible through its public IP address.

## Architecture

The project provisions the following AWS resources:

- **VPC:** Provides an isolated network environment.
- **Public Subnet:** Hosts the EC2 instance.
- **Internet Gateway:** Enables internet connectivity.
- **Route Table:** Routes internet-bound traffic through the Internet Gateway.
- **Security Group:** Allows inbound HTTP traffic on port 80.
- **EC2 Instance:** Runs Ubuntu 24.04 LTS.
- **Nginx:** Installed and configured automatically through User Data.
- **AWS Systems Manager (SSM):** Enables remote instance management.

## Technologies Used

- AWS
- Terraform
- Ubuntu 24.04 LTS
- Amazon EC2
- Amazon VPC
- AWS Security Groups
- AWS Systems Manager
- Nginx
- Bash
- HTML

## Project Structure

```text
aws-ec2-terraform-1/
│
├── main.tf
├── variables.tf
├── versions.tf
├── outputs.tf
├── user_data.sh
├── terraform.tfvars
├── .gitignore
└── README.md
```

**File descriptions:**

| File | Purpose |
|---|---|
| `main.tf` | Defines AWS infrastructure resources |
| `variables.tf` | Declares Terraform input variables |
| `versions.tf` | Configures Terraform and AWS provider versions |
| `outputs.tf` | Displays deployment outputs such as public IP and website URL |
| `user_data.sh` | Installs Nginx and creates the custom webpage |
| `terraform.tfvars` | Stores local variable values |

## Infrastructure Configuration

| Resource | Configuration |
|---|---|
| AWS Region | eu-west-1 (Ireland) |
| VPC CIDR | 10.20.0.0/16 |
| Public Subnet CIDR | 10.20.1.0/24 |
| EC2 Instance Type | t3.micro |
| Operating System | Ubuntu 24.04 LTS |
| Web Server | Nginx |
| HTTP Port | 80 |
| Root Volume | 8 GB gp3 |

## How It Works

1. Terraform initializes the AWS provider.
2. Terraform provisions the VPC and public subnet.
3. An Internet Gateway and route table provide internet connectivity.
4. A Security Group allows HTTP traffic on port 80.
5. Terraform launches an Ubuntu EC2 instance.
6. The EC2 instance executes the `user_data.sh` script during initialization.
7. The script updates packages, installs Nginx, creates a custom HTML webpage, and starts the Nginx service.
8. The website becomes accessible through the EC2 public IP address.

## Prerequisites

Before running the project, make sure you have:

- An AWS account with appropriate permissions.
- AWS CLI installed and configured.
- Terraform installed.
- An existing EC2 IAM instance profile named `Terraform-EC2-SSM-Profile`, if using the current configuration.

## Deployment Instructions

### 1. Clone the repository

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd aws-ec2-terraform-1
```

### 2. Configure AWS credentials

```bash
aws configure
```

Make sure your AWS credentials have the required permissions.

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate the configuration

```bash
terraform validate
```

### 5. Review the deployment plan

```bash
terraform plan
```

### 6. Deploy the infrastructure

```bash
terraform apply
```

Confirm the deployment when prompted.

### 7. Access the website

After deployment, retrieve the website URL:

```bash
terraform output website_url
```

Open the resulting URL in your browser.

## Verification

The deployment is successful when:

- The EC2 instance is running.
- The instance receives a public IP address.
- The Security Group allows HTTP traffic on port 80.
- Nginx is installed and running.
- The custom webpage is accessible through the public IP address.

## Deployment Screenshot

Add a screenshot of the successfully deployed webpage here.

```text
screenshots/
└── deployed-website.png
```

## Cleanup

To avoid unnecessary AWS charges after completing the assignment, remove Terraform-managed infrastructure when it is no longer required:

```bash
terraform destroy
```

Review the resources before confirming destruction.

**Note:** This command removes Terraform-managed infrastructure. It does not necessarily remove separately created IAM resources such as the instance role and instance profile.

## Learning Outcomes

Through this project, I gained practical experience with:

- Infrastructure provisioning using Terraform.
- AWS networking fundamentals.
- EC2 instance deployment and configuration.
- Automating server setup using Bash User Data.
- Configuring and hosting a website using Nginx.
- Managing Linux EC2 instances through AWS Systems Manager.

---

**Project:** AWS EC2 Web Server Deployment using Terraform  
**Region:** eu-west-1 (Ireland)
