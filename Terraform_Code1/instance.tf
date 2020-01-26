

resource "aws_instance" "testsystem" {
    ami = "${lookup(var.AMI, var.Aws_Region)}"
    instance_type = "t2.micro"

    tags = {
        Name = "testsystem"
    }
provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
}
connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("/home/compozed/Downloads/devops.pem")}"
}
}
