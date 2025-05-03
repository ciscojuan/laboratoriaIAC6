# Infraestructura de Red para Misdatos.com - Ambiente DEV

Este proyecto implementa la infraestructura de red para el ambiente de desarrollo (DEV) de Misdatos.com utilizando Terraform.

## Componentes implementados

- VPC con CIDR 10.0.1.0/24
- Subred pública con CIDR 10.0.1.64/26
- Subred privada con CIDR 10.0.1.128/26
- Internet Gateway
- Tablas de rutas para subredes públicas y privadas

## Requisitos previos

- AWS CLI configurado con credenciales válidas
- Terraform instalado (versión 1.0.0 o superior)

## Instrucciones de uso

1. Inicializar el directorio de trabajo de Terraform:
   ```
   terraform init
   ```

2. Revisar el plan de ejecución:
   ```
   terraform plan
   ```

3. Aplicar la configuración:
   ```
   terraform apply
   ```

4. Para destruir la infraestructura:
   ```
   terraform destroy
   ```

## Variables

Las variables están definidas en `variables.tf` y sus valores por defecto en `terraform.tfvars`. Puedes modificar estos valores según tus necesidades.

Grupo 1