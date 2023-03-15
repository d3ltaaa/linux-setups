echo "version 4\n"
cd /home/falk/Downloads 
dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  git \
  vim \
  bpytop \
  ncdu \
  ranger \
  neofetch \
  trash-cli \
  speedtest-cli \
  timeshift \
  firefox \
  flatpak \
  wget \
  discord \
  vlc \
  xournalpp 
  
mkdir -p /home/falk/.local/share/icons 
mkdir -p /home/falk/.local/share/applications 
mkdir -p /home/falk/.local/share/AppImages 
mkdir -p /home/falk/Downloads


flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
  
cd /home/falk/Downloads

curl -O https://api2.prod.symless.com/aws-downloads/synergy/v1-core-standard/1.14.6-snapshot.88fdd263/synergy_1.14.6-snapshot.88fdd263.flatpak
flatpak install synergy_1.14.6-snapshot.88fdd263.flatpak
cd /home/falk/.local/share/AppImages
wget --progress=bar:force -O remnote.AppImage https://www.remnote.com/desktop/linux
chmod +x remnote.AppImage

cd /home/falk/.local/share/icons
wget https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/remnote-install/remnote.png

echo "[Desktop Entry]
Type=Application
Name=Remnote
Exec=/home/falk/.local/share/AppImages/remnote.AppImage
Icon=/home/falk/.local/share/icons/remnote.png
Terminal=false " | tee ~/.local/share/applications/remnote.desktop > /dev/null

chmod +x remnote.desktop
