read -p "Update system?"
dnf update 

read -p "Install gdm?"
dnf install gdm

read -p "Enable and set gdm as default?"
systemctl enable gdm
systemctl set-default graphical.target 

mkdir /home/falk/Downloads
cd /home/falk/Downloads

read -p "Install dnf software?"
curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/dnf.sh > dnf.sh && chmod +x dnf.sh
./dnf.sh
rm dnf.sh

read -p "Install free software?"
curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/free.sh > free.sh && chmod +x free.sh
./free.sh
rm free.sh

read -p "Install non-free software?"
curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/non-free.sh > non-free.sh && chmod +x non-free.sh
./non-free.sh
rm non-free.sh

read -p "Install remnote?"
curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/remnote.sh > remnote.sh && chmod +x remnote.sh
./remnote.sh
rm remnote.sh

read -p "Install spotify?"
curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/spotify.sh > spotify.sh && chmod +x spotify.sh
./spotify.sh
rm spotify.sh

read -p "Install flatpak?"
curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/flatpak.sh > flatpak.sh && chmod +x flatpak.sh
./flatpak.sh
cd /home/falk/Downloads
rm flapak.sh
