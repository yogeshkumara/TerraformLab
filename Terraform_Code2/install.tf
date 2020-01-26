resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQH+BoKvpk55EmxJVuR7Zjv+zoa24CXb+OaeW9BDYvngJ/Qp3WZxTcQL/IsDwrvPrriCAzbRhe8pxPctOJ7ZCbF14Svu49ZbALiJf5iZ+DVSQ2WSE7CfzaTHczAb1XW5+qHOPnclSHC7rcP+H7D/ZEUmMUiYkZB3RmxXot+h95PQ2COnyiobY3FJZn9qpMG9Xz6J5oMfjTf6qsneUC1GK9LzEZJeVIAUBiRhR73hDRYU1k0T+ttEb/VuT7D5mFXPY6KHUMdxT5koqBRNuMJsueTQbr/bHZjQRxIFyfw+gYbAUvz+s6JdAChOKXGNiD0bfOzi44SqyC3p87+VvZWbyJ root@Datascience.localdomain"
}

resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"

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
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
