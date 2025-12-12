# Секреты

variable "yc_cloud_id" {
    description = "Yandex Cloud cloud ID"
    type        = string
    sensitive   = true
}

variable "yc_folder_id" {
    description = "Yandex Cloud folder ID"
    type        = string
    sensitive   = true
}

variable "yc_token" {
    description = "OAuth-токен или ключ сервисного аккаунта"
    type        = string
    sensitive   = true
}

variable "vm_zone" {
    description = "Зона доступности виртуальной машины"
    type        = string
    default     = "ru-central1-a"
}

# Настройнки виртуальной машины

variable "vm_image_id" {
    description = "ID образа ОС"
    type        = string
    default     = "fd8vmcue7aajpmeo39kk" # Ubuntu 22.04
}

variable "vm_platform_id" {
    description = "Тип платформы ВМ"
    type        = string
    default     = "standard-v3"
}

variable "vm_disk_size" {
    description = "Вместительность жёсткого диска виртульной машины"
    type        = number
    default     = 20
}

variable "vm_resources_cores" {
    description = "Количество ядер процессора виртуальной машины"
    type        = number
    default     = 2
}

variable "vm_resources_memory" {
    description = "Количество гигабайт оперативной памяти виртуальной машины"
    type        = number
    default     = 2
}

# Настройки сети

variable "subnet_cidr" {
    description = "CIDR блок для подсети"
    type        = list(string)
    default     = ["192.168.10.0/24"]
}

# Настройки безопасности

variable "sg_allowed_ssh_cidrs" {
    description = "CIDR блоки для доступа по SSH"
    type        = list(string)
    default     =["0.0.0.0/0"]
}

variable "sg_allowed_http_cidrs" {
    description = "CIDR блоки для доступа по HTTP"
    type        = list(string)
    default     = ["0.0.0.0/0"]
}

# Имена инстансов

variable "network_name" {
    description = "Название сети"
    type        = string
    default     = "my-network"
}

variable "subnet_name" {
    description = "Название подсети"
    type        = string
    default     = "subnet_a"
}

variable "sg_name" {
    description = "Название группы безопасности"
    type        = string
    default     = "web-security-group"
}

variable "vm_name" {
    description = "Название виртуальной машины"
    type        = string
    default     = "web-server"
}

# SSH

variable "ssh_public_key_path" {
    description = "Путь к публичному SSH ключу"
    type        = string
    default     = "~/.ssh/id_rsa.pub"
}