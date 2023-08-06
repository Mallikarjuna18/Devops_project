provider "aws" {
    region = "ap-south-1"
}
resource "aws_security_group" "inbound_rules" {
    name = "aws_security_group"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8081
        to_port = 8081
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "Django" {
    
    ami = "ami-0ded8326293d3201b"
    instance_type = "t2.small"
    key_name = "key"
    vpc_security_group_ids = [ aws_security_group.inbound_rules.id ]
    tags={
        name="Django_demo"
    }
  
}