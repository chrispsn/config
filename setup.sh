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

# Symbolic links
# ln -s <path to original> <path to new>
echo "Removing default files and setting up symlinks to ~/config versions..."

rm ~/.vimrc
ln -s ~/config/.vimrc ~/.vimrc

rm -rf ~/.vim
ln -s ~/config/.vim ~/.vim

rm -rf ~/.bashrc
ln -s ~/config/.bashrc ~/.bashrc

rm ~/.bash_aliases
ln -s ~/config/.bash_aliases ~/.bash_aliases

rm ~/.gitconfig
ln -s ~/config/.gitconfig ~/.gitconfig

rm ~/.gitignore_global
ln -s ~/config/.gitignore_global ~/.gitignore_global

rm ~/.conkyrc
ln -s ~/config/.conkyrc ~/.conkyrc

# Special cases

if [ -d "~/.pip" ]; then
    rm ~/.pip/pip.conf
else
    mkdir ~/.pip
fi
ln -s ~/config/pip.conf ~/.pip/pip.conf

# Virtualenvwrapper setup
# mkdir ~/.venvs
# sudo pip install virtualenvwrapper

# Finally, initialise and update the submodules...
# http://chrisjean.com/2009/04/20/git-submodules-adding-using-removing-and-updating/

# Set up Vundle for vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
