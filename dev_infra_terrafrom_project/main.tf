#ec2_instance

# provider "aws" {

#   region = "us-east-1"

# }


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "web" {

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  
  #vpc_security_group_ids = ["sg-0ca568c1784e5ea9c"]
  subnet_id = aws_subnet.demo-subnet.id
  security_groups = [aws_security_group.demo-vpc-sg.id]

  tags = {

    Name = var.instance_name[count.index]

  }
  count = 2
  }


