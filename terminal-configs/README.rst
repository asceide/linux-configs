.. role:: con(code)
    :language: bash

====================
**Terminal Set Up**
====================

**Kitty**
==========
I am using Kitty as my terminal. Honestly, for me it is a a matter of preference. Depending on your window manager, you may have to run certain commands to set it up as a default terminal.

Gnome
------

.. code:: bash

    sudo update-alternatives --config x-terminal-emulator

Place the included kitty config in ~/.config/kitty

**ZSH!**
===============
First make sure that zsh is installed via :con:`cat /etc/shells` . If zsh is not listed, install it via your package manager.
Change the default shell via :con:`$ chsh -s $(which zsh)` and then logout. Once that is done when you use the terminal again, you will get a prompt. Just quit it/ignore it.

**Oh My Zsh!**
================
Its time to install OMZSH!.
Run the following to install it.

.. code:: bash

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

Once installed, there is a need to download and install some plugins for it, namely zsh-syntax-highlighting and zsh-autosuggestions

.. code:: bash

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

After the installation, we are going to install the Pure Prompt.

**Pure Prompt**
=================
Instead of zsh themes, we are going to use pure prompt for our terminal. First, make sure npm is installed, if not, install it via your package manager. After it is installed, use the following command to install Pure Prompt:

.. code:: bash

    npm install --global pure-prompt --allow-root --unsafe-perm=true

*Note, if you're going to be using zsh themes with powerline fonts, there are other steps that are needed to be taken. However, as right now I like pure, I'm not going to be writing about it.

**NVIM**
=========
Install neovim if it isn't already. Place the cofiguration file in ~/.config

**Finally**
=============
Place the .zshrc file in ~
