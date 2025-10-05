#!/usr/bin/env bash
set -e


# Make sure we’re using the latest Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade

# Don't bother doing install cleanup every time, we'll do it at the end
export HOMEBREW_NO_INSTALL_CLEANUP=1


# Switch to using brew-installed bash as default shell
brew install bash bash-completion2
export BREW_BASH_PREFIX="$(brew --prefix)/bin/bash"
if ! ggrep -F -q "$BREW_BASH_PREFIX" /etc/shells; then
  echo "$BREW_BASH_PREFIX" | sudo tee -a /etc/shells;
  chsh -s "$BREW_BASH_PREFIX";
fi;


# Useful command line tools and libraries
brew install \
  ack \
  arp-scan \
  coreutils \
  findutils \
  fswatch \
  gettext \
  gmp \
  gnu-sed \
  gnupg \
  grep \
  jq \
  moreutils \
  readline \
  screen \
  tmux \
  tree \
  vim \
  watch \
  wget


# Application software from casks
brew install --cask \
  font-monaspace \
  gimp \
  google-chrome \
  iterm2 \
  keepingyouawake \
  sublime-text


# Remove outdated versions from the cellar and ensure installation is healthy
brew cleanup
brew doctor
