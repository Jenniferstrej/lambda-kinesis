from __future__ import print_function

import base64
import requests

print('Loading function UPDATED!')


def lambda_handler(event, context):
    #print("Received event: " + json.dumps(event, indent=2))
    result = requests.get("https://www.google.co.uk/")
    assert result.status_code != 500, "500 response from google!"
    for record in event['Records']:
        # Kinesis data is base64 encoded so decode here
        payload = base64.b64decode(record['kinesis']['data'])
        print("Decoded payload: " + payload)
    return 'Successfully processed {} records. Some other text...'.format(len(event['Records']))
