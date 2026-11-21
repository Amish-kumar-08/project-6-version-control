
variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Project resource name"
  type        = string
  default     = "terraform-web"
}

variable "allowed_http_cidr" {
  description = "Allowed HTTP traffic"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ssm_instance_profile" {
  description = "Existing IAM instance profile for SSM"
  type        = string
  default     = "Terraform-EC2-SSM-Profile"
}

