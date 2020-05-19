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

	a. I change the ``tmux_conf_theme_terminal_title`` attribute to ``'❐#S >> #I.#W >> #{username}#{root}@#h  ● #(pwd="#{pane_current_path}"; echo ${pwd####*/})'``
	b. Under ``# status left/right sections separators`` I comment the default options and decomment ``tmux_conf_theme_left_separator_(main/sub)`` and ``tmux_conf_right_separator_(main/sub)``
	
Alacritty Configutation Part II.
---------------------------------
Now we want to change the color theme for alacritty. Normally this involves going into the ``alacritty.yml`` file and changing the values there. But again, I'm lazy so there is a nifty tool at `Alacritty Colorscheme <https://github.com/toggle-corp/alacritty-colorscheme>`_ to help us out with this. 

You can use pip, or install it manually. 

**pip**

.. sourcecode:: bash
	
	pip install git+https://github.com/toggle-corp/alacritty-colorscheme.git

**manually**	

.. sourcecode:: bash

	# Get program
	git clone https://github.com/toggle-corp/alacritty-colorscheme.git

	# Install
	python setup.py install --user
	
Afterwards, we are going to download two color schemes from  `alacritty-theme <https://github.com/eendroroy/alacritty-theme>`_ and `base-16-alacritty <https://github.com/aaron-williamson/base16-alacritty>`_ . Do note that you can create your own color schemes and use the tool alongside it

.. sourcecode:: bash

	git clone git@github.com:eendroroy/alacritty-theme.git ~/.config/alacritty/themes
	git clone git@github.com:aaron-williamson/base16-alacritty.git ~/.config/alacritty/themes16
	
In order to toggle between themes you would use :con:`alacritty-colorscheme -C ~/.config/alacritty/themes/themes -T` . See the program documentation with :con:`alacritty-colorscheme --help` for more information.

Regardless, we have to add ``# color_start`` and ``# color_end`` in the ``alacritty.yml`` before and after the color section in order for alacritty-colorsheme to find where to add the color scheme.

.. sourcecode:: vim
	
	# color_start
	# thelovelace.yaml
	colors:
  	 # Default colors
  	 primary:
    	  background: '0x1D1F28'
    	  foreground: '0xFDFDFD'

  	 # Normal colors
  	 normal:
  	 # Bright colors
    	  black:   '0x282A36'
    	  red:     '0xF37F97'
    	  green:   '0x5ADECD'
     	  yellow:  '0xF2A272'
    	  blue:    '0x8897F4'
    	  magenta: '0xC574DD'
    	  cyan:    '0x79E6F3'
    	  white:   '0xFDFDFD'
  	 bright:
    	  black:   '0x414458'
    	  red:     '0xFF4971'
    	  green:   '0x18E3C8'
    	  yellow:  '0xEBCB8B'
    	  blue:    '0xFF8037'
    	  magenta: '0x556FFF'
    	  cyan:    '0x3FDCEE'
    	  white:   '0xBEBEC1'
  	  indexed_colors: []
 	# color_end
	
is an example of how the color file would look like.	

Alacritty+Tmux
---------------
Now we want to make so that Tmux starts automatically whenever Alacritty starts. In ``alacritty.yml``, find the shell section and change it to the following:

.. sourcecode:: vim

	shell:
	  program: /bin/zsh
	  args:
	    - -l
	    - -c
	    - "tmux attach || tmux"
	    
Now tmux should start with alacritty automatically.

Short NeoVim setup
-------------------
I'm used to typing vim whenever I call it, so to use nvim instead of vim, put the following in your ~/.zshrc file:

.. sourcecode:: vim

	if type nvim > /dev/null 2>&1; then
		alias vim='nvim'
	fi
	
In addition, add the following so you can use the alias whenever you call sudo

.. sourcecode:: vim

	alias sudo=`sudo `



