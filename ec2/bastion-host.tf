resource "aws_instance" "bastion-host" {
  ami           = var.image-id
  instance_type = var.instance-type
  availability_zone = var.availability-zone
  subnet_id = var.eks-vpc-subnet-3
  key_name = var.ec2-instance-key-name
  security_groups = aws_security_group.bastion-ec2-instance-security-group.id

  tags = {
    Name = var.bastion-ec2-instance
  }
}

output "ec2_global_ips" {
  value = aws_instance.bastion-host.public_ip
}
