output "aws_instance" {
  value = "http://${aws_instance.insta.public_ip}/browny"
}

output "aws_instance2" {
  value = "http://${aws_instance.insta.public_ip}/repairs"
}