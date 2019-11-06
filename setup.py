from setuptools import setup, find_packages
from os import path

this_directory = path.abspath(path.dirname(__file__))
with open(path.join(this_directory, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name="aws-signv4-apigateway",
    version="0.1.0",
    packages=find_packages(),
    url="https://github.com/rafikurnia/aws-signv4-apigateway",
    license="Apache License 2.0",
    author="Rafi Kurnia Putra",
    author_email="rafi.putra@traveloka.com",
    description="Sign your request to invoke Amazon API Gateway REST API Endpoint with Signature Version 4",
    long_description=long_description,
    long_description_content_type='text/markdown',
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
