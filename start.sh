
#!/bin/bash

# Criação da infraestrutura na AWS usando Terraform
cd ./terraform
terraform init
terraform apply -auto-approve



#Obtem o endereço DNS da instância EC2
ec2_address=$(awk -F'"' '/public_dns/ {gsub(/,/, "", $4); print $4}' terraform.tfstate)

# Obtém o endereço DNS da instância RDS
rds_address=$(grep '"address"' terraform.tfstate | awk -F'"' '{print $4}')

# Obtem o DNS da instância CloudFront
cloudfront_address=$(grep '"domain_name"' terraform.tfstate | awk -F'"' '{print $4}' | grep "cloudfront.net")

# Obtem o DNS da bucket S3
s3_address=$(grep '"bucket"' terraform.tfstate | awk -F'"' '{print $4}' | awk 'NR==2')


