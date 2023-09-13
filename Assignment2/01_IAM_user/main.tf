// IAM USER

resource "aws_iam_user" "this_user01" {
name = var.username
}


//IAM GROUP 
resource "aws_iam_group" "this_group01" {
  name = var.groupname
}


  //aws_iam_user_group_membership

resource "aws_iam_user_group_membership" "this_group01" {
  user = aws_iam_user.this_user01.name

  groups = [
    aws_iam_group.this_group01.name,]
}

