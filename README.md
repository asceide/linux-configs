# linux-configs
Collection of various configs on Linux (OpenSUSE-Tumbleweed and Solus)

To do: Tumbleweed
Lutris: Fix pug in /usr/lib/python3.8/site-packages/lutris/sysoptions.py -> Cannot detect gamemoded so cannot enable option in Lutris

Fix: change line "condition":system.LINUX_SYSTEM.is_feature_supported("GAMEMODE"), to "condition": bool(system.find_executable("gamemoded")),



Install insync 3 in order to use OneDrive on linux.
