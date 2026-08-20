resource "aws_internet_gateway" "lab" {
  vpc_id = aws_vpc.lab.id

  tags = {
    Name        = "devops-lab-igw"
    Environment = "lab"
    ManagedBy   = "terraform"
  }
}
