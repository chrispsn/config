# Starts X, redirects the print out to ~/.xlog and locks the shell,
# so that others can't just use Ctrl-Alt-F1 to get to a tty.
if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    exec nohup startx > .xlog & vlock
fi
