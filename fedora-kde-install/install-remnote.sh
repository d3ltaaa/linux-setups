cd /home/falk
mkdir .AppImages

cd /home/falk/.AppImages
wget --progress=bar:force -O remnote.AppImage https://www.remnote.com/desktop/linux
chmod +x remnote.AppImage

cd /home/falk/.local/share/icons
wget https://raw.githubusercontent.com/d3ltaaa/linux-setups/remnote-install/image.png -O image.png

cd /home/falk/.local/share/applications

cat > ~/.local/share/applications/remnote.desktop <<EOL
[Desktop Entry]
Type=Application
Name=RemNote
Exec=/home/falk/.AppImages/remnote.AppImage %U
Icon=/opt/remnote/remnote.png
Terminal=false
EOL
