# Packages
sudo pacman -S gvim
sudo pacman -S xmonad
sudo pacman -S dzen
sudo pacman -S rxvt-unicode
sudo pacman -S zsh

# Other installs
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh

# Symlinks
ln -s ~/config/.zshrc ~/.zshrc
ln -s ~/config/.xinitrc ~/xinitrc
