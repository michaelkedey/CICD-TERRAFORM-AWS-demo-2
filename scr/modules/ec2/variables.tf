variable "instance_type"{
    type = map(string)
    default = {
        test = "t2.micro",
        production = "m5.large"
    }
    description = "instance type for demo server"
}

variable subnet_id{
    description="subnet id to launch instance server in"
    type = string
}

variable "ip"{
    default = {
        on = true,
        off = false
    }
    type = map(bool)
}

variable "security_groups"{
    type = set(string)
    description = "security group to deploy server in"
}

variable "names"{
    default = {
        server_name = "demo_server"
    }
    type = map(string)
}

variable "key_name"{
    default = "ginakey"
    type = string
}