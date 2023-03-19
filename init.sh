#!/bin/bash
echo "version 1"
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
  x11
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

if [[ $selected_wm == "x11" ]]; then
    dnf install xorg-x11-server-Xorg xorg-x11-utils xorg-x11-xauth xorg-x11-apps
else
    dnf install -y $selected_wm
fi

if [[ ! -z $selected_dm ]]; then
    if [[ $selected_dm == "sddm" ]]; then
        echo "sddm is installed later"
    else 
        dnf install -y $selected_dm
    fi
    systemctl enable $selected_dm
    systemctl set-default graphical.target
elif [[ $selected_dm == "" ]]; then
    echo "No display manager selected!"
    sleep 3
    exit 1
fi

if [[ ! -z $selected_de ]]; then
    if [[ $selected_de == "kde-plasma" ]]; then
        curl https://raw.githubusercontent.com/d3ltaaa/linux-setups/master/kde.sh > kde.sh && chmod +x kde.sh
        ./kde.sh
        rm kde.sh
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

