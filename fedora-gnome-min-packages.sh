echo "===> installing @base-x, gnome-shell, gnome-terminal, nautilus, firefox"
dnf install @base-x gnome-shell gnome-terminal nautilus firefox

# @base-x - base for DE ('@' in dnf specifies a group )
# gnome-shell - Pulls minimal dependencies for Gnome DE
# gnome-terminal - Terminal
# nautilus - File Manager
# firefox - Web Browser

echo "===> installing chrome-gnome-shell, gnome-tweaks, @development-tools"
sudo dnf install chrome-gnome-shell gnome-tweaks @development-tools

# chrome-gnome-shell - Browser connecter for gnome shell integration
# gnome-tweaks - To tweak gnome
# @development-tools - provides basic dev tools

echo "===> installing rpmfusion -free and -nonfree repos"
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# rpmfusion repositories are repos to download unofficial software from

echo "===> installing git, vim, bpytop, ncdu, ranger, neofetch, trash-cli, speedtest-cli, flatpak, wget"
dnf install git vim bpytop ncdu ranger neofetch trash-cli speedtest-cli flatpak wget

echo "===> installing timeshift, discord, vlc, xournalpp"
dnf install timeshift discord vlc xournalpp 

echo "===> install synergy"
flatpak install https://api2.prod.symless.com/aws-downloads/synergy/v1-core-standard/1.14.6-snapshot.88fdd263/synergy_1.14.6-snapshot.88fdd263.flatpak



echo "===> make fedora boot into gui"
systemctl set-default graphical.target
reboot
