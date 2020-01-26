provider "aws" {
  access_key = "${var.Aws_Access_key}"
  secret_key = "${var.Aws_Secret_key}"
  region = "${var.Aws_Region}" 
}
