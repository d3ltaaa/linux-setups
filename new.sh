dnf update 

# dnf install xorg or @base-x
dnf install gdm
systemctl enable gdm
systemctl set-default graphical.target 

mkdir /home/falk/Downloads
cd /home/falk/Downloads

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/dnf.sh
dnf install dnf.sh
rm dnf.sh

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/free.sh
dnf install free.sh
rm free.sh

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/non-free.sh
dnf install non-free.sh
rm non-free.sh

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/remnote.sh
dnf install remnote.sh
rm remnote.sh

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/spotify.sh
dnf install spotify.sh
rm spotify.sh

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/synergy.sh
dnf install synergy.sh
rm synergy.sh
