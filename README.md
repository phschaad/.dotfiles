# phschaad dotfiles

These are my (Philipp Schaad) personal dotfiles. Feel free to use and/or
modify them to your taste.

| Table of Contents |
| --- |
| [Disclaimer](#disclaimer) |
| [Is this compatible with my system?](#compatibility) |
| [What does this contain?](#components) |
| [Installing the configurations](#install) |
| [What about those scripts?](#scripts) |
| [Additional software packages](#packages) |

<a name="disclaimer"></a>
## Disclaimer

I recommend trying to understand them thoroughly before installing them on your
own system. To make this easier, I have tried to mark everything with concise
comments where code/script itself is not self explanatory.

<a name="compatibility"></a>
## Is this compatible with my system?

Those files are meant for and tested on Ubuntu systems. However, the dotfiles
themselves should be more or less platform independent.

<a name="components"></a>
## What does this contain?

The dotfiles contained in this repository are meant for a number of different
software packages.

| Configuration for | Notes | File(s) |
| --- | --- | --- |
| System (`.inputrc`) | System and utilitary configurations | `.inputrc` |
| [Bourne-again shell (BASH)](https://linux.die.net/man/1/bash) | A number of custom functions, aliases, and environment variables | `.bashrc` `.profile` |
| [Vim](https://www.vim.org/) / [Neovim](https://neovim.io/) | Vim mappings, functions, and plugins | `.vimrc` `.config/nvim/init.vim` |
| [Git](https://git-scm.com/) | Git global configurations | `.gitconfig` |
| [Ctags](http://ctags.sourceforge.net/) | Exuberant ctags configurations | `.ctags` |
| [Tmux](https://github.com/tmux/tmux) | Tmux mappings and configurations | `.tmux.conf` |

In addition to the mentioned configuration dotfiles this also includes a small
selection of custom shell scripts (found inside the `scripts/` directory), as
well as an install script (`install.sh`) for bootstrapping the configuration
files on to your system. More on this in their respective secions on
[scripts](#scripts) and [bootstrapping](#install).

If you decide to use the bootstrap script to install the dotfiles on your
system, you also have the option of installing a few standard software packages
from a curated list, based on what I typically use and need on a newly set up
system. Check the relevant [section](#packages) for more information on this.

<a name="install"></a>
## Installing the configurations

To use this selection of dotfiles without any modification you should clone
this repository into your home directory as a hidden folder as follows:

```
git clone https://github.com/phschaad/.dotfiles ~/.dotfiles
```

After this, check if the included install script is marked as executable. If
not, add the necessary permissions:

```
chmod 744 ~/.dotfiles/install.sh
```

Proceed by running the script as follows:

```
sudo ~/.dotfiles/install.sh
```

This will initially back up any pre-existing configuration files that would be
overwritten into a new folder `~/.dotfiles.bak`. It will proceed by symlinking
all of the necessary files into your home directory. If run with superuser
privileges, you will be prompted with an options menu where you can install
additional software packages. If run without `sudo`, the script will finish
after linking without installing anything else.

<a name="scripts"></a>
## What about those scripts?

##### `256-colors.sh`

Display all 256 terminal colors as foreground and background colors, together
with their respective terminal color code. This only works if you have a 256
capable color terminal, for obvious reasons.

---

##### `.git-prompt-sh`

A utility script for the bash prompt, to display the current branch if inside
of a git tracked directory.

---

<a name="packages"></a>
## Additional software packages

The software packages installed by the script can be broken down into
a set of categories as follows:

##### Installed no matter what else you choose:

- [vim](https://www.vim.org/)
- [git](https://git-scm.com/)
- [dialog](http://manpages.ubuntu.com/manpages/bionic/man1/dialog.1.html)
- [tmux](https://github.com/tmux/tmux)
- [software-properties-common](https://packages.debian.org/sid/admin/software-properties-common)

##### Utilities:

- [tig](https://github.com/jonas/tig)
- [thefuck](https://github.com/nvbn/thefuck)
- [vlc](https://www.videolan.org/vlc/index.html)
- [snapd](https://github.com/snapcore/snapd)
- [curl](https://curl.haxx.se)
- [neovim](https://neovim.io/)
- [gnome-tweaks](https://gitlab.gnome.org/GNOME/gnome-tweaks)
- [gnome-shell-extensions](https://extensions.gnome.org/)
- [chrome-gnome-shell](https://github.com/GNOME/chrome-gnome-shell)
- [filezilla](https://filezilla-project.org/)
- [grub-customizer](https://launchpad.net/grub-customizer)
- [htop](https://hisham.hm/htop/)
- [exuberant-ctags](http://ctags.sourceforge.net/)
- [ranger](https://ranger.github.io/)
- [net-tools](https://wiki.linuxfoundation.org/networking/net-tools)
- [communitheme](https://snapcraft.io/communitheme)

##### C/C++ Stack:

- [gcc](http://gcc.gnu.org/)
- [g++](http://gcc.gnu.org/)
- [cmake](https://cmake.org/)
- [build-essential](https://packages.debian.org/search?keywords=build-essential)
- [gdb](https://www.gnu.org/software/gdb/)
- [clang](https://clang.llvm.org/)

##### Python:

- [python](https://www.python.org/)
- [python3](https://www.python.org/)
- [python-pip](https://pypi.org/project/pip/)
- [python3-pip](https://pypi.org/project/pip/)
- [python-dev](https://packages.debian.org/search?keywords=python-dev)

##### LAMP Stack:

- [apache2](https://httpd.apache.org)
- [mysql-server](https://dev.mysql.com/downloads/mysql/)
- [php](https://www.php.net/)
- [libapache2-mod-php](https://packages.ubuntu.com/search?keywords=libapache2-mod-php)
- [php-dev](https://packages.debian.org/sid/php-dev)
- [libmcrypt-dev](https://packages.debian.org/sid/libmcrypt-dev)
- [php-pear](https://pear.php.net/)
- [php-mysql](https://www.php.net/manual/en/book.mysql.php)
- [php-common](https://packages.debian.org/sid/php-common)
- [php-cli](https://packagist.org/packages/splitbrain/php-cli)
- [php-gd](https://packages.debian.org/stretch/php-gd)
- [php-curl](https://www.php.net/manual/en/book.curl.php)
- [php-intl](https://www.php.net/manual/en/book.intl.php)
- [php-mbstring](https://www.php.net/manual/en/mbstring.installation.php)
- [php-bcmath](https://www.php.net/manual/en/book.bc.php)
- [php-imap](https://www.php.net/manual/en/book.imap.php)
- [php-xml](https://www.php.net/manual/en/book.xml.php)
- [php-odbc](https://php.net/manual/en/book.uodbc.php)
- [unixodbc](http://www.unixodbc.org/)
- [unixodbc-dev](https://packages.debian.org/sid/unixodbc-dev)
- [php-sybase](https://www.php.net/manual/en/book.sybase.php)
- [php-zip](https://php.net/manual/en/book.zip.php)
- [phpmyadmin](https://www.phpmyadmin.net/)
- [mcrypt-1.0.1](https://pecl.php.net/package/mcrypt/1.0.1)

##### Web Dev Stack:

- [nodejs](https://nodejs.org/en/)
- [yarn](https://yarnpkg.com/en/)
- [sass](https://sass-lang.com/)
- [webpack](https://webpack.js.org/)
- [grunt](https://gruntjs.com/)
- [gulp](https://gulpjs.com/)
- [composer](https://getcomposer.org/)

##### Chrome:

- [google-chrome-stable](https://www.google.com/chrome/)

##### Java:

- [oracle-java8-installer](https://launchpad.net/~webupd8team/+archive/ubuntu/java)

##### Image Editing:

- [gimp](https://www.gimp.org/)
- [inkscape](https://inkscape.org/)
