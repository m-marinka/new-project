resource "aws_instance" "ec2_instance" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = var.ami_key_pair_name
    security_groups = [aws_security_group.ec2_security.id]
    subnet_id = aws_subnet.ec2_subnet.id
    
    tags = {
        Name  = "TerraformInst"
    }
}