resource "aws_iam_user" "storage-admin-user" {
  name = "liju"
  tags = {
    team = "storage"
  }
}

resource "aws_iam_policy" "storage-admin-policy" {
  name   = "storage-admin-policy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "storage-admin-policy-attachment" {
  name = "storage-admin-policy-attachment"
  users = [
    aws_iam_user.storage-admin-user.name
  ]
  policy_arn = aws_iam_policy.storage-admin-policy.arn
}
