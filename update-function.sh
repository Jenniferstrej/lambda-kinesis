#!/bin/bash

{

    aws --profile jisc-ci lambda update-function-code --function-name figshare-worker --zip-file fileb://figshare-worker.zip --no-publish

} || {

    aws --profile jisc-ci lambda \
    create-function \
    --function-name figshare-worker \
    --runtime python2.7 \
    --role arn:aws:iam::458323522494:role/lambda_kinesis_iam_role \
    --handler lambda_handler \
    --zip-file fileb://figshare-worker.zip \
    --description "Lambda function for Kinesis" \
    --timeout 5 \
    --memory-size 128 \
    --no-publish

}