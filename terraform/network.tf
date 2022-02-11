resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
}

resource "aws_eip" "ec2_eip" {
    instance = aws_instance.ec2_instance.id
    vpc      = true
}

output "public_ip" {
    value = [aws_eip.ec2_eip.public_ip]
}
