# load keyboard layout
loadkeys de-latin1

# check if you have internet
ip link
ping google.com

# network-time-protocol
timedatectl set-ntp true

# verify 
timedatectl status

# disks

# check disks
fdisk -l
# search for the right amount of GB

# partition the right drive
fdisk /dev/nvme0n1

# create gpt partition table
g
# add a new partition (EFI)
n
# enter
# enter
# give size
+1G

# add a new partition (swap)
n
# enter
# enter
# give size
+2GB

# add a new partition (linux filesystem)
n
# enter
# enter
# enter

# change partition 1 to EFI
t
1
1
# change partition 2 to Swap
t 
2
19
# partition 3 is already 'linux filesystem'
w

# File system
# Format the EFI system to FAT32
mkfs.fat -F32 /dev/nvme0n1p1

# Format the Swap system
mkswap /dev/nvme0n1p2

# enable the swap 
swapon /dev/nvme0n1p2

# Format the linux filesystem to Ext4
mkfs.ext4 /dev/nvme0n1p3

# mount the linux filesystem
mount /dev/nvme0n1p3 /mnt

# pacstrap to install base system
pacstrap /mnt base linux linux-firmware

# Generate an fstab file (files-ystem-table)
genfstab -U /mnt >> /mnt/etc/fstab

# Change root into the new system
arch-chroot /mnt

# set the time zone
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# set hardware clock
hwclock --systohc

# install an editor
pacman -S vim

# set locale
# uncomment locale in locale.gen
vim /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# set the right keyboard layout
echo KEYMAP=de-latin1 > /etc/vconsole.conf 

# set hostname
echo LAPTOP-FH /etc/hostname

# append in /etc/hosts
"127.0.0.1   localhost
::1         localhost
127.0.1.1   LAPTOP-FH.localdomain   LAPTOP-FH"

# set root pswd
passwd

# create new user
useradd -m falk
passwd falk
usermod -aG wheel,audio,video,optical falk


# install sudo
pacman -S sudo 

# open the sudoers file
EDITOR=vim visudo 
# uncomment: %wheel ALL=(ALL) ALL

# install grub
pacman -S grub efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
mount /dev/nvme0n1p1 /boot/EFI
grub-install --target=x86_64-efi --bootloader=GRUB --efi-directory=/boot/EFI --removable
grub-mkconfig -o /boot/grub/grub.cfg

# install important packages
pacman -S networkmanager 

# enable the different managers
systemctl enable NetworkManager


exit

umount -R /mnt

reboot

#######################################
#          After reboot               #
#######################################

# install important packages
sudo pacman -S firefox alacritty alsa-utils pipewire git bluez
sudo pacman -S xf86-video-fbdev xorg xorg-xinit awesome

# enable bluetooth
systemctl enable bluetooth.service
systemctl enable bluetooth-mesh.service

# xinitrc file
cp /etc/X11/xinit/xinitrc /home/falk/.xinitrc
sudo vim .xinitrc
# delete last 5 lines
"exec awesome"

######################################
mkdir -p /home/falk/.config/awesome
cd .config
cp /etc/xdg/awesome/rc.lua /home/falk/.config/awesome
