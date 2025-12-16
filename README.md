# Terraform Yandex Cloud Server

Проект автоматического развёртывания сервера в Yandex Cloud с помощью Terraform.

## Цели проекта

- Создание инфраструктуры как кода (IaC)
- Быстрое развёртывание тестового окружения
- Изучение Terraform и Yandex Cloud

## Возможности

- Создание VPC сети и подсети
- Настройка Security Groups
- Развёртывание виртуальной машины
- Автоматическая настройка SSH доступа
- Вывод публичного IP после деплоя

## Быстрый старт

### Предварительные требования

1. Установите [Terraform](https://www.terraform.io/downloads) (≥ 1.5)
2. Установите [YC CLI](https://cloud.yandex.ru/docs/cli/quickstart)
3. Аккаунт в Yandex Cloud с правами `editor`

### Настройка

1. **Клонируйте репозиторий:**
```bash
git clone https://github.com/Name1essGuy/terraform-yc-single-server.git
cd terraform-yc-single-server.git
```

2. **Настройте переменные:**
```bash
cp terraform.tfvars.example terraform.tfvars
# Отредактируйте terraform.tfvars своими значениями
```

3. **Инициализируйте terraform**
``` bash
terraform init
```

4. **Проверьте план:**
``` bash
terraform plan
```

5. **Разверните инфраструктуру:**
``` bash
terraform apply
```

### Структура проекта

.
├── main.tf              # Основная конфигурация
├── variables.tf         # Объявления переменных
├── outputs.tf           # Выводы после деплоя
├── terraform.tfvars     # Значения переменных (.gitignore)
├── .gitignore           # Игнорируемые файлы
└── README.md            # Эта документация

### Переменные

Основные переменные в variables.tf:

| Переменная | Описание | Пример |
|------------|----------|--------|
| `yc_cloud_id` | Cloud ID Yandex Cloud | `"aje8sd7..."` |
| `yc_folder_id` | Folder ID каталога | `"b1g7tv..."` |
| `yc_token` | Токен аутентификации | `"t1.9euelZ..."` |

Полный список: [variables.md](docs/variables.md)

### Выходные данные

После успешного terraform apply:

``` bash
# Получить IP сервера
terraform output server_ip

# Получить команду SSH
terraform output ssh_command
```
### Создаваемые ресурсы:

1. Сеть: VPC Network с одной подсетью
2. Безопасность: Security Group с правилами SSH/HTTP
3. Сервер: Виртуальная машина Ubuntu 22.04 (по умолчанию)
4. Диск: Загрузочный диск 20GB (по умолчанию)

### Безопасность:

- SSH доступ только с указанных IP
- Используются переменные с  sensitive = true
- Секреты хранятся в terraform.tfvars (в .gitignore)

### Очистка:
``` bash
# Удалить все созданные ресурсы
terraform destroy
```


## **Дополнительные файлы документации:**

1. [Архитектура](docs/architecture.md)
2. [Процесс развёртывания](docs/deployment.md)
3. [Переменные Terraform](docs/variables.md)

## **Скрипты**

1. [Развёртывание архитектуры](scripts/deploy.sh)
2. [Уничтожение архитектуры](scripts/destroy.sh)