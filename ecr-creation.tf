#Creating the ECR repository
/* resource "aws_ecr_repository" "my_repository" {
  name = "le-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
}

#The ECR auth. token
data "aws_ecr_authorization_token" "token" {
  registry_id = aws_ecr_repository.my_repository.registry_id
}

#Setting the right policy for the ECR repo
resource "aws_ecr_repository_policy" "my_repository_policy" {
  repository = aws_ecr_repository.my_repository.name
  policy     = jsonencode({
    Version: "2008-10-17",
    Statement: [
      {
        Sid: "AllowPull",
        Effect: "Allow",
        Principal: "*",
        Action: [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:ListImages",
          "ecr:DescribeImages",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:GetRepositoryPolicy",
          "ecr:ListTagsForResource",
          "ecr:DescribeImageScanFindings"
        ]
      }
    ]
  })
}
 */