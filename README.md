# linux-configs
Collection of various configs on Linux (OpenSUSE-Tumbleweed and Solus)

To do: Tumbleweed
Lutris: Fix pug in /usr/lib/python3.8/site-packages/lutris/sysoptions.py -> Cannot detect gamemoded so cannot enable option in Lutris

Fix: change line "condition":system.LINUX_SYSTEM.is_feature_supported("GAMEMODE"), to "condition": bool(system.find_executable("gamemoded")),



Install insync 3 in order to use OneDrive on linux.

In order to use OpenRGB with DRAM etc, you need a patched kernel. I am using Xanmod's Linux kernel patched with OpenRGB.patch . With Aorus/Gigabyte add acpi_enforce_resources=lax as a kernel parameter.

For the making of the kernel you will need dwarves, libelf-dev, bison, flex, 

clone the latest branch of xanmod with git clone https://github.com/xanmod/linux.git xanmod --branch *.*

If you tried and make the kernel but failed, clean the git file with git clean -fx and go through the process of oldmake and menumake again etc.

install all the .deb files made from the kernel, usually found in the directory above the one used to install

follow the stuff in the xanmod website in order to add the kernel repo.

##### Pop-OS

To get the GDM Screen to output on the primary monitor at start use sudo cp ~/.config/monitors.xml ~gdm/.config/

#### Disable devices from waking from sleep

So you have a device that is waking your computer up from sleeping, well now lets fix that issue!

First you have to find out which devices are causing your computer from waking from sleep. First do  cat /proc/acpi/wakeup to see which devices are enabled to wake up your machine from sleep. For this example lets say D1A1, D2A0 and D1C0 are enabled. Use sudo echo D1A1 >> /proc/acpi/wakeup in order to disable the device and put the computer to sleep. If it wakes up, then either that device wasn't it or there are more devices that are preventing your computer from staying asleep. If it doesn't, then that or those devices were the culprit. However, these states don't persist through reboots so in order to make it permanent you  have to make a system service that will echo disable the devices at start up. Take note of which devices to disable, and then create a file in /etc/systemd/system . It can be named \*.service.  In that file, place the following:

[Unit]
Description=*something*

[Service]
ExecStart=/bin/bash -c "echo D1A0 >> /proc/acpi/wakeup; echo D2C0 >> /proc/acpi/wakeup"

[Install]
WantedBy=multi-user.target

Afterwards, save and do sudo systemctl daemon-reload, sudo systemctl start *something* , systemctl status *something*, and lastly to ensure it runs at boot, do sudo systemctl enable *something* 
