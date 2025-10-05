#!/usr/bin/env bash
set -e


# Intall git and some helpers
brew install git git-lfs git-secrets
git lfs install
sudo git lfs install --system


# Common programming language managers
brew install \
  jabba \
  nvm \
  pyenv \
  tfenv


# Infrastructure tooling
brew install \
  awscli \
  aws-vault
brew install --cask \
  docker


# Remove outdated versions from the cellar and ensure installation is healthy
brew cleanup
brew doctor
