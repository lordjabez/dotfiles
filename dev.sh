#!/usr/bin/env bash -e


# Versions
NODE_VERSION=10.15.0
PYTHON_VERSION=3.7.1


# Git LFS config
git lfs install
git lfs install --system


# Node
nvm install $NODE_VERSION


# Python
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION


# Travis CI
sudo gem install travis --no-rdoc --no-ri


# XCode
xcode-select --install
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
