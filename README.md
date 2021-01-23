# linux-configs
Collection of various configs on Linux (OpenSUSE-Tumbleweed and Solus)

To do: Tumbleweed
Lutris: Fix pug in /usr/lib/python3.8/site-packages/lutris/sysoptions.py -> Cannot detect gamemoded so cannot enable option in Lutris

Fix: change line "condition":system.LINUX_SYSTEM.is_feature_supported("GAMEMODE"), to "condition": bool(system.find_executable("gamemoded")),

### Sample-rate increase DAC
copy the pulse config file from /etc/pulse/daemon.conf to ~/.config/pulse with cp /etc/pulse/daemon.conf ~/.config/pulse
take out the semi-colon for resample-method (set to soxr-vhq), default-sample-format (find out if you are little or big endian) (float32le), and default-sample (set to 48000) and alternative sample rate (set to 192000). Save and kill pulse audio with pulseaudio -k


IF your audio is skipping, 


https://www.codeweavers.com/support/wiki/linux/faq/SoundTrouble#advancedpulse

Before making this adjustment, it may be best to read about it here.

With extreme caution, edit the configuration file at:

/etc/pulse/default.pa

look for the line that includes:

load-module module-udev-detect

And add tsched=0 to the end so that the above example would look like this:
if there are other parameters in this line, do not delete them, simply add tsched=0 to the end of the line.

load-module module-udev-detect tsched=0

### One Drive

Install insync 3 in order to use OneDrive on linux.


### RGB
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

Well actually check which devices are causing your computer to wake from sleep by checking each out individually. In addition, see what is causing your system to wake up via dmesg, journalctl, and cat /var/log/syslog. For this example, I figured that my External hard drive was causing my system to immediately wake up. Why is that though? before it never had trouble with that. Now my suspicion is that the hard drive shared the same pci group slot as my mice and keyboard (pci0000:40:7.1 ; you can find this out by a combo of /proc/acpi/wakeup, usb-devices), and thus it would wake up the computer as long as it wasn't shut down when I put my computer to sleep. When I looked at /proc/acpi/wakeup, one of the entries was allowing wakeup to happen from pci0000:40:7.1, and disabling didn't help. The only thing that allowed me to put my computer to sleep without an instant wake up was to switch the usb slot that the EHDD was connected to and voila, it worked. However if this doesn't help.....



First you have to find out which devices are causing your computer from waking from sleep. First login to admin with sudo -i. Afterwards use cat /proc/bus/input/devices to see which devices are connected to the computer. In this example I know that the Razer docks I have are causing the computer to wake up from sleep instantenously, so I look for those devices. Under the S: Sysfs=/devices.... for that device, I look at the number directly after pci0000:** , say Sysfs/devices/pci0000:40/0000:40:07.1. Take a note of that number and now use cat /proc/acpi/wakeup. Find that number and its corresponding device name, say for this example D1A0. Create a service in /etc/systemd/system name *something*.service, and in it put the following inside:

[Unit]
Description=*something*

[Service]
ExecStart=/bin/bash -c "echo D1A0 >> /proc/acpi/wakeup; echo D2C0 >> /proc/acpi/wakeup"

[Install]
WantedBy=multi-user.target

Afterwards, save and do sudo systemctl daemon-reload, sudo systemctl start *something* , systemctl status *something*, and lastly to ensure it runs at boot, do sudo systemctl enable *something* 


## Coolio Packages and Programs

superpaper - to set papes for each screen individually, kind of reminds me of display fusion. Install via pip, get at https://github.com/hhannine/superpaper . Install the gnome extension TopIcons Plus if using superpaper with gnome (and if you unchecked the show help button)

nautilus-open-any-terminal - Allows you to add an entry to the context menu in nautilus which will allow you to use another terminal within Nautilus. Install via pip, but use sudo glib-compile-schemas ~/.local/share/glib-2.0/schemas before using dconf-editor so it can appear there.

jetbrains-toolbox - in /opt/, for all your ide needs.
