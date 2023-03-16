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


echo "===> make fedora boot into gui"
systemctl set-default graphical.target
reboot
