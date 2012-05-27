### OH MY ZSH ###
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

### ZSH AUTO-CONFIGURED ###

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

### CHRIS'S STUFF ###
prompt walters

setopt CORRECT # Command correction
setopt EXTENDED_HISTORY # Adds timestamps to history

setopt MENUCOMPLETE

bindkey -e # Sets zsh to emacs mode (to stop backspace and delete not working)

# This line allow gems installed in ~/.gem to work.
# That is, it allows gem install x to work without sudo.
PATH=$PATH:/home/chris/.gem/ruby/1.9.1/bin

# cd to root of current repo; just type 'rr'
rr() {
    local dir="."
    until ( [[ -a "$dir/.git" ]] || [[ -a "$dir/.hg" ]] ); do
        dir="../$dir"
        if [[ $dir -ef / ]]; then
            return 1
        fi
    done
    cd $dir
}

# Keeping things neat.
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
