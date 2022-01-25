echo "Hello there, your Auto Install should beging shortly"
echo "btw, im assuming i already installed nvim so yeah, install that if you didnt earlier"
sleep 3
echo "Im going to su so we can create the doas.conf, because sudo sucks"
sleep 1
su
touch /etc/doas.conf
echo "
permit mattio as root

permit nopass :wheel cmd shutdown
permit nopass :wheel cmd reboot" >> /etc/doas.conf
exit
echo "Now install the arch repos, this is going to be manual"
doas pacman -S artix-arch-linux-support
doas echo " # Universe repo
[universe]
  Server = https://universe.artixlinux.org/$arch
  Server = https://mirror1.artixlinux.org/universe/$arch
  Server = https://mirror.pascalpuffke.de/artix-universe/$arch
  Server = https://artixlinux.qontinuum.space:4443/universe/os/$arch
  Server = https://mirror.alphvino.com/artix-universe/$arch

# For arch repos
[extra]
Include = /etc/pacman.d/mirrorlist-arch

[community]
Include = /etc/pacman.d/mirrorlist-arch

[multilib]
Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
echo "Now just check the pacman.conf IN CASE something went wrong"
doas nvim /etc/pacman.conf
echo "After that, we download important packages from the Arch Repositories"
sleep 5
doas pacman -Syy
doas pacman -S networkmanager-runit xorg doas xorg-xinit git zsh nitrogen neovim exa dust duf ripgrep zsh-syntax-highlighting xdotool libreoffice-fresh htop pcmanfm cmus mpv sxiv xfce4-screenshoter librewolf
echo "Now we need to pull dwm and st, my configs basically (also .zshrc and .vimrc)."
sleep 5
cd $HOME/.config
git clone https://github.com/Mattio-cmd/dwm-config-green
git clone https://github.com/Mattio-cmd/my-st-build
git clone https://github.com/Mattio-cmd/slock
git clone https://github.com/Mattio-cmd/slstatus
git clone https://github.com/Mattio-cmd/x-related-stuff
git clone https://github.com/Mattio-cmd/my-zshrc
git clone https://github.com/Mattio-cmd/nvim-lua
mv my-zshrc/.zshrc $HOME/
rm -rf my-zshrc
mv dwm-config-green dwm-6.2
mv my-st-build st
echo "Idk if i did it right, do it manually later"
sleep 3
doas chsh -s /usr/bin/zsh mattio
cd ~/
cd $HOME/.config
echo "Lets build dwm!"
sleep 2
cd $HOME/.config/dwm-6.2
doas make clean install
cd $HOME/.config/st
doas make clean install
cd $HOME/.config/slock
doas make clean install
cd $HOME/.config/slstatus
doas make clean install
cp $HOME/.config/x-related-stuff/xinit $HOME/.
mv xinit .xinitrc;
echo "I think everything is good now, just run startx"
echo "Removing File System"
sleep 2
echo "nah jk"
