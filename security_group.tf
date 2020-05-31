# VPCにセキュリティグループを設定
module "example_sg" {
  source      = "./security_group"
  name        = "module-sg"
  vpc_id      = aws_vpc.example.id
  port        = 80
  cidr_blocks = ["0.0.0.0/0"]
}

# ALBにセキュリティグループを設定
# http用
module "http_sg" {
  source      = "./security_group"
  name        = "http-sg"
  vpc_id      = aws_vpc.example.id
  port        = 80
  cidr_blocks = ["0.0.0.0/0"]
}
# https用
module "https_sg" {
  source      = "./security_group"
  name        = "https-sg"
  vpc_id      = aws_vpc.example.id
  port        = 443
  cidr_blocks = ["0.0.0.0/0"]
}
# httpリダイレクト用
module "http_redirect_sg" {
  source      = "./security_group"
  name        = "http-redirect-sg"
  vpc_id      = aws_vpc.example.id
  port        = 8080
  cidr_blocks = ["0.0.0.0/0"]
}

# nginx用
module "nginx_sg" {
  source      = "./security_group"
  name        = "nginx-sg"
  vpc_id      = aws_vpc.example.id
  port        = 80
  cidr_blocks = [aws_vpc.example.cidr_block]
}

# RDS用
# module "mysql_sg" {
#   source = "./security_group"
#   name = "mysql-sg"
#   vpc_id = aws_vpc.example.id
#   port = 3306
#   cidr_blocks = [aws_vpc.example.cidr_block]
# }

# ElastiCache用
# module "redis_sg" {
#   source = "./security_group"
#   name = "redis-sg"
#   vpc_id = aws_vpc.example.id
#   port = 6379
#   cidr_blocks = [aws_vpc.example.cidr_block]
# }
