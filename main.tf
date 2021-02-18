

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "var.key_name"
  public_key = "${tls_private_key.example.public_key_openssh}"
}


resource "aws_instance" "example" {
ami = "ami-005383956f2e5fb96"
instance_type = "t2.micro"
tags = {
  name = "TESTVM"
  }
}
