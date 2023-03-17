dnf update 

# dnf install xorg or @base-x
dnf install gdm
systemctl enable gdm
systemctl set-default graphical.target 

mkdir /home/falk/Downloads
cd /home/falk/Downloads

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/dnf.sh > dnf.sh && chmod +x dnf.sh
./dnf.sh
rm dnf.sh

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/free.sh > free.sh && chmod +x free.sh
./free.sh
rm free.sh

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/non-free.sh > non-free.sh && chmod +x non-free.sh
./non-free.sh
rm non-free.sh

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/remnote.sh > remnote.sh && chmod +x remnote.sh
./remnote.sh
rm remnote.sh

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/spotify.sh > spotify.sh && chmod +x spotify.sh
./spotify.sh
rm spotify.sh

curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/flatpak.sh > flatpak.sh && chmod +x flatpak.sh
./flatpak.sh
rm flapak.sh
