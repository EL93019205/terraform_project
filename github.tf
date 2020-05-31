# GitHubのorganizationを指定する
provider "github" {
  organization = "JUNWEBFREE"
}

# GitHubのwebfookを設定
resource "github_repository_webhook" "example" {
  repository = "example"

  configuration {
    url          = aws_codepipeline_webhook.example.url
    secret       = "VeryRandomStringMoreThan20Byte!"
    content_type = "json"
    insecure_ssl = false
  }

  events = ["push"]
}
