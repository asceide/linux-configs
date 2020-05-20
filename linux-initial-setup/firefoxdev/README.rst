.. role:: con(code)
  :language: bash


========================================
Firefox Developer Edition Installation
========================================


Installation
============

*There are two ways to install Firefox, locally or globally. I will be installing globally, but if you're installing locally just switch /opt/ with /.local/opt, /usr/bin with /.local/bin, and /usr/share/applications with /.local/share/applications*

1. Obtain the latest version of Firefox Dev via curl.

.. sourcecode:: bash

	curl --location "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" \ | tar --extract --verbose --preserve-permissions --bzip2
	
2. After the file is finished downloading and extracting, you want to move it to either /opt or ~/.local/opt. Since we are installing it globally we want to make /opt and then move the firefox folder there.

.. sourcecode:: bash

	sudo mkdir -p /opt/firefox
	sudo mv firefox /opt/firefox
	
3. Afterwards, we want to set a PATH to the binary, so place :con:`export PATH=/opt/firefox:$PATH` in your ``~/.zshrc`` or shell profile.

4. In order to ensure updates, change the ownership of /opt/firefoxdev to you via :con:`sudo chown -R $USER /opt/firefox`.

5. Create a symlink from the binary and place it in /usr/bin via :con:`sudo ln -s /opt/firefox/firefox /usr/bin`.

6. Afterwards, you would want to create a .desktop file so it will appear in the menu and so you can launch it. Place the following into its a text file and save it as .desktop

.. sourcecode:: vim
	[Desktop Entry]
	Name=Firefox Developer Edition
	GenericName=Web Browser
	Exec=/opt/firefox/firefox/firefox-bin %u
	Icon=/opt/firefox/firefox/browser/chrome/icons/default/default128.png
	Terminal=false
	Type=Application
	MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
	StartupNotify=true
	Categories=Network;WebBrowser;
	Keywords=web;browser;internet;
	Actions=new-window;new-private-window;
	StartupWMClass=Firefox Developer Edition

	Name[en_US]=Firefox Developer Edition

	[Desktop Action new-window]
	Name=Open a New Window
	Exec=/opt/firefox/firefox/firefox-bin %u

	[Desktop Action new-private-window]
	Name=Open a New Private Window
	Exec=/opt/firefox/firefox/firefox-bin --private-window %u
	
7. Move the .desktop file to /usr/share/applications with :con:`sudo mv [PATH TO DESKTOP FILE] /usr/share/applications`.

8. Reboot and you should be done.
