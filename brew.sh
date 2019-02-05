#!/usr/bin/env bash

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
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install openssl
bres install readline
brew install screen
brew install gmp

# Install other useful binaries.
brew install ack
brew install arp-scan
brew install curl --with-openssl
brew install gettext
brew link --force gettext
brew install git
brew install git-lfs
brew install jq
brew install lastpass-cli
brew install ssh-copy-id
brew install tree
brew install watch

# Development tools
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

# Remove outdated versions from the cellar.
brew cleanup
