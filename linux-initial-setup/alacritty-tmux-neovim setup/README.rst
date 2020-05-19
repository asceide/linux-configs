.. role::con(code)
  :language: bash

=====================================
Setup for Alacritty, Tmux and Neovim
=====================================

-----------------------------------------
Installation is always the easiest part.
-----------------------------------------

Installation
=============

Installation should be the easiest part. In your package manager, look up `alacritty`, `tmux`, and `neovim` and install them using your respective package manager.

Configuration
==============

Lets start first with Alacritty

Alacritty Configuration Part I.
--------------------------------
As Alacritty does not provide its own config file, you must make one or move an existing config file to places it can read. Download the one in this repo and move it to an appropriate directory.

.. sourcecode:: bash

	mv alacritty.yml ~/.config/alacritty/alacritty.yml
	
For now, we can leave it at that as we want to set up tmux

Tmux Configuration
-------------------
When I first opened tmux it was a mess, tmux was showing regex where the terminal information was supposed to be. I'm lazy however, so I just got a configuration from `Oh My Tmux! <https://github.com/gpakosz/.tmux>`_. In order to do so, use the following commands:

.. sourcecode:: bash

	cd
	git clone git@github.com:gpakosz/.tmux.git
	ln -s -f .tmux/.tmux.conf
	cp .tmux/.tmux.conf.local
	
You shall do your configurations via .tmux.conf.local

For the most part, I just change a couple of things:

	a. I change the ```tmux_conf_theme_terminal_title`` attribute to ``'❐#S >> #I.#W >> #{username}#{root}@#h  ● #(pwd="#{pane_current_path}"; echo ${pwd####*/})'``
	b. Under ``# status left/right sections separators`` I comment the default options and decomment ``tmux_conf_theme_left_separator_(main/sub)`` and ``tmux_conf_right_separator_(main/sub)``
