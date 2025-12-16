# Процесс развёртывания

## Этапы

1. **Подготовка**
   - Настройка YC CLI
   - Создание сервисного аккаунта
   - Назначение ролей

2. **Инициализация**
   ```bash
   terraform init
   ```

3. **Планирование**
   ```bash
   terraform plan
   ```

4. **Применение**
   ```bash
   terraform apply
   ```

5. **Проверка**
   ```bash
   terraform output
   curl http://$(terraform output -raw server_ip)
   ```