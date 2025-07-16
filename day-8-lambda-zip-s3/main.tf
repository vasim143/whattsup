resource "aws_s3_bucket" "lambda_code_bucket" {
  bucket = "bokkalolife567843"  # ✅ Your provided bucket name
  acl    = "private"
}

resource "aws_s3_bucket_object" "lambda_zip" {
  bucket = aws_s3_bucket.lambda_code_bucket.id
  key    = "lambda-code/lambda_function.zip"
  source = "lambda_function.zip"
  etag   = filemd5("lambda_function.zip")
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = 60
  memory_size   = 128

  s3_bucket = aws_s3_bucket.lambda_code_bucket.bucket
  s3_key    = aws_s3_bucket_object.lambda_zip.key

  source_code_hash = filebase64sha256("lambda_function.zip")
}
