resource "aws_key_pair" "jenkins_auth" {
  key_name   = "jenkins-task-key"
  public_key = file("${path.root}/jenkins_key.pub")
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "jenkins_controller" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro" # Free tier eligible
  key_name = aws_key_pair.jenkins_auth.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.controller_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "jenkins-controller"
  }
}

resource "aws_instance" "jenkins_agent" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  key_name = aws_key_pair.jenkins_auth.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.agent_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "jenkins-agent"
  }
}