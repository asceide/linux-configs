.. role:: cond(code)
  :language: bash


===============================
**PopOS Set-up Tips & Tricks**
===============================

Lockscreen Wallpaper
======================

* So the way that System76 is doing their lockscreen greeting is by building a binary and using it. As a result, you will either have to unpack and build the binary yourself after doing your changes ORRR use the handyscript below 
* https://github.com/thiggy01/change-gdm-background


Tray Icons
===========
 If your tray icons aren't being updated in realtime, you may have to remove :cond:`indicator-application` and related packages. See https://github.com/ubuntu/gnome-shell-extension-appindicator/issues/255


Unread Notifications
=====================
I'm not sure which icon the notification icon uses (the one besides the time), but it is a mimetype under 16/16@2.

