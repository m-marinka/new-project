resource "aws_subnet" "ec2_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "subnet"
    }
}

resource "aws_internet_gateway" "ec2_gateway" {
    vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "ec2_table" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ec2_gateway.id
    }
}

resource "aws_route_table_association" "ec2_route_table_association" {
    subnet_id      = aws_subnet.ec2_subnet.id
    route_table_id = aws_route_table.ec2_table.id
}