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
  pyenv


# Infrastructure tooling
brew install \
  awscli \
  terraform
brew install --cask \
  docker
