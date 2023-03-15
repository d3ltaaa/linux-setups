cd /home/falk/Downloads
dnf install \
  @"base-x" \
  @"Common NetworkManager Submodules" \
  @"Fonts" \
  @"Hardware Support" \
  bluedevil \
  breeze-gtk \
  breeze-icon-theme \
  cagibi \
  colord-kde \
  cups-pk-helper \
  dolphin \
  glibc-all-langpacks \
  gnome-keyring-pam \
  kcm_systemd \
  kde-gtk-config \
  kde-partitionmanager \
  kde-print-manager \
  kde-settings-pulseaudio \
  kde-style-breeze \
  kdegraphics-thumbnailers \
  kdeplasma-addons \
  kdialog \
  kdnssd \
  kf5-akonadi-server \
  kf5-akonadi-server-mysql \
  kf5-baloo-file \
  kf5-kipi-plugins \
  khotkeys \
  kmenuedit \
  konsole5 \
  kscreen \
  kscreenlocker \
  ksshaskpass \
  ksysguard \
  kwalletmanager5 \
  kwebkitpart \
  kwin \
  NetworkManager-config-connectivity-fedora \
  pam-kwallet \
  phonon-qt5-backend-gstreamer \
  pinentry-qt \
  plasma-breeze \
  plasma-desktop \
  plasma-desktop-doc \
  plasma-drkonqi \
  plasma-nm \
  plasma-nm-l2tp \
  plasma-nm-openconnect \
  plasma-nm-openswan \
  plasma-nm-openvpn \
  plasma-nm-pptp \
  plasma-nm-vpnc \
  plasma-pa \
  plasma-user-manager \
  plasma-workspace \
  plasma-workspace-geolocation \
  polkit-kde \
  qt5-qtbase-gui \
  qt5-qtdeclarative \
  sddm \
  sddm-breeze \
  sddm-kcm \
  setroubleshoot \
  sni-qt \
  xorg-x11-drv-libinput \
  
# enable rpm repositories
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  
# my packages
  git \
  vim \
  bpytop \
  ncdu \
  ranger \
  neofetch \
  trash-cli \
  speedtest-cli \
  
# my installs
  timeshift \
  firefox \
  flatpak \
  wget \
  
# create repositories
mkdir /home/falk/.local/share/icons \
mkdir /home/falk/.local/share/applications \
mkdir /home/falk/.local/share/AppImages \

# dnf-installations
dnf install vlc \
dnf install xournalpp \
dnf config-manager --add-repo=https://negativo17.org/repos/fedora-spotify.repo \
dnf install spotify-client \
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
dnf install discord \

# my scripts
cd Downloads \
curl -O https://api2.prod.symless.com/aws-downloads/synergy/v1-core-standard/1.14.6-snapshot.88fdd263/synergy_1.14.6-snapshot.88fdd263.flatpak \
flatpak install synergy_1.14.6-snapshot.88fdd263.flatpak \

cd /home/falk/.local/share/AppImages \
wget --progress=bar:force -O remnote.AppImage https://www.remnote.com/desktop/linux \
chmod +x remnote.AppImage \

cd /home/falk/.local/share/icons \
wget https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/remnote-install/remnote.png \

cd /home/falk/.local/share/applications \

cat > ~/.local/share/applications/remnote.desktop <<EOL 
[Desktop Entry]
Type=Application
Name=Remnote
Exec=/home/falk/.local/share/AppImages/remnote.AppImage
Icon=/home/falk/.local/share/icons/remnote.png
Terminal=false
EOL \
chmod +x remnote.desktop \
 
systemctl enable sddm && \
systemctl set-default graphical.target &&\
reboot
