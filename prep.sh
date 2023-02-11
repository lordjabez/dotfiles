#!/usr/bin/env bash
set -e


# Make admins have password-less sudo powers (note the extra empty
# string parameter which is required for the MacOS version of sed)
sudo sed -i '' 's/(ALL) ALL/(ALL) NOPASSWD: ALL/' /etc/sudoers


# Set up symlinks to dotfiles
pushd ~
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
popd
