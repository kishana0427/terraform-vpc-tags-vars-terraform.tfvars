variable "vpc_cdr_blk" {
	type = string
}

variable "vpc_tags" {
	type = object({
		Name = string
		Env = string
		})
}
variable "igw_tags" {
	type = object({
		Name = string
		Env = string
	})
}

variable "subnet_cdr_blk" {
	type = string
}

variable "subnet_tags" {
	type = object({
		Name = string
		Env = string
	})
}

variable "route_table_tags" {
	type = object({
		Name = string
		Env = string
	})
}
variable "inst_ami" {
	type = string
}

variable "inst_type" {
        type = string
}

variable "inst_key_name" {
        type = string
}

variable "inst_tags" {
        type = object({
		Name = string
		Env = string
		Num = number
	})
}





