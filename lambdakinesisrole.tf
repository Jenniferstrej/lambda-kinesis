provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_iam_role_policy" "lambda_policy" {
    name = "test_policy"
	role = "${aws_iam_role.iam_role_for_lambda.id}"
	policy = <<EOF
{
    "Version": "2012-10-17",
	"Statement": [
        {
            "Sid": "Stmt1485448841000",
            "Effect": "Allow",
            "Action": [
                "lambda:CreateFunction",
                "lambda:UpdateFunctionCode",
                "lambda:UpdateFunctionConfiguration",
                "lambda:UploadFunction"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Stmt1485449225000",
            "Effect": "Allow",
            "Action": [
                "kinesis:DescribeStream",
                "kinesis:GetShardIterator",
                "kinesis:GetRecords",
                "kinesis:ListStreams"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Stmt1485449317000",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        }
	]
}
EOF
}

resource "aws_iam_role" "iam_role_for_lambda" {
    name = "iam_role_for_lambda"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Principal": {
              "Service": "lambda.amazonaws.com"
            }
        }
    ]
}
EOF
}
