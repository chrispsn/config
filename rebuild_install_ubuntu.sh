#! /bin/bash

# My settings, designed for Ubuntu 11.04 in Gnome Classic mode.

# HOW TO USE THIS SCRIPT
# 1. Install git on your system. On Ubuntu, the relevant command is:
# sudo apt-get install git
#
# 2. Get connected to GitHub.
# https://help.github.com/articles/generating-ssh-keys
#
# 3. Clone the 'config' repo to your system.
# git clone git@github.com:chrispsn/config.git ~/config
#
# 4. Give yourself read and execution privileges for this script.
# chmod u+x rebuild_install.sh
# 
# 5. Run the script
# ./rebuild_install.sh


# APPS & UTILITIES

# GVim
sudo apt-get install vim-gnome

# Right-click to open a directory
sudo apt-get install nautilus-open-terminal 

# Google Chrome
sudo apt-get install google-chrome


# PYTHON

sudo apt-get install python-pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper
echo "If you're not using setup.sh and the included .bashrc, you'll need to follow the installation instructions at http://virtualenvwrapper.readthedocs.org/en/latest/index.html"
# Makes pip install of psycopg2 much easier.
sudo apt-get install libpq-dev python-dev
# pep8 is need to make Vim's Python syntax checking work.
sudo pip install pep8


# VISUALS

echo "gtk2-engines-aurora is to make the FreshDark theme work properly."
sudo apt-get install gtk2-engines-aurora
# Gnome-brave contains icons used by FreshDark.
# sudo apt-get install gnome-brave-icon-theme
sudo apt-get install shiki-brave-theme

# For netbook, consider using docky:
# sudo apt-get install docky
# Use the HUD theme with intellihide, icon size 52, zoom 200%
# Also ensure it runs on startup/login
# And remove the bottom Gnome panel

clear

# MANUAL STEPS
echo "Install VirtualBox guest additions"
echo "Go to http://hcalves.deviantart.com/art/Fresh-Dark-Gnome-Theme-2-1-95737856"
echo "Download FreshDark and unpack it into .themes, then change the theme in Settings > Appearance"
echo "Webfaction SSH: http://docs.webfaction.com/user-guide/access.html"
echo "Change the Gnome Terminal theme to white on black, with background transparency about two Close buttons width off maximum"
