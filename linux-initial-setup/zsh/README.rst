.. role:: con(sourcecode)
  :language: console


====================================
ZSH Installation and Configuration
====================================


Installing ZSH
================
Installing ZSH is simple enough, if it is not already installed.
	
1. Check to see if the distro supports zsh by :con:`sudo cat /etc/shells` . If it does, ``bin/zsh`` should be listed.
2. Install zsh via package manager. For example, openSUSE would use :con:`sudo zypper in zsh` .
3. Follow the wizard if prompted.
4. Once finished, change the default shell to zsh via :con:`chsh -s /bin/zsh` . Restart terminal/computer and confirm that it has changed with :con:`echo $SHELL`

Afterwards, we are going to make using zsh a bit prettier.

Installing Oh My Zsh
=====================
**Make sure that you have curl or wget installed in your system before hand**

Installing Powerline
---------------------
Some themes in Oh My Zsh use powerline symbols, so we may want to install this.

Easiest way to get it is through the package manager. Using SolusOS as an example, get powerline fonts with:

.. sourcecode:: console

     sudo eopkg it powerline-fonts
	
But, alternatively you can accomplish the same with the following commands:

.. sourcecode:: console

     git clone https://github.com/powerline/fonts.git --depth=1
     cd fonts
     ./install.sh
     cd ..
     rm -rf fonts
     
Either way it is installed. Should you need to ever uninstall powerline, just clone the repo again and run :con:`./uninstall.sh` .

Installing Oh My Zsh
---------------------
So now that Powerline Symbols/Fonts are installed, we can now install Oh My Zsh simply by running

.. sourcecode:: console

	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	
Follow the wizard. You should be done afterwards. The location of the config file should be located in `~/.zshrc`
