.. role:: cond(code)
  :language: bash

=======================
**Linux Initial Setup**
=======================

-------------------------------------------------------
*Installing Programmings and adjusting configurations*
-------------------------------------------------------

**Razer Laptops**
==================
* There is a problem with Razer laptops in which the laptop will infinitely get suspended after closing the lid once. This is because the system doesn't set the fact that the lid is open. As a result add :cond:`button.lid_init_state=open` as a kernel parameter (grub etc)

PopOS
-------
Add that parameter under options via :cond:`sudo vi /boot/efi/loader/entries/Pop_OS-current.conf`.

**git**
=========
* *(If needed)* Install git via package manager
* See specific folder for more information


**Visual Studio Code**
=========================
* Check package manager if you're not using a rpm or deb based distro.
* With apt based package manager, download the .deb at https://code.visualstudio.com/ and run :cond:`sudo apt install */*.deb`

**nVidia Drivers**
======================
* See specific distro information to install
* Use glxgears to check main monitor refresh rate. It should never be at 60 if you're using a mixed refresh rate envirionment.
* If using mixed refresh rate monitors, add the following line to /etc/environment
* __GL_SYNC_DISPLAY_DEVICE=DP-X (X being the monitor you want the refresh rate to sync to, found via xrandr -q)



**Install TeXLive**
====================


