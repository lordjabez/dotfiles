#!/usr/bin/env bash -e


# Versions
NODE_VERSION=10.15.0
PYTHON_VERSION=3.7.1


# Node
nvm install $NODE_VERSION


# Python
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION


# XCode
xcode-select --install
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
