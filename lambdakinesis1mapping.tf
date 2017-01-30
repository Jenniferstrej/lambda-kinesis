resource "aws_lambda_event_source_mapping" "event_source_mapping" {
    batch_size = 100
    event_source_arn = "arn:aws:kinesis:us-east-1:109549055893:stream/MX-figshare-in-test"
    enabled = true
    function_name = "arn:aws:lambda:us-east-1:109549055893:function:figshare-worker"
    starting_position = "TRIM_HORIZON"
}