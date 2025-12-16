#!/bin/bash
set -e

echo "Starting deployment..."

# Инициализация
terraform init

# Планирование
terraform plan -out=plan.tfplan

# Применение
terraform apply plan.tfplan

echo "Deployment complete!"
echo "Server IP: $(terraform output -raw server_ip)"