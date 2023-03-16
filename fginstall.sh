echo "VERSION 1"

echo "===> updating system"
sleep 3
dnf install update

echo "===> making required repositories"
sleep 3
mkdir -p /home/falk/.local/share/AppImages
mkdir -p /home/falk/.local/share/icons
mkdir -p /home/falk/.local/share/applications

echo "===> enabling epel, rpmfusion -free and -nonfree repos"
sleep 3
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf makecache --refresh
# nothing provides redhat-release >= 9 needed by epel-release-9-4.el19.noarch
# (try to add '--skip-broken' to skip uninstallable packages)
# rpmfusion repositories are repos to download unofficial software from

echo "===> installing @base-x, gnome-shell, gnome-terminal, nautilus, firefox"
sleep 3
dnf install @base-x gnome-shell gnome-terminal nautilus firefox

# @base-x - base for DE ('@' in dnf specifies a group )
# gnome-shell - Pulls minimal dependencies for Gnome DE
# gnome-terminal - Terminal
# nautilus - File Manager
# firefox - Web Browser

echo "===> installing xorg and drivers"
sleep 3
# X server and drivers
dnf -y install \
    glx-utils \
    mesa-dri-drivers \
    mesa-vulkan-drivers \
    plymouth-system-theme \
    xorg-x11-drv-evdev \
    xorg-x11-drv-fbdev \
    xorg-x11-drv-intel \
    xorg-x11-drv-libinput \
    xorg-x11-drv-vesa \
    xorg-x11-server-Xorg \
    xorg-x11-server-utils \
    xorg-x11-utils \
    xorg-x11-xauth \
    xorg-x11-xinit \
    xbacklight \
    redshift \
    picom \
    xsel \
    xclip \

echo "===> installing chrome-gnome-shell, gnome-tweaks, @development-tools"
sleep 3
read tmep
dnf install chrome-gnome-shell gnome-tweaks @development-tools
# unable to find match !!!

# chrome-gnome-shell - Browser connecter for gnome shell integration
# gnome-tweaks - To tweak gnome
# @development-tools - provides basic dev tools


echo "===> installing git, vim, bpytop, ncdu, ranger, neofetch, trash-cli, speedtest-cli, flatpak, wget"
sleep 3
dnf install git vim bpytop ncdu ranger neofetch trash-cli speedtest-cli flatpak wget

echo "===> installing timeshift, discord, vlc, xournalpp"
sleep 3
dnf install timeshift discord vlc xournalpp 

echo "===> downloading spotify"
sleep 3
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
# weird behavior Glib-GIO-CRITICAL **: hh:mm:ss: GfileInfo created without standart :: size !!!

echo "===> install synergy"
sleep 3
curl -L -O "https://rc.symless.com/synergy3/v3.0.68.13-beta/synergy-linux_x64-libssl3-v3.0.68.13-beta.rpm"
# curl -L -O https://api2.prod.symless.com/aws-downloads/synergy/v1-core-standard/1.14.6-snapshot.88fdd263/synergy_1.14.6-snapshot.88fdd263.flatpak
echo "did it work???"
read temp
dnf install synergy-linux_x64-libssl3-v3.0.68.13-beta.rpm


# remote bundles are not supported !!!

echo "===> downloading remnote.AppImage"
sleep 3
cd /home/falk/.local/share/AppImages
wget --progress=bar:force -O remnote.AppImage https://www.remnote.com/desktop/linux
chmod +x remnote.AppImage

echo "===> Downloading remnote icon..."
cd /home/falk/.local/share/icons
wget https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/remnote-install/remnote.png

echo "===> Writing to remnote.desktop"
cat > /home/falk/.local/share/applications/remnote.desktop << EOF
[Desktop Entry]
Type=Application
Name=Remnote
Exec=/home/falk/.local/share/AppImages/remnote.AppImage
Icon=/home/falk/.local/share/icons/remnote.png
Terminal=false
EOF

echo "===> making remnote.desktop executable"
ls
chmod +x remnote.desktop

echo "===> make fedora boot into gui"
sleep 3
# systemctl enable sddm
# systemctl set-default graphical.target
# reboot
