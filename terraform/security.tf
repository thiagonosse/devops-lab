variable "admin_ip" {
  description = "IP público autorizado a acessar SSH"
  type        = string

  validation {
    condition     = can(cidrhost("${var.admin_ip}/32", 0))
    error_message = "admin_ip deve ser um endereço IPv4 público válido, por exemplo 45.181.33.250."
  }
}

resource "aws_security_group" "web" {
  name        = "devops-lab-web-sg"
  description = "Security Group da EC2 do laboratorio DevOps"
  vpc_id      = aws_vpc.lab.id

  ingress {
    description = "SSH - administrador"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.admin_ip}/32"]
  }

  ingress {
    description = "HTTP - aplicacao web"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Saida para Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "devops-lab-web-sg"
    Environment = "lab"
    ManagedBy   = "terraform"
  }
}
