resource "aws_vpc" "dev_vpc" {
	cidr_block = var.vpc_cdr_blk

	tags = var.vpc_tags
}

resource "aws_internet_gateway" "dev_IGW" { 
	vpc_id = aws_vpc.dev_vpc.id
	
	tags = var.igw_tags
}

resource "aws_subnet" "dev_subnet" { 
	vpc_id = aws_vpc.dev_vpc.id
	cidr_block = var.subnet_cdr_blk
	availability_zone = "ap-south-1a"
	map_public_ip_on_launch = "true"

	tags = var.subnet_tags
		
}

resource "aws_route_table" "dev_route_table" { 
	vpc_id = aws_vpc.dev_vpc.id
	
	tags = var.route_table_tags
} 	

resource "aws_route_table_association" "dev_rt_assoc" { 
	route_table_id = aws_route_table.dev_route_table.id
	subnet_id = aws_subnet.dev_subnet.id
}	

resource "aws_route" "default_route" {
	route_table_id         = aws_route_table.dev_route_table.id
	destination_cidr_block = "0.0.0.0/0"
	gateway_id             = aws_internet_gateway.dev_IGW.id
}

resource "aws_security_group" "dev_sg" {
	name = "SG-23"
	vpc_id = aws_vpc.dev_vpc.id
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		}
	ingress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
                }
		
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
		}
	tags = { 
		Name = "dev_SG"
	}
}
resource "aws_instance" "myEc2Server" {
        ami = var.inst_ami
        instance_type = var.inst_type
        key_name = var.inst_key_name
	subnet_id = aws_subnet.dev_subnet.id
        vpc_security_group_ids = [aws_security_group.dev_sg.id]
        user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update
                sudo apt-get install apache2 -y
                sudo systemctl start apache2
                sudo systemctl enable apache2
        EOF
        tags = var.inst_tags

}

output "myEc2Server_ip" { value = aws_instance.myEc2Server.public_ip }
