resource "aws_iam_policy" "policy" {
    name = "lambda_kinesis_policy"
	description = "Policy for dev-ci user to use lambda"
	policy = <<EOF
{
    "Version": "2012-10-17",
	"Statement": [
        {
            "Sid": "Stmt1485448841000",
            "Effect": "Allow",
            "Action": [
                "lambda:ListFunctions",
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
        },
        {
            "Sid": "Stmt20170203",
            "Effect": "Allow",
            "Action": [
                "iam:ListAttachedRolePolicies",
                "iam:ListRolePolicies",
                "iam:ListRoles",
                "iam:PassRole"
            ],
            "Resource": "*"
        }
	]
}
EOF
}

resource "aws_iam_role" "role" {
    name = "lambda_kinesis_iam_role"
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


resource "aws_iam_policy_attachment" "test-attachment" {
    name = "dev-ci-attachment"
    users = ["dev-ci"]
	roles = ["${aws_iam_role.role.name}"]
    policy_arn = "${aws_iam_policy.policy.arn}"
}
