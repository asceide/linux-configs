.. role:: con(code)
  :language: console


====================================
ZSH Installation and Configuration
====================================


Installing ZSH
================
Installing ZSH is simple enough, if it is not already installed.
	
1. Check to see if the distro supports zsh by :con:`sudo cat /etc/shells` . If it does, ``bin/zsh`` should be listed.
2. Install zsh via package manager. For example, openSUSE would use :con:`sudo zypper in zsh` .
3. Follow the wizard.
4. Once finished, change the default shell to zsh via :con:`chsh -s /bin/zsh` . Restart terminal/computer and confirm that it has changed with :con:`echo $SHELL`

Afterwards, we are going to make using zsh a bit prettier.

Installing Oh My Zsh
=====================

Installing Powerline
---------------------
Some themes in Oh My Zsh use powerline symbols, so we may want to install this.

Easiest way to get it is through the package manager. Using SolusOS as an example, get powerline fonts with:

.. sourcecode:: console

	sudo eopkg it powerline-fonts
	

