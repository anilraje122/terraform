resource "aws_iam_user" "sonu" {
    name = "sonu"
    tags = {
        team = "embedded"
    }
}

resource "aws_iam_user" "anilraj" {
    name = "anilraj"
    tags = {
        team = "devops"
    }
}

resource "aws_iam_group" "embedded" {
    name = "embedded"
}

resource "aws_iam_group" "devops" {
    name = "devops"
}

resource "aws_iam_group_membership" "embedded_group_membership" {
    name = "embedded_group_membership"

    users = [
        aws_iam_user.sonu.name
    ]

    group = aws_iam_group.embedded.name
}

resource "aws_iam_group_membership" "devops_group_membership" {
    name = "devops_group_membership"

    users = [
        aws_iam_user.anilraj.name
    ]

    group = aws_iam_group.devops.name
}