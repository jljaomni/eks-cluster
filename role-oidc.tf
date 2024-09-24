resource "aws_iam_openid_connect_provider" "github_actions" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

resource "aws_iam_role" "github_actions_role" {
  name = "github-actions-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com",
            "token.actions.githubusercontent.com:sub" : "repo:jljaomni/eks-cluster:ref:refs/heads/main"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "github_actions_ecr_policy" {
  name = "GitHubActionsECRPolicy"

  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
      {
        Effect: "Allow",
        Action: [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ],
        Resource: "*"
      },
      {
        Effect: "Allow",
        Action: [
          "ecr:CreateRepository",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DeleteRepository",
          "ecr:BatchDeleteImage"
        ],
        Resource: "*"
      },
      {
        Effect: "Allow",
        Action: "ecr:GetAuthorizationToken",
        Resource: "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_github_actions_ecr_policy" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = aws_iam_policy.github_actions_ecr_policy.arn
}

resource "aws_iam_role_policy" "s3_policy" {
  name = "github-actions-s3-access-policy"
  role = aws_iam_role.github_actions_role.id

  policy = jsonencode({
  Version: "2012-10-17",
  Statement: [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "${aws_s3_bucket.terraform_state.arn}",
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "${aws_s3_bucket.terraform_state.arn}/*",
    }
  ]
  })
}


resource "aws_iam_role_policy" "dynamodb_policy" {
  name = "github-actions-dynamodb-access-policy"
  role = aws_iam_role.github_actions_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem",
          "dynamodb:UpdateItem",
          "dynamodb:DescribeTable"
        ],
        Resource = "${aws_dynamodb_table.terraform_locks.arn}"
      }
    ]
  })
}

