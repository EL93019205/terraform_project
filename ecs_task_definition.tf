# ECSタスク定義作成
resource "aws_ecs_task_definition" "example" {
  family                   = "example"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./container_definitions/nginx.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

# ECS Scheduled Tasks用タスク定義作成
resource "aws_ecs_task_definition" "example_batch" {
  family                   = "example-batch"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./container_definitions/batch_ecs_task_do.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
