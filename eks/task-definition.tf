resource "aws_ecs_task_definition" "ecs-task-definition" {
  name = "ecs-task-definition-snehal"
  container_definition = ${file("./ecs/task-definition.json")}"
}