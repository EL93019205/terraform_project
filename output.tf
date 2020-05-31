# ALBのDNS名を出力
output "alb_dns_name" {
  value = aws_lb.example.dns_name
}

# 独自ドメイン名を出力
output "domain_name" {
  value = aws_route53_record.example.name
}

# SSHレスオペレーション用EC2インスタンスIDを出力
output "operation_instance_id" {
  value = aws_instance.example_for_operation.id
}

# アカウントIDを出力
data "aws_caller_identity" "current" {}
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

# リージョンを出力
data "aws_region" "current" {}
output "region_name" {
  value = data.aws_region.current.name
}

# アベイラビリティーゾーンを出力
data "aws_availability_zones" "available" {
  state = "available"
}
output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

# ELB用のIDを出力
data "aws_elb_service_account" "current" {}
output "alb_service_account_id" {
  value = data.aws_elb_service_account.current.id
}
