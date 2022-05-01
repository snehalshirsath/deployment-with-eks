
# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_vpc_endpoint.vpce-s3:
resource "aws_vpc_endpoint" "ec2" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
      Version = "2008-10-17"
    }
  )
  private_dns_enabled = true
  security_group_ids = [aws_security_group.eks-vpc-security-group.id]
  service_name       = "com.amazonaws.eu-west-1.ec2"
  subnet_ids         = [aws_subnet.eks-vpc-subnet-1.id, aws_subnet.eks-vpc-subnet-2.id]
  tags               = {}
  vpc_endpoint_type  = "Interface"
  vpc_id             = aws_vpc.eks-vpc-attraqt.id

  timeouts {}
}

