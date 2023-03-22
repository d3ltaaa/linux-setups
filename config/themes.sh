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

# apply the themes
kwriteconfig5 --file ~/.config/kdeglobals --group "General" --key "ColorScheme" "Colloid"
kwriteconfig5 --file ~/.config/kdeglobals --group "General" --key "WidgetStyle" "kvantum"
kwriteconfig5 --file ~/.config/kdeglobals --group "Icons" --key "Theme" "Colloid"
sudo ln -s /home/falk/.themes/Colloid-kde/sddm/theme.conf /usr/share/sddm/themes/colloid-theme.conf
kwriteconfig5 --file ~/.config/kdeglobals --group "General" --key "LookAndFeelPackage" "/home/falk/.themes/Colloid-kde/colloid.desktop"
kwriteconfig5 --file ~/.config/kdeglobals --group "General" --key "ColorScheme" "Colloid"
kwriteconfig5 --file ~/.config/kwinrc --group "org.kde.kdecoration2" --key "theme" "Colloid"
sudo ln -s /home/falk/.themes/Colloid-kde/splash/colloid /usr/share/plasma/look-and-feel/org.kde.breeze.desktop/splash.svg

