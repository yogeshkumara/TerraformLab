variable "Aws_Access_key" {}
variable "Aws_Secret_key" {}
variable "Aws_Region" {
  default = "us-east-1"
}

variable "AMI" {
  type="map"
  default {
      us-east-1 = "ami-9887c6e7"
      us-west-2 = "ami-06b94666"
      eu-west-1 = "ami-0015b9ef68c77328d"
  }
}
variable "INSTANCE_USERNAME" {
  default = "centos"
}

