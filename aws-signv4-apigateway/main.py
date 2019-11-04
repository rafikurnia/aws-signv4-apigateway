#!/usr/bin/env python3

import os
import sys
import requests
from requests_aws4auth import AWS4Auth


def main():
    if len(sys.argv) < 2:
        error_message = "usage: aws-signv4-apigateway <rest-api-endpoint>\n\naws-signv4-apigateway: error: too few arguments"
        sys.exit(error_message)
    else:

        auth = AWS4Auth(
            os.environ.get("AWS_ACCESS_KEY_ID"),
            os.environ.get("AWS_SECRET_ACCESS_KEY"),
            'ap-southeast-1',
            'execute-api',
            session_token=os.environ.get("AWS_SESSION_TOKEN")
        )

        endpoint = sys.argv[1]
        response = requests.get(endpoint, auth=auth)

        print(response.text)


if __name__ == "__main__":
    main()
