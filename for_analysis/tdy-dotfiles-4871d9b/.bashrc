alias rpmx=rpmextract.sh
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -lA'
alias weechat='su - weechat -c weechat-curses'
alias ctw='ctw --refresh=10 --nometric'

PS1='\u@\h:\w\[\e[1;32m\]%\[\e[0m\] '

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
  complete -cf sudo
fi

