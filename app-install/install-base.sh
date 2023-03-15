echo "version 6\n"
echo "UI: creating repos"
  
mkdir -p /home/falk/.local/share/icons 
mkdir -p /home/falk/.local/share/applications 
mkdir -p /home/falk/.local/share/AppImages 
mkdir -p /home/falk/Downloads

cd /home/falk/Downloads 
echo "UI: installing packages ..."
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
  

echo "UI: downloading spotify..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
  
cd /home/falk/Downloads

echo "UI: installing synergy..."
dnf makecache --refresh
dnf -y install synergy

echo "UI: downloading remnote.AppImage..."
cd /home/falk/.local/share/AppImages
wget --progress=bar:force -O remnote.AppImage https://www.remnote.com/desktop/linux
chmod +x remnote.AppImage

echo "UI: Downloading remnote icon..."
cd /home/falk/.local/share/icons
wget https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/remnote-install/remnote.png

echo "UI: Creating and writing to remnote.desktop..."

cat > /home/falk/.local/share/applications/remnote.desktop <<EOL
[Desktop Entry]
Type=Application
Name=Remnote
Exec=/home/falk/.local/share/AppImages/remnote.AppImage
Icon=/home/falk/.local/share/icons/remnote.png
Terminal=false
EOL

echo "UI: making remnote.desktop executable..."
chmod +x remnote.desktop
