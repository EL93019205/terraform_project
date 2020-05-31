# SSHレスオペレーション用サーバー作成
resource "aws_instance" "example_for_operation" {
  ami                  = "ami-0c3fd0f5d33134a76"
  instance_type        = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_for_ssm.name
  subnet_id            = aws_subnet.private_0.id
  user_data            = file("./sh/install_docker.sh")
  tags = {
    Name = "sshless_operation"
  }
}
