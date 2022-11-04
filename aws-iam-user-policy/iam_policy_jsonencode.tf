resource "aws_iam_user" "customer-support-user" {
  name = "binu"
  tags = {
    team = "customer-support-team"
  }
}

resource "aws_iam_policy" "customer-support-user-policy" {
  name = "customer-support-user-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:*"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "customer-support-user-policy-attachment" {
  name = "customer-support-user-policy-attachment"
  users = [
    aws_iam_user.customer-support-user.name
  ]
  policy_arn = aws_iam_policy.customer-support-user-policy.arn
}


