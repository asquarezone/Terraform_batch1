output "webserver1-ip" {
  value = aws_instance.web1.public_ip
}

output "web1-ssh-command" {
  value = "ssh -i ${var.web1_instance_config.key_name}.pem ubuntu@${aws_instance.web1.public_ip}"
}

output "webserver2-ip" {
  value = aws_instance.web2.public_ip
}

output "web2-ssh-command" {
  value = "ssh -i ${var.web2_instance_config.key_name}.pem ubuntu@${aws_instance.web2.public_ip}"
}

output "webserver1-url" {
  value = "http://${aws_instance.web1.public_ip}/kids"
}

output "webserver2-url" {
  value = "http://${aws_instance.web2.public_ip}/kids"
}