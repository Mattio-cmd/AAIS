echo "Hello there, your Auto Install should beging shortly"
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
echo "Downloading important packages from the Arch Repositories..."
sleep 2
doas pacman -Syy
doas pacman -S networkmanager-runit xorg doas xorg-xinit git zsh nitrogen neovim exa dust duf ripgrep zsh-syntax-highlighting xdotool libreoffice-fresh htop pcmanfm cmus mpv sxiv xfce4-screenshoter librewolf
echo "Now we need to pull dwm and st, my configs basically (also .zshrc and .vimrc)."
sleep 3
cd $HOME/
echo "I am now going to exit root and go back to a normal user with 'exit'"
exit
sleep 2

git clone https://Mattio-cmd/dotfiles
cd dotfiles; ./install.sh

doas chsh -s /usr/bin/zsh mattio
