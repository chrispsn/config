#!/bin/bash

### INSTRUCTIONS ###

# First, set up ssh using http://help.github.com/linux-set-up-git/

# Then, clone the config repository...
# cd ~/
# git clone git@github.com:chrispsn/config.git

# Get permission to run setup.sh
# (i.e. chmod u+x setup.sh)
# Then run it
# (i.e. ./setup.sh)


### SCRIPT ###

cd ~

# Symbolic links
# ln -s <path to original> <path to new>
echo "Removing default files and setting up symlinks to ~/config versions..."

rm .vimrc
ln -s ~/config/.vimrc ~/.vimrc

rm -rf .vim
ln -s ~/config/.vim ~/.vim

rm .bash_aliases
ln -s ~/config/.bash_aliases ~/.bash_aliases

rm .gitconfig
ln -s ~/config/.gitconfig ~/.gitconfig

rm .gitignore_global
ln -s ~/config/.gitignore_global ~/.gitignore_global

rm .oh-my-zsh
ln -s ~/config/.oh-my-zsh ~/.oh-my-zsh

# Special cases

cd ~/.pip
rm pip.conf
ln -s ~/config/pip.conf ~/.pip/pip.conf

# Finally, initialise and update the submodules...
# http://chrisjean.com/2009/04/20/git-submodules-adding-using-removing-and-updating/
echo "Setting up git submodule stuff..."
cd ~/config
git submodule init
git submodule update
