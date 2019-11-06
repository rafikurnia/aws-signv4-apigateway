# aws-signv4-apigateway

Sign your request to invoke Amazon API Gateway REST API Endpoint with Signature Version 4. 

Current limitation of this tool:
* Support receiving AWS credentials via OS environment variables only.
* Invoke Amazon API Gateway REST API in `ap-southeast-1` region only.

## Requirements

* [Python 3.X.X](https://www.python.org/downloads/)
* [Virtualenv](https://virtualenv.pypa.io/en/latest/) (Recommended)

## Installation

There are multiple ways to install this tool. This section will explain to you the options available:

### Using install.sh

The easiest way is to use [install.sh](install.sh). Just download [install.sh](install.sh) to your local machine, add executable permission, and run it!
```bash
$ curl -o ~/Downloads/install-aws-signv4-apigateway https://raw.githubusercontent.com/rafikurnia/aws-signv4-apigateway/master/install.sh
$ chmod +x ~/Downloads/install-aws-signv4-apigateway
$ ~/Downloads/install-aws-signv4-apigateway
```
[install.sh](install.sh) will:
1. Find your Python3
2. Find your Virtualenv
3. Create a new directory at ~/.aws-signv4-apigateway
4. Create a new virtual environment at the directory
5. Install this tool to the virtual environment
6. Add ~/.aws-signv4-apigateway/bin to your PATH by modifying ~/.bashrc file

### Using pip

You can use `pip` and `virtualenv`. Create a new virtual environment, then activate the environment and use this command to install:
```bash
$ pip install aws-signv4-apigateway
```

Or you can do it without `virtualenv`. `sudo` most likely be required:
```bash
$ sudo pip install aws-signv4-apigateway
```

## Getting Started

Before using this tool, make sure you set AWS Credentials on your OS Environment Variables:
* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_SESSION_TOKEN (if you are using temporary credentials such as IAM Role)

```bash
$ export AWS_ACCESS_KEY_ID=your_access_key_id
$ export AWS_SECRET_ACCESS_KEY=your_secret_access_key
```

After that, you can use this tool:
```bash
$ aws-signv4-apigateway <rest-api-endpoint>
```

Or you can use it with tools to assume role like [awsudo](https://github.com/makethunder/awsudo):
```bash
$ awsudo -u PROFILE_NAME -- aws-signv4-apigateway <rest-api-endpoint>
```

## Author

* [Rafi Kurnia Putra](https://github.com/rafikurnia)

## License

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.