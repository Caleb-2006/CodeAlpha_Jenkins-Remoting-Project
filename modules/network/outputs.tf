output "vpc_id" {
  value = aws_vpc.jenkins_vpc.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "controller_sg_id" {
  value = aws_security_group.jenkins_controller_sg.id
}

output "agent_sg_id" {
  value = aws_security_group.jenkins_agent_sg.id
}