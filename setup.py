from setuptools import setup, find_packages

setup(
    name="aws-signv4-apigateway",
    version="0.0.1",
    packages=find_packages(),
    url="https://github.com/rafikurnia/aws-signv4-apigateway",
    license="Apache License 2.0",
    author="Rafi Kurnia Putra",
    author_email="rafi.putra@traveloka.com",
    description="Sign your request to invoke Amazon API Gateway REST API Endpoint with Signature Version 4",
    install_requires=[
        "requests-aws4auth==0.9",
    ],
    python_requires=">=3",
    entry_points={
        "console_scripts": [
            "aws-signv4-apigateway=aws_signv4_apigateway.main:main"
        ],
    }
)
