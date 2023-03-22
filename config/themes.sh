# colloid-icon-theme
mkdir -p /home/falk/.themes
cd /home/falk/.themes
git clone https://github.com/vinceliuice/Colloid-icon-theme.git
cd /home/falk/.themes/Colloid-icon-theme
./install.sh

# colloid-global-kde-theme
mkdir -p /home/falk/.themes
cd /home/falk/.themes
git clone https://github.com/vinceliuice/Colloid-kde.git
cd /home/falk/.themes/Colloid-kde
./install.sh

# colloid-sddm-theme
cd /home/falk/.themes/Colloid-kde/sddm
./install.sh

# colloid-kvantum-theme
cd /home/falk/.themes/Colloid-kde/Kvantum/Colloid/
kvantummanager --install Colloid.kvconfig
kvantummanager --set Colloid

# latte-dock
mkdir -p /home/falk/.themes
cd /home/falk/.themes
curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/config/dock_updated_2.layout.latte > dock_updated_2.layout.latte 

# ulauncher
mkdir -p ~/.config/ulauncher/user-themes
git clone https://github.com/Surendrajat/SeaOwl-Ulauncher-theme \
~/.config/ulauncher/user-themes/SeaOwl
