output "webserver-ip" {
  value = aws_instance.web1.public_ip
}

output "ssh-command" {
  value = "ssh -i ${var.public_instance_config.key_name}.pem ubuntu@${aws_instance.web1.public_ip}"
}

output "webserver-url" {
    value = "http://${aws_instance.web1.public_ip}/kids"
}