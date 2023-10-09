output "private_subnet1_id" {
    value = aws_subnet.demo_subnet_private1.id

}

output "security_group_id" {
    value = aws_security_group.demo_traffic.id
}

