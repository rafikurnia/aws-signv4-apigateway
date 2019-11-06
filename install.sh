#!/usr/bin/env bash

INSTALLATION_DIRECTORY="$HOME/.aws-signv4-apigateway"

is_installed () {
    command -v $1 &>/dev/null
    return $?
}

is_python_3 () {
    version=$($1 -V 2>&1 | grep -Po '(?<=Python )(.+)')
    if [[ -n "$version" ]]; then
        major=${version:0:1}
        if [[ $major -eq 3 ]]; then
            return 0
        else
            return 1
        fi
    else
        return 1
    fi
}

if (is_installed python || is_installed python3 || is_installed python3.5 || is_installed python3.6 || is_installed python3.7); then
    if (is_python_3 python3.7); then
        python_command="python3.7"
    elif (is_python_3 python3.6); then
        python_command="python3.6"
    elif (is_python_3 python3.5); then
        python_command="python3.5"
    elif (is_python_3 python3); then
        python_command="python3"
    elif (is_python_3 python); then
        python_command="python"
    else
        echo -e "\e[101minfo: python3 is not installed or detected\e[0m"
        exit 1
    fi
    echo -e "\e[42minfo: python3 found: '$python_command'\e[0m"
else 
    echo -e "\e[101minfo: python3 is not installed or detected\e[0m"
    exit 1
fi

if (is_installed virtualenv); then
    echo -e "\e[42minfo: virtualenv found: 'virtualenv'\e[0m"
else
    echo -e "\e101minfo: virtualenv is not installed or detected\e[0m"
    exit 1
fi

echo -e "\e[7minfo: creating directory '$INSTALLATION_DIRECTORY'\e[0m"
mkdir -v "$INSTALLATION_DIRECTORY" 2> /tmp/Error
if [[ $? -ne 0 ]]; then
    echo -e "\e[101m$(</tmp/Error)\e[0m"
    exit 1
fi

echo -e "\e[7minfo: creating virtualenv on '$INSTALLATION_DIRECTORY' directory using '$python_command'\e[0m"
virtualenv -p $python_command $INSTALLATION_DIRECTORY 2> /tmp/Error
if [[ $? -ne 0 ]]; then
    echo -e "\e[101m$(</tmp/Error)\e[0m"
    exit 1
fi

echo -e "\e[7minfo: activating virtualenv\e[0m"
source $INSTALLATION_DIRECTORY/bin/activate 2> /tmp/Error
if [[ $? -ne 0 ]]; then
    echo -e "\e[101m$(</tmp/Error)\e[0m"
    exit 1
fi

echo -e "\e[7minfo: installing aws-signv4-apigateway\e[0m"
pip install -U aws-signv4-apigateway 2> /tmp/Error
if [[ $? -ne 0 ]]; then
    echo -e "\e[101m$(</tmp/Error)\e[0m"
    exit 1
fi

echo -e "\e[7minfo: adding '$INSTALLATION_DIRECTORY/bin' directory into PATH variable in '~/.bashrc' file\e[0m"
echo -n 'export PATH=${PATH}:' >> ~/.bashrc && echo "$INSTALLATION_DIRECTORY/bin" >> ~/.bashrc
if [[ $? -ne 0 ]]; then
    exit 1
fi

echo -e "\e[42minfo: installation is done. restart or open new terminal and then try to execute 'aws-signv4-apigateway'\e[0m"
