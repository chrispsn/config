echo "Installing packages..."
sudo pacman -S gvim
sudo pacman -S xmonad
sudo pacman -S xmonad-contrib
sudo pacman -S dzen
sudo pacman -S rxvt-unicode
sudo pacman -S zsh

echo "Setting up oh-my-zsh, a zsh prettifier..."
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh

echo "Set up paktahn, an AUR helper. Instructions are in arch.sh; can't run it automatically yet because the version number might change for pacman -U purposes, so do it manually."
# echo "Setting up paktahn, an AUR helper..."
# cd ~
# mkdir aur
# cd aur
# wget aur.archlinux.org/packages/pa/paktahn/paktahn.tar.gz
# tar -xzvf paktahn.tar.gz
# cd paktahn
# makepkg -s
# sudo pacman -U <paktahn version>.tar.xz

echo "Setting up symlinks..."
ln -s ~/config/.zshrc ~/.zshrc
ln -s ~/config/.xinitrc ~/xinitrc
ln -s ~/config/.Xdefaults ~/.Xdefaults
