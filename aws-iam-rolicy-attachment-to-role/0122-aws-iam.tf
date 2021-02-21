data "aws_iam_policy_document" "service-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = var.principals_type
      identifiers = var.principals_identifiers
    }
  }
}

resource "aws_iam_role" "default" {
  name               = var.role_name
  path               = var.role_path
  assume_role_policy = data.aws_iam_policy_document.service-assume-role-policy.json
}



resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.id
  policy_arn = var.policy_arn
}

resource "aws_iam_instance_profile" "default" {
  count  = var.instance_profile_enable ? 1 : 0
  name = var.role_name
  role = aws_iam_role.default.name
}