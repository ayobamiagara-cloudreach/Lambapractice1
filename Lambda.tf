resource "aws_lambda_function" "test_lambda" {
  
  function_name = "lambdascript"
  s3_bucket     = "newbucket-lambda-2021"
  s3_key        = "lambdascript.zip"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambdascript.handler"
  runtime       = "python3.8"
}
