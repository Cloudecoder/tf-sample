provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "ec2" {
  count      = length(var.COMPONENTS)
  ami        = "ami-0e001c9271cf7f3b9"
  instance_type = "t2.micro"
  tags = {
    Name = var.COMPONENTS[count.index]
  }
}


 output "private_ip" {
   value = aws_instance.ec2.*.public_ip
 }