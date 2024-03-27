output "url" {
    value = format("http://%s",aws_instance.nginx.public_ip)
}