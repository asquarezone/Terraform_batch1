resource "aws_vpc" "ntier" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "ntier"
  }
}

resource "aws_subnet" "web" {
    vpc_id = aws_vpc.ntier.id
    cidr_block = "192.168.1.0/24"
    tags = {
      Name = "web"
    }
  
}