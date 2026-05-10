output "jenkins_controller_ip" {
  value = module.compute.controller_public_ip
}

output "jenkins_agent_ip" {
  value = module.compute.agent_public_ip
}