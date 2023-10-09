resource "aws_instance" "name" {
    instance_type = "${var.instance_type}"["test"]
    ami = data.aws_ami.latest_ubuntu
    subnet_id = var.subnet_id
    associate_public_ip_address = var.ip["on"]
    security_groups = var.security_groups
    user_data = "${path.module}/apache_ssh_config"
    provider = aws.demo
    tags = {Name = var.names["server_name"]}
    key_name = var.key_name
}

