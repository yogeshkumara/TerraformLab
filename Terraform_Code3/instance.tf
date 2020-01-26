

resource "aws_instance" "testsystem" {
    ami = "${lookup(var.AMI, var.Aws_Region)}"
    instance_type = "t2.micro"
    user_data = "${file("script.sh")}"
    key_name = "devops"
    security_groups = ["CentOS 7 -x86_64- - with Updates HVM-1805_01-AutogenByAWSMP-5"]

    tags = {
        Name = "testsystem"
    }
}
