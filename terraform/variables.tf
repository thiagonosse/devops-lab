variable "ami_id" {
  description = "AMI Ubuntu 24.04 LTS"
  type        = string
  default     = "ami-052355af2a014bd2c"
}

variable "instance_type" {
  description = "Tipo da instancia EC2"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Nome da instancia EC2"
  type        = string
  default     = "devops-lab-ec2"
}
