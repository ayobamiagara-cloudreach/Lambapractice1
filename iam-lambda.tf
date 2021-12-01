#Create a policy which is normally needed to create a role
resource "aws_iam_role_policy" "lambda_policy" {
  name   = "lambda_policy"
  role   = aws_iam_role.lambda_role.id
  policy = file("IAM/lambda_policy.json")
}
#Create an EXECUTION role with an attached policy 
#for lamda FUNCTION
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  assume_role_policy = file("IAM/lambda_assume_role_policy.json")
}

