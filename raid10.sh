#!/bin/bash

sudo mkdir -p ~root/.ssh
sudo cp ~vagrant/.ssh/auth* ~root/.ssh
sudo yum install -y mdadm smartmontools hdparm gdisk
sudo mdadm --zero-superblock --force /dev/sd{b..e}
sudo mdadm --create --verbose --run /dev/md0 -l 10 -n 4 /dev/sd{b..e}
sudo parted -s /dev/md0 mklabel gpt
sudo parted -s /dev/md0 mkpart primary ext4 0% 20%
sudo parted -s /dev/md0 mkpart primary ext4 20% 40%
sudo parted -s /dev/md0 mkpart primary ext4 40% 60%
sudo parted -s /dev/md0 mkpart primary ext4 60% 80%
sudo parted -s /dev/md0 mkpart primary ext4 80% 100%

