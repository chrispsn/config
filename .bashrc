#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
export PS1='\[\033[01;32m\]\u@\h \[\033[00;31m\]\W \$ \[\033[00m\]'

# For virtualenvwrapper

export WORKON_HOME=~/.venvs
source /usr/local/bin/virtualenvwrapper.sh

# Chris's special configs
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
