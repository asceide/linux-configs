.. role:: cond(code)
  :language: bash

==========================
Installing LaTex
==========================
*Because it is so much more useful to use TeX to make documents~*
-----------------------
Installation
-----------------------
TeXLive is probably better installed from the official installer rather than from any packages from your respective distribution.


1) Make sure that **perl** and **wget** are installed

2) at CLI, use :cond:`wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz` and then 
:cond:`tar zxf install-tl-unx.tar.gz` to download the installer

3) CD to the installation folder (:cond:`cd install-tl-20200517` for example) and use :cond:`sudo ./install-tl`

4) Add PATH, INFOPATH(points to .../texmf-dist/doc/info) and MANPATH(.../texmf-dist/doc/man) to your PATH
