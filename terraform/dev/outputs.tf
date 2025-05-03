output "vpc_id" {
  description = "ID de la VPC"
  value       = aws_vpc.misdatos_vpc.id
}

output "public_subnet_id" {
  description = "ID de la subred pública"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "ID de la subred privada"
  value       = aws_subnet.private_subnet.id
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.misdatos_igw.id
}