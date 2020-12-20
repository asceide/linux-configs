.. role:: con(code)
  :language: bash


==========================
Arch Linux Setup
==========================

----------------------------------------------------------------
*Hurray, you're a tinkerer with a penchant for masocism*
----------------------------------------------------------------

Before chroot
==============

1. Connect to the Internet
-----------------------------
* If you're using Cable, all you really have to do is connect the cable. However if you''re using wifi, you will use :con:`iwctl` ....
    
    a. Find out the name of the wifi of the device using :con:`[iwd] # device list`
    b. Connect to a wifi network using :con:`[iwd]# station (device) `
        i. Scan for a network with :con:`[iwd]# station (device) scan`
        ii. Get all available networks with :con:`[iwd]# station (device) get-networks`
        iii. Connect to a network with :con:`[iwd]# [iwd]# station (device) connect (SSID)`
    
You should be connected to a network now.

2. Update the System Clock
----------------------------
* Ensure that the system clock is accurate by using :con:`# timedatectl set-ntp true`

3. Partition the disks
-------------------------
* Find out the name of the drives being used and recognized by using :con:`# lsblk` . The disk should be /dev/*
* After getting the name of the disk you want to use, run :con:`# fdisk /dev/(disk name)`:
    a. First set up a GPT table for the disk using :con:`g`
    b. Afterwards, set up the partitions using :con:`n`. Generally I am using a 4 partition scheme (boot, swap, root, home):
        i. Set up a boot partition with 512MBs of space.
        ii. A swap partition with 4GBs of space.
        iii. A root partition with 50GBs of space.
        iv. A home partition with whatever is left.
    c. Set up the types of the partition. boot should be an EFI Boot (option 1), Swap swap, root Linux x86 root, home Linux home.
    d. Write to disk using `w`.

4. Format the partitions
--------------------------
* Format the partitions according to what kind they are. Get the partition name with :con:`# lsblk -l` . 
    a. use :con:`# mkfs.fat /dev/(boot partition)1 for the boot partition.
    b. use :con:`# mkswap /dev/(swap partition)` for the swap partition.
    c. use :con:`# mkfs.btrfs /dev/(root partition)` for the root partition.
    d. use :con:`# mkfs.xfs /dev/(home partition)` for the home partition.

5. Mount the partitions
--------------------------
* Mount the partitions according to what will be their final mount points:
    a. :con:`# mount /dev/(root partition) /mnt` for the root.
    b. :con:`# mount /dev/(boot partition) /mnt/boot` for the boot partition.
    c. :con:`# mount /dev/(home partition) /mnt/home` for the home partition.
    d. :con:`# swapon /dev/(swap partition)` for the swap partition.

* If there is a need to unmount partitions, use umount and swapoff respectivelu.
