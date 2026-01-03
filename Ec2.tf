# Key Pair
resource "aws_key_pair" "shubh_key" {
  key_name   = "terra_key_Ec2"
  public_key = file("terra_key_Ec2.pub")
}

# Default VPC
resource "aws_default_vpc" "shubh_default_vpc" {}

# Security Group
resource "aws_security_group" "shubh_security_group" {
  name        = "Automated_Sg"
  description = "allow inbound and outbound traffic"
  vpc_id      = aws_default_vpc.shubh_default_vpc.id

  # inbound rule SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh open"
  }

  # inbound rule HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "open http"
  }

  # outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open"
  }
}

# EC2 Instance
resource "aws_instance" "My_shubh_instances" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instances_type
  key_name      = aws_key_pair.shubh_key.key_name

  user_data = file("nginx.sh")

  vpc_security_group_ids = [
    aws_security_group.shubh_security_group.id
  ]

  root_block_device {
    volume_size = var.ec2_root_block_device
    volume_type = "gp3"
  }

  tags = {
    Name = "terraform_automate_instances"
  }
}
