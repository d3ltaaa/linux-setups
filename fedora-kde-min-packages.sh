dnf install \
  @"base-x" \
  @"Common NetworkManager Submodules" \
  @"Fonts" \
  @"Hardware Support" \
  adwaita-gtk2-theme \
  bluedevil \
  breeze-icon-theme \
  cagibi \
  colord-kde \
  cups-pk-helper \
  dolphin \
  firewall-config \
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
  kf5-baloo-file \
  kf5-kipi-plugins \
  khotkeys \
  kinfocenter \
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
  qt5-qtdeclarative \
  sddm \
  sddm-breeze \
  sddm-kcm \
  setroubleshoot \
  sni-qt \
  system-config-language \
  xorg-x11-drv-libinput \
  nginx \
  php php-fpm \
  mariadb mariadb-server \
  yakuake \
  dolphin-plugins \
  git \
  capstone-devel \
  cmake \
  make \
  gcc-c++ \
  rapidjson-devel \
  openssl-devel \
  fuse -y && \
systemctl enable sddm && \
systemctl set-default graphical.target &&\
reboot
