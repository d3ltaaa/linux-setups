
echo "===> downloading remnote.AppImage"
sleep 3
mkdir -p /home/falk/.local/share/AppImages
cd /home/falk/.local/share/AppImages
wget --progress=bar:force -O remnote.AppImage https://www.remnote.com/desktop/linux
chmod +x remnote.AppImage

echo "===> Downloading remnote icon"
mkdir -p /home/falk/.local/share/icons
cd /home/falk/.local/share/icons
wget https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/remnote-install/remnote.png

echo "===> Writing to remnote.desktop"
mkdir -p /home/falk/.local/share/applications
cat > /home/falk/.local/share/applications/remnote.desktop << EOF
[Desktop Entry]
Type=Application
Name=Remnote
Exec=/home/falk/.local/share/AppImages/remnote.AppImage
Icon=/home/falk/.local/share/icons/remnote.png
Terminal=false
EOF

echo "===> making remnote.desktop executable"
ls
chmod +x remnote.desktop
