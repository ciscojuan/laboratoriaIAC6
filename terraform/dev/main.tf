# Configuración del proveedor AWS
provider "aws" {
  region = var.region
}

# Creación de la VPC
resource "aws_vpc" "misdatos_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }
}

# Creación de la Internet Gateway
resource "aws_internet_gateway" "misdatos_igw" {
  vpc_id = aws_vpc.misdatos_vpc.id

  tags = {
    Name        = "${var.environment}-igw"
    Environment = var.environment
  }
}

# Creación de la subred pública
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.misdatos_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.environment}-public-subnet"
    Environment = var.environment
  }
}

# Creación de la subred privada
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.misdatos_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name        = "${var.environment}-private-subnet"
    Environment = var.environment
  }
}

# Tabla de rutas para la subred pública
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.misdatos_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.misdatos_igw.id
  }

  tags = {
    Name        = "${var.environment}-public-route-table"
    Environment = var.environment
  }
}

# Tabla de rutas para la subred privada
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.misdatos_vpc.id

  tags = {
    Name        = "${var.environment}-private-route-table"
    Environment = var.environment
  }
}

# Asociación de la tabla de rutas pública con la subred pública
resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Asociación de la tabla de rutas privada con la subred privada
resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}