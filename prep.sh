#!/usr/bin/env bash
set -e


# Initial items to run manually
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew install git
# git clone https://github.com/lordjabez/dotfiles ~/.dotfiles
# cd ~/.dotfiles
# ./prep.sh
# ./brew.sh
# Close terminal and open iTerm
# Launch keepingyouawake
# Launch keybase and login
# Launch docker
# Launch atom
# Launch chrome
# ./dev.sh
# ./macos.sh


# Make admins have password-less sudo powers (note the extra empty
# string parameter which is required for the MacOS version of sed)
sudo sed -i '' 's/(ALL) ALL/(ALL) NOPASSWD: ALL/' /etc/sudoers


# Set up symlinks to dotfiles and private files in Keybase
pushd ~
ln -fs .dotfiles/.atom
ln -fs .dotfiles/.bash_profile
ln -fs .dotfiles/.bashrc
ln -fs .dotfiles/.config
ln -fs .dotfiles/.curlrc
ln -fs .dotfiles/.editorconfig
ln -fs .dotfiles/.gitattributes
ln -fs .dotfiles/.gitconfig
ln -fs .dotfiles/.gitignore
ln -fs .dotfiles/.hushlogin
ln -fs .dotfiles/.inputrc
ln -fs .dotfiles/.screenrc
ln -fs .dotfiles/.wgetrc
ln -fs /Volumes/Keybase/private/jneer/.cloudflare
ln -fs /Volumes/Keybase/private/jneer/.docker
ln -fs /Volumes/Keybase/private/jneer/.netrc
ln -fs /Volumes/Keybase/private/jneer/.npmrc
ln -fs /Volumes/Keybase/private/jneer/.ssh
mkdir .aws
ln -fs /Volumes/Keybase/private/jneer/.aws/config .aws/config
ln -fs /Volumes/Keybase/private/jneer/.aws/credentials .aws/credentials
mkdir .kube
ln -fs /Volumes/Keybase/private/jneer/.kube/config .kube/config
popd
