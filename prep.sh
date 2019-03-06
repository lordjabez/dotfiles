#!/usr/bin/env bash


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
ln -fs .dotfiles/.curlrc
ln -fs .dotfiles/.editorconfig
ln -fs .dotfiles/.gitattributes
ln -fs .dotfiles/.gitconfig
ln -fs .dotfiles/.gitignore
ln -fs .dotfiles/.hushlogin
ln -fs .dotfiles/.inputrc
ln -fs .dotfiles/.screenrc
ln -fs .dotfiles/.wgetrc
ln -fs /keybase/private/jneer/.cloudflare
ln -fs /keybase/private/jneer/.docker
ln -fs /keybase/private/jneer/.netrc
ln -fs /keybase/private/jneer/.npmrc
ln -fs /keybase/private/jneer/.ssh
mkdir .aws
ln -fs /keybase/private/jneer/.aws/config .aws/config
ln -fs /keybase/private/jneer/.aws/credentials .aws/credentials
mkdir .kube
ln -fs /keybase/private/jneer/.kube/config .kube/config
popd
