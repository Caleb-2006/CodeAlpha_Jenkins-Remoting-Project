variable "subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "controller_sg_id" {
  description = "Security group ID for the Jenkins Controller"
  type        = string
}

variable "agent_sg_id" {
  description = "Security group ID for the Jenkins Agent"
  type        = string
}