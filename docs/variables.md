# Переменные Terraform

## Обязательные переменные

| Переменная | Описание | Пример |
|------------|----------|--------|
| `yc_cloud_id` | Cloud ID Yandex Cloud | `"aje8sd7..."` |
| `yc_folder_id` | Folder ID каталога | `"b1g7tv..."` |
| `yc_token` | Токен аутентификации | `"t1.9euelZ..."` |

## Настройка сервера

| Переменная | Описание | По умолчанию |
|------------|----------|--------------|
| `vm_name` | Имя ВМ | `"web-server"` |
| `vm_zone` | Зона доступности | `"ru-central1-a"` |
| `vm_image_id` | ID образа ОС | `"fd8vmcue..."` |
| `vm_platform_id` | Тип платформы | `"standart-v3"` |
| `vm_resources_cores` | Ядра CPU | `2` |
| `vm_resources_memory` | Память (ГБ) | `2` |
| `vm_disk_size` | Размер диска (ГБ) | `20` |
| `ssh_public_key_path` | Путь к файлу публичного SSH ключа | `"~/.ssh/id_rsa.pub"` |

## Настройка сети

| Переменная | Описание | По умолчанию |
|------------|----------|--------------|
| `network_name` | Имя сети | `"my-network"` |
| `subnet_name` | Имя подсети | `"subnet_a"` |
| `sg_name` | Имя группы безопасности | `"web-security-group"` |
| `subnet_cidr` | CIDR подсети | `"192.168.10.0/24"` |
| `sg_allowed_ssh_cidrs` | CIDR для SSH | `["0.0.0.0/0"]` |
| `sg_allowed_http_cidrs` | CIDR для HTTP | `["0.0.0.0/0"]` |
