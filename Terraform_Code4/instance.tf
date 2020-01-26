

resource "aws_instance" "testsystem1" {
    ami = "${lookup(var.AMI, var.Aws_Region)}"
    instance_type = "t2.micro"
    user_data = "${file("script.sh")}"
    key_name = "devops"
    vpc_security_group_ids = ["${aws_security_group.web_sg1.id}"]
    subnet_id = "${aws_subnet.main.id}" 
 
    tags = {
        Name = "testsystem"
    }

}

resource "aws_security_group" "web_sg1" {
  name        = "web_sg1"
  description = "Allow http traffic"
  vpc_id      = "${aws_vpc.main_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "main_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.vpc_tenency}"

  tags {
    Name  = "main-vpc"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main_vpc.id}"
  cidr_block = "192.50.1.0/24"

  tags = {
    Name = "Main"
  }
}
