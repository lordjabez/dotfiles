#!/usr/bin/env bash
set -e


# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade


# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)


# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;


# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh
brew install openssl
brew install readline
brew install screen
brew install gmp
brew install vim
brew install wget

# Install other useful binaries.
brew install ack
brew install arp-scan
brew install curl
brew install fswatch
brew install gettext
brew link --force gettext
brew install git
brew install git-lfs
brew cask install iterm2
brew install jq
brew cask install keepingyouawake
brew cask install keybase
brew install lastpass-cli
brew install ssh-copy-id
brew install tree
brew install watch

# Development tools
brew cask install atom
brew cask install gimp
brew install golang
brew cask install java
brew install kubernetes-helm
brew install mysql
brew install nvm
brew install pyenv
brew install sqlite3
brew install zlib

# AWS tooling
brew install ec2-api-tools

# Docker tooling
brew cask install docker
brew install docker-completion
brew install docker-compose-completion
brew install docker-machine-completion

# Install alternative browsers
brew cask install google-chrome


# Remove outdated versions from the cellar.
brew cleanup
