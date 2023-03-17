
echo "Checking if Discord is installed..."
if command -v discord &>/dev/null; then
  echo "Discord is already installed."
else
  read -p "Discord is not installed. Do you want to install it? [y/n] " yn
  case $yn in
    [Yy]* )
      echo "Installing Discord..."
      sudo dnf install discord -y
      echo "Discord has been installed.";;
    [Nn]* )
      echo "Discord will not be installed.";;
    * )
      echo "Please answer y or n.";;
  esac
fi
