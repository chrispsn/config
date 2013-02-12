VBoxClient-all &

xsetroot -cursor_name left_ptr

# sh ~/.fehbg &

# Turn caps lock into control
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "add Control = Caps_Lock"

exec xmonad
