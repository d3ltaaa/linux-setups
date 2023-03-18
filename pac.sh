#!/bin/bash


# Define the list of selected programs
dnf_selected_programs=()
free_selected_programs=()
nonfree_selected_programs=()
flatpak_selected_programs=()
appimage_selected_programs=()


# Define the list of programs to install
dnf_programs=(
  nautilus 
  gnome-terminal 
  gnome-tweaks
  dolphin
  konsole
  @development-tools 
  vim 
  git 
  bpytop 
  ncdu 
  ranger 
  neofetch 
  trash-cli 
  speedtest-cli 
  flatpak 
  wget 
  firefox 
  timeshift 
  xournalpp 
  ulauncher
)

# Define the list of programs to install
free_programs=(
  vlc
)

nonfree_programs=(
  discord
  
)

flatpak_programs=(
    com.mattjakeman.ExtensionManager
    com.spotify.Client
)


appimage_programs=(
  remnote
)

# special dnf programs like synergy are missing

echo "dnf_programs:"
# go through each program, ask if it should be installed and add it to the selected programs
for program in "${dnf_programs[@]}"; do
      while true; do
          read -p "Install $program? [y/n] " yn
          case $yn in
              [Yy]* ) dnf_selected_programs+=("$program"); break;;
              [Nn]* ) break;;
              * ) echo "Enter 'y' or 'n'!";;
          esac
      done
done

echo "free_programs:"
# go through each free program, ask if it should be installed and add it to the selected programs
for program in "${free_programs[@]}"; do
      while true; do
          read -p "Install $program? [y/n] " yn
          case $yn in
              [Yy]* ) free_selected_programs+=("$program"); break;;
              [Nn]* ) break;;
              * ) echo "Enter 'y' or 'n'!";;
          esac
      done
done

echo "nonfree_programs:"
# go through each non-free program, ask if it should be installed and add it to the selected programs
for program in "${nonfree_programs[@]}"; do
      while true; do
          read -p "Install $program? [y/n] " yn
          case $yn in
              [Yy]* ) nonfree_selected_programs+=("$program"); break;;
              [Nn]* ) break;;
              * ) echo "Enter 'y' or 'n'!";;
          esac
      done
done

echo "flatpak_programs:"
# go through each flatpak program, ask if it should be installed and add it to the selected programs
for program in "${flatpak_programs[@]}"; do
      while true; do
          read -p "Install $program? [y/n] " yn
          case $yn in
              [Yy]* ) flatpak_selected_programs+=("$program"); break;;
              [Nn]* ) break;;
              * ) echo "Enter 'y' or 'n'!";;
          esac
      done
done

echo "appimage_programs"
# go through each appimage program, ask if it should be installed and add it to the selected programs
for program in "${appimage_programs[@]}"; do
      while true; do
          read -p "Install $program? [y/n] " yn
          case $yn in
              [Yy]* ) appimage_selected_programs+=("$program"); break;;
              [Nn]* ) break;;
              * ) echo "Enter 'y' or 'n'!";;
          esac
      done
done




# Install the selected dnf programs
dnf install -y "${dnf_selected_programs[@]}"

# Install the selected free programs
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y "${free_selected_programs[@]}"

# Install the selected nonfree programs
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install -y "${nonfree_selected_programs[@]}"

# Install the selected flatpak programs
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install -y "${flatpak_selected_programs[@]}"

# Install AppImages (special for each one)
for program in "${appimage_selected_programs[@]}"; do
    if [[ $program == "remnote" ]]; then
        curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/app-install/remnote.sh > remnote.sh && chmod +x remnote.sh
        ./remnote.sh
        rm remnote.sh
        break
    fi
done
