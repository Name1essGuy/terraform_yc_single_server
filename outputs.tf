output "server_ip" {
  description = "Публичный IP созданного сервера"
  value       = yandex_compute_instance.web.network_interface[0].nat_ip_address
}

output "ssh_connection_command" {
  description = "Команда для подключенеия к созданному серверу по SSH"
  value       = "ssh ubuntu@${yandex_compute_instance.web.network_interface[0].nat_ip_address}"
}