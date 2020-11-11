# Variables
variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 14.04 Base Image"
  default     = "ami-2e1ef954"
}

# Main
terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "this" {
  ami               = var.ami_id
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"

  tags = {
    owner = "Ranjit"
    TTL   = "3d"
  }
}

# Outputs
output "public_dns" {
  value = "${aws_instance.this.public_dns}"
}
