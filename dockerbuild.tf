#Building the docker image
/* resource "docker_image" "crudapp" {
  depends_on = [aws_ecr_repository.my_repository]
  name          = "${aws_ecr_repository.my_repository.repository_url}:latest"
  build {
    path = "/application"
  }
}
 
resource "docker_registry_image" "crudappimage" {
  name = docker_image.crudapp.name
  keep_remotely = true
} */