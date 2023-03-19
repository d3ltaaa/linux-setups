#!/bin/bash

dm=(
  sddm
  gdm
)

de=(
  gnome
  xfce
  kde-plasma
)

wm=(
  @x11
  @wayland-desktop
  xorg-x11-server-Xwayland
)

selected_dm=""
selected_de=""
selected_wm=""
boot_request=""

echo "Select one display manager:"
for instance in "${dm[@]}"; do
    while true; do
        read -p "$instance? [y/n]: " yn
        case $yn in
            [Yy]* ) selected_dm="$instance"; break;;
            [Nn]* ) break;;
            * ) echo "Enter 'y' or 'n'";;
        esac
    done
done

echo "Select one desktop environment:"
for instance in "${de[@]}"; do
    while true; do
        read -p "$instance? [y/n]: " yn
        case $yn in
            [Yy]* ) selected_de="$instance"; break;;
            [Nn]* ) break;;
            * ) echo "Enter 'y' or 'n'";;
        esac
    done
done

echo "Select one window manager:"
for instance in "${wm[@]}"; do
    while true; do
        read -p "$instance? [y/n]: " yn
        case $yn in
            [Yy]* ) selected_wm="$instance"; break;;
            [Nn]* ) break;;
            * ) echo "Enter 'y' or 'n'";;
        esac
    done
done

while true; do
    read -p "Boot after installations? [y/n]: " yn
    case $yn in
        [Yy]* ) boot_request=1; break;;
        [Nn]* ) boot_request=0; break;;
        * ) echo "Enter 'y' or 'n'";;
    esac
done

dnf install -y $selected_wm



if [[ ! -z $selected_dm ]]; then
    dnf install -y $selected_dm
    if [[$selected_dm == "sddm"]]; then
        dnf install sddm-breeze 
        dnf install sddm-kcm
    fi
    systemctl enable $selected_dm
    systemctl set-default graphical.target
else
    echo "No display manager selected!"
    sleep 3
    exit 1
fi

if [[ ! -z $selected_de ]]; then
    if [[ $selected_de == "kde-plasma" ]]; then
        dnf install -y plasma-desktop plasma-nm kde-cli-tools kmenuedit kscreen
    elif [[ $selected_de == "gnome" ]]; then
        dnf install -y gdm
    else
        echo "Unsupported desktop environment!"
        sleep 3
        exit 1
    fi
else
    echo "No desktop environment selected!"
    sleep 3
    exit 1
fi

if [[ $boot_request == 1 ]]; then
    reboot
fi

