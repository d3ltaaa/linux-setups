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

selected_dm=""
selected_de=""
boot_request=""

echo "Select one display manager:"
for instance in "${dm[@]}"; do
    while true; do
        read -p "$instance? [y/n]" yn
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
        read -p "$instance? [y/n]" yn
        case $yn in
            [Yy]* ) selected_de="$instance"; break;;
            [Nn]* ) break;;
            * ) echo "Enter 'y' or 'n'";;
        esac
    done
done

while true; do
    read -p "Boot after installations? [y/n]" yn
    case $yn in
        [Yy]* ) boot_request=1; break;;
        [Nn]* ) boot_request=0; break;;
        * ) echo "Enter 'y' or 'n'";;
    esac
done

if [[ ! -z $selected_dm ]]; then
    dnf install $selected_dm
    systemctl enable $selected_dm
    systemctl set-default graphical.target
else
    echo "No display manager selected!"
    sleep 3
    exit 1
fi

if [[ ! -z $selected_de ]]; then
    if [[ $selected_de == "kde-plasma" ]]; then
        dnf install plasma-desktop plasma-nm kde-cli-tools kmenuedit kscreen
    elif [[ $selected_de == "gnome" ]]; then
        dnf install gnome-shell gnome-terminal gnome-tweaks
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

