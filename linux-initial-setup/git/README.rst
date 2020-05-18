.. role:: con(code)
  :language: bash
  
====================================
Git Installation and Configuration
====================================


Installing Git
================
In most distrubutions, git should already be installed. However, in some like Solus, it isn't. Using that as an example, you want to install git via package manager like so: :con:`sudo eopkg it git`.

Configuring Git
=================

Global Configurations
----------------------
So now that you have successfully installed git, you have to start configuring it. First, start by setting some global configurations like so: 

.. code:: bash

	git config --global user.name "Your name"
	git config --global user.email "Your e-mail"

Done. But that doesn't mean you're quite able to pull, push or clone using your github account. There are two ways you can do about it: inputting your github name and password everytime you want to pull or push, or by using ssh.

Configuring ssh to use with git
--------------------------------
This is probably the easiest way to use git since at most you have to input your password once per session. 

1. Check if OpenSSH is installed. It should more than likely be already installed in your distro, but if it is not, install it via your distro's package manager.

2. Generate a new private/public ssh key pair with :con:`ssh-keygen -t rsa -b 4096 -C "email@example.com"`
   * When prompted, just press enter in order for it to create the ~/.ssh folder. Otherwise, changing the name of the file will cause it to save in the current directory and won't create ~/.ssh
   * Set a password always
   * If you want a key with its own unique name, :con:`cd ~/.ssh`, run con:`ssh-keygen -t rsa -b 4096 -C "email@example.com"`, and give it it's own unique name, like asceide_rsa.

3. After the private/public key pair has been generated, you want to associate the key with your github account. Make sure that you have xclip or any other similar program installed
   
   a. Go to github.com and login.
   b. Go to your settings and select "SSH and GPG keys"
   c. Click on "New SSH key"
   d. In the terminal, copy the contents of id_rsa.pub with :con:`cat ~/.ssh/id_rsa.pub | xclip -selection clip`.
   e. Paste whatever was copied in the clipboard to the box in github and save.

4. Now what you want to do is create a config file to use to connect via ssh. In this file you shall place the following contents:

.. sourcecode:: vim

	host git@github.com
	 User git
	 HostName github.com
	 AddKeysToAgent yes
	 IdentityFile ~/.ssh/id_rsa
	 
   Save that to a file called config in the ~/.ssh directory. You can change the host name, for example from git@github.com to git@github.com-asceide, or anything else, if you want.
    
