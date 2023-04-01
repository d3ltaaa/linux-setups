
# base xorg
pacman -S xf86-video-fbdev xorg xorg-xinit 
# wm
pacman -S awesome

# packages - rice
pacman -S nitrogen polybar rofi

# packages - apps
pacman -S firefox alacritty git xournalpp  flatpak

# yay
pacman -S base-devel
mkdir /home/falk/.yay
cd /home/falk/.yay
git clone https://aur.archlinux.org/yay.git
cd /home/falk/.yay/yay
makepkg -si
exit
# packages - rice (yay)
yay -S picom-jonaburg-fix
yay -S font-manager-git
