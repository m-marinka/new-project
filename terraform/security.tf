resource "aws_security_group" "ec2_security" {
    name = "ec2_security"
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "security-group"

    }

    //input rule - allow ports 22, 80, 8080
    ingress {
        cidr_blocks = [
        "0.0.0.0/0"
        ]

        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = [
        "0.0.0.0/0"
        ]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = [
        "0.0.0.0/0"
        ]
        from_port = 80
        to_port = 80
        protocol = "udp"
    }

    ingress {
        cidr_blocks = [
        "0.0.0.0/0"
        ]
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
    }

    ingress {
        cidr_blocks = [
        "0.0.0.0/0"
        ]
        from_port = 8080
        to_port = 8080
        protocol = "udp"
    }

    //output rule - allow all
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}