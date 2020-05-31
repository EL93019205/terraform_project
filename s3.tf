# プライベートなS3バケット
resource "aws_s3_bucket" "private" {
  bucket = "junbucket-private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  # 削除保護設定
  force_destroy = true
}

# プライベートなS3バケットのパブリックアクセスをブロックする
resource "aws_s3_bucket_public_access_block" "private" {
  bucket                  = aws_s3_bucket.private.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# パブリックなS3バケット
resource "aws_s3_bucket" "public" {
  bucket = "junbucket-public"
  acl    = "public-read"

  cors_rule {
    allowed_origins = ["https://example.com"]
    allowed_methods = ["GET"]
    allowed_headers = ["*"]
    max_age_seconds = 3000
  }
  # 削除保護設定
  force_destroy = true
}

# ALBログ保存用S3バケット
resource "aws_s3_bucket" "alb_log" {
  bucket = "junbucket-alblog"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
  # 削除保護設定
  force_destroy = true
}
# ALBからS3へのアクセス権を設定
resource "aws_s3_bucket_policy" "alb_log" {
  bucket = aws_s3_bucket.alb_log.id
  policy = data.aws_iam_policy_document.alb_log.json
}

# CodeBuildとCodePipelineのアーティファクト受け渡し用のバケット作成
resource "aws_s3_bucket" "artifact" {
  bucket = "junbucket-artifact"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
  # 削除保護設定
  force_destroy = true
}

# SSHレスオペレーション用ログ保存
resource "aws_s3_bucket" "operation" {
  bucket = "junbucket-operation"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
  # 削除保護設定
  force_destroy = true
}

# CloudWatchLogsストレージのデータを保存する用のバケット
resource "aws_s3_bucket" "cloudwatch_logs" {
  bucket = "junbucket-cloudwatch"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
  # 削除保護設定
  force_destroy = true
}
