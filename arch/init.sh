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

