#!/usr/bin/env bash
set -e


# Versions
NODE_VERSION=10.15.2
PYTHON_VERSION=3.7.2


# Git LFS config
git lfs install
sudo git lfs install --system


# Android
brew cask install android-platform-tools
brew cask install android-sdk


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


# AWS environment helper
wget -O aws-env https://raw.githubusercontent.com/fpco/devops-helpers/master/aws/aws-env.sh
chmod a+x aws-env
mv aws-env /usr/local/bin/

# AWS credential helper for EKS
wget -O aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/darwin/amd64/aws-iam-authenticator
chmod a+x aws-iam-authenticator
mv aws-iam-authenticator /usr/local/bin/

# Terraform
wget -O terraform.zip https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_darwin_amd64.zip
unzip terraform.zip
chmod a+x aws-iam-authenticator
mv terraform /usr/local/bin/
rm terraform.zip
