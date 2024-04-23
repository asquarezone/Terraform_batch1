
output "weburl" {
  value = "http://${aws_lb.kids.dns_name}/kids"
}
