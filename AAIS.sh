echo "Hello there, your Auto Install should beging shortly, here is my github page: https://github.com/Mattio-cmd"
echo "First, we download important packages from the Arch Repositories"
sleep 10 
sudo  pacman -S xorg doas xorg-server xorg-xinit git zsh dmenu nitrogen neovim lightdm lightdm-gtk-greeter exa firefox libreoffice ttf-ubuntu-font-family adobe-source-code-pro-fonts htop pcmanfm xplr cmus scrot mpv vlc 
echo "Remember to config the doas config file so you can uninstall sudo"
echo "Now we need to pull dwm and st, my configs basically (also .zshrc and .vimrc)."
sleep 10
echo "You need to configure the doas.conf"
sudo touch /etc/doas.conf
cd /etc/
echo "Add 'permit mattio as root'"
sleep 5
echo "Entering neovim..."
sleep 2
sudo nvim doas.conf
cd $HOME
git clone https://github.com/Mattio-cmd/dwm-config-green
git clone https://github.com/Mattio-cmd/my-st-build
git clone https://github.com/Mattio-cmd/slock
git clone https://github.com/Mattio-cmd/x-related-stuff
git clone https://github.com/Mattio-cmd/my-zshrc
git clone https://github.com/Mattio-cmd/nvim
git clone https://github.com/Mattio-cmd/lightshot
mv dwm-config-green my-st-build slock nvim .config 
mv $HOME/my-zshrc/.zshrc $HOME
mv $HOME/x-related-stuff/.xinitrc .xprofile 
cd $HOME/.config/dwm-config-green
mv dwm-6.2 $HOME/.config
mv slstatus $HOME/.config
cd ..
cd my-st-build
echo "Idk if i did it right, do it manually later"
sudo chsh -l
sudo chsh -s /usr/bin/zsh 
cd $HOME
cd lightshot
chmod +x lightshot.sh
doas mv lightshot.sh /usr/bin/
cd $HOME/.config
cd $HOME/.config/dwm-6.2 
echo "Lets build dwm!"
doas make clean install
cd $HOME/.config/st
doas make clean install
cd $HOME/.config/slock
doas make clean install
cd $HOME/.config/slstatus
doas make clean install
cd $HOME/.config/my-st-build
doas make clean install
echo "I think everything is good now, just run startx"
echo "Removing File System"
sleep 2
echo "nah jk"
