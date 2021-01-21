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
