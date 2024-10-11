provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_instance" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"               # Free tier eligible
  key_name      = "rpskeypair"          # Replace with your key pair name

  security_groups = [aws_security_group.web_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker -y
              service docker start
              docker run -d -p 80:5000 danpuz7/flaskprojectrps
              EOF
}

output "instance_ip" {
  value = aws_instance.app_instance.public_ip
}

