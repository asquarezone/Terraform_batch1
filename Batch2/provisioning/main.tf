resource "aws_instance" "nginx" {
    ami = var.ami
    associate_public_ip_address = true
    instance_type = "t2.micro"
    key_name = var.key_pair
    availability_zone = var.availability_zone
    vpc_security_group_ids = [ var.security_group_id ]

    
}


resource "null_resource" "for_provisioning" {
    triggers = {
      trigger  = var.my_trigger
    }

    connection {
      type = "ssh"
      host = aws_instance.nginx.public_ip
      user = "ubuntu"
      private_key = file("~/Downloads/docker.pem")
    }
    provisioner "remote-exec" {
        inline = [ 
            "sudo apt update",
            "sudo apt install nginx -y",
            "sudo apt install tree -y"
         ]
      
    }
  
}



