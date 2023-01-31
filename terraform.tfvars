vpc_cdr_blk = "10.0.0.0/24"
vpc_tags = {
	Name = "Dev_vpc"
	Env = "Dev_env"
}
igw_tags = {
	Name = "dev_igw"
        Env = "Dev_env"
}
subnet_cdr_blk = "10.0.0.0/24"
subnet_tags = {
	Name = "Dev_subnet"
        Env = "Dev_env"
}

route_table_tags = {
	Name = "Dev_route_table"
        Env = "Dev_env"
}
inst_ami = "ami-06984ea821ac0a879"
inst_type = "t2.micro"
inst_key_name = "KeyPairJan2022"
inst_tags = {
	Name = "Dev_Ubuntu"
	Env = "Dev_env"
	Num = 1
}

