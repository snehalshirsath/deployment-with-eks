
resource "aws_instance" "bastion-host" {

  subnet_id = var.bastion-host-subnet-id
  ami           = var.image-id
  instance_type = var.instance-type
  availability_zone = var.availability-zone
  key_name = var.ec2-instance-key-name
  security_groups = [var.bastion-host-security-group]
  associate_public_ip_address = true

  tags = {
    Name = var.bastion-ec2-instance
  }
}

output "ec2_global_ips" {
  value = aws_instance.bastion-host.public_ip
}
