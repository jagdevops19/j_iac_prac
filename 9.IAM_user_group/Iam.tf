#group definition
resource "aws_iam_group" "administrator" {
  name = "Administrator"
}
resource "aws_iam_policy_attachment" "administrator-aws_iam_policy_attachment" {
  name = "administrator-aws_iam_policy_attachment"
    groups = [aws_iam_group.administrator.name] 
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#user definition
resource "aws_iam_user" "admin1" {  
  name = "admin1"

}
resource "aws_iam_user" "admin2" {  
  name = "admin2"

}
resource "aws_iam_user" "admin3" {  
  name = "admin3"
}   
#user to group attachment
resource "aws_iam_user_group_membership" "admin1_membership" {
  user = aws_iam_user.admin1.name
  groups = [aws_iam_group.administrator.name]
}
resource "aws_iam_user_group_membership" "admin2_membership" {
  user = aws_iam_user.admin2.name
  groups = [aws_iam_group.administrator.name]
}
resource "aws_iam_user_group_membership" "admin3_membership" {
  user = aws_iam_user.admin3.name
  groups = [aws_iam_group.administrator.name]
}

#outputs
output "warning" {
  value = "WARNING: make sure you're not using the AdministratorAccess policy for other users/groups/roles. If this is the case, don't run terraform destroy, but manually unlink the created resources"
}









#xxxxxxxxx
#
#resource "aws_iam_user_group_membership" "admin1_membership" {
  #name = "admin1_membership"
  #user = [
  #  aws_iam_user.admin1.name,
   # aws_iam_user.admin2.name,
  #  aws_iam_user.admin3.name
# ]
#  groups = aws_iam_group.administrator.name