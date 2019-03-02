#!/usr/bin/env bash -e


# Versions
NODE_VERSION=10.15.0
PYTHON_VERSION=3.7.1


# Git LFS config
git lfs install
sudo git lfs install --system


# Node
export NVM_DIR="$(brew --prefix nvm)"
source "$NVM_DIR/nvm.sh"
nvm install $NODE_VERSION --delete-prefix node


# Python
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION


# Travis CI
sudo gem install travis --no-rdoc --no-ri


# XCode
xcode-select --install
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
