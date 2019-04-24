#!/usr/bin/env bash

# phschaad dotfiles
# Copyright (C) 2019  Philipp Schaad
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

if [[ $EUID -ne 0 ]]; then
    for node in '.bash_profile' '.bash_login'; do
        if [ -f ~/$node ] || [ -d ~/$node ]; then
            mkdir -p ~/.dotfiles.bak
            mv ~/$node ~/.dotfiles.bak/$node
        fi
    done

    # Install/Link all dotfiles.
    for node in '.bashrc' '.inputrc' '.profile' '.vimrc' \
        '.tmux.conf' '.ctags' '.gitconfig'; do
        if [ -f ~/$node ] || [ -d ~/$node ]; then
            mkdir -p ~/.dotfiles.bak
            mv ~/$node ~/.dotfiles.bak/$node
        fi
        ln -sv ~/.dotfiles/$node ~/$node
    done

    if [ -d ~/.vim ]; then
        mkdir -p ~/.dotfiles.bak
        mv ~/.vim ~/.dotfiles.bak/.vim
    fi
    mkdir -p ~/.vim
    mkdir -p ~/.vim/autoload
    mkdir -p ~/.vim/gutentags

    if [ -d ~/.config/nvim ]; then
        mkdir -p ~/.dotfiles.bak/.config
        mv ~/.config/nvim ~/.dotfiles.bak/.config/nvim
    fi
    mkdir -p ~/.config/nvim
    ln -sv ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

    echo "To install additional software, this script must be run as root"

    exit 0
else
    # Get the username of the user that started this script.
    username=$(logname)
    homedir=$HOME

    for node in '.bash_profile' '.bash_login'; do
        if [ -f $homedir/$node ] || [ -d $homedir/$node ]; then
            sudo -u $username mkdir -p $homedir/.dotfiles.bak
            mv $homedir/$node $homedir/.dotfiles.bak/$node
        fi
    done

    # Install/Link all dotfiles.
    for node in '.bashrc' '.inputrc' '.profile' '.vimrc' \
        '.tmux.conf' '.ctags' '.gitconfig'; do
        if [ -f $homedir/$node ] || [ -d $homedir/$node ]; then
            sudo -u $username mkdir -p $homedir/.dotfiles.bak
            mv $homedir/$node $homedir/.dotfiles.bak/$node
        fi
        sudo -u $username ln -sv $homedir/.dotfiles/$node $homedir/$node
    done

    if [ -d $homedir/.vim ]; then
        sudo -u $username mkdir -p $homedir/.dotfiles.bak
        mv $homedir/.vim $homedir/.dotfiles.bak/.vim
    fi
    sudo -u $username mkdir -p $homedir/.vim
    sudo -u $username mkdir -p $homedir/.vim/autoload
    sudo -u $username mkdir -p $homedir/.vim/gutentags

    if [ -d $homedir/.config/nvim ]; then
        sudo -u $username mkdir -p $homedir/.dotfiles.bak/.config
        mv $homedir/.config/nvim $homedir/.dotfiles.bak/.config/nvim
    fi
    sudo -u $username mkdir -p $homedir/.config/nvim
    sudo -u $username ln -sv $homedir/.dotfiles/.config/nvim/init.vim \
        $homedir/.config/nvim/init.vim

    # Update.
    echo "Updating apt repository..."
    apt update
    echo "Upgrading packages..."
    apt dist-upgrade -y

    # Install those packages that we need no matter what.
    apt install dialog tmux git vim software-properties-common -y

    # Select options for installing software.
    cmd=(dialog --separate-output --checklist \
    "Please select the packages you want to install:" 22 76 16)
    options=(1 "Utilities" on
             2 "C/C++ Dev Stack" on
             3 "Python" on
             4 "LAMP" on
             5 "WebDev" on
             6 "Chrome" on
             7 "Java (Oracle)" on
             8 "Photo Editing" on)
    choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear

    # Install and set up packages.
    for choice in $choices
    do
        case $choice in
            1)
                # Install utilities.
                echo "Installing Utilities"

                # Repository for grub-customizer.
                add-apt-repository ppa:danielrichter2007/grub-customizer
                add-apt-repository ppa:neovim-ppa/stable
                apt update

                # Install basic utilities.
                apt install tig thefuck vlc snapd curl neovim \
                    gnome-tweaks gnome-shell-extensions chrome-gnome-shell \
                    filezilla grub-customizer htop exuberant-ctags \
                    ranger net-tools -y

                # Install communitheme for ubuntu.
                snap install communitheme

                # Install vim plugins.
                sudo -u $username vim +PlugInstall +qall
                ;;
            2)
                # Install everything necessary for C/C++ development.
                echo "Installing C/C++ Stack"
                apt install gcc g++ cmake build-essential gdb clang -y
                ;;
            3)
                # Install Python.
                echo "Installing Python"
                apt install python python3 python-pip python3-pip \
                    python-dev -y
                ;;
            4)
                # Install LAMP stack.
                echo "Installing LAMP"
                apt install apache2 mysql-server -y
                mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH \
                    mysql_native_password BY 'root'; FLUSH PRIVILEGES;"
                apt install php libapache2-mod-php \
                    php-dev libmcrypt-dev php-pear php-mysql php-common \
                    php-cli php-gd php-mysql php-curl php-intl \
                    php-mbstring php-bcmath php-imap php-xml \
                    php-odbc unixodbc unixodbc-dev php-sybase \
                    php-zip phpmyadmin -y
                echo "Include /etc/phpmyadmin/apache.conf" >> \
                    /etc/apache2/apache2.conf
                pecl channel-update pecl.php.net
                pecl install mcrypt-1.0.1
                echo "extension=mcrypt.so" > /etc/php/7.2/cli/php.ini
                a2enmod rewrite
                service apache2 restart
                phpenmod pdo_dblib
                service apache2 restart
                ;;
            5)
                # Install Web stack.
                echo "Installing Web Development stack"
                curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | \
                    sudo apt-key add -
                echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
                    sudo tee /etc/apt/sources.list.d/yarn.list
                curl -sS https://getcomposer.org/installer | \
                    sudo php -- --install-dir=/usr/local/bin \
                    --filename=composer
                curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
                apt update
                apt install nodejs yarn -y
                npm install -g sass
                npm install -g webpack
                npm install -g grunt
                npm install -g gulp
                ;;
            6)
                # Install Chrome.
                echo "Installing Chrome"
				wget -q -O - \
                    https://dl-ssl.google.com/linux/linux_signing_key.pub | \
                    sudo apt-key add -
				sh -c 'echo "deb [arch=amd64] \
                    http://dl.google.com/linux/chrome/deb/ stable main" >> \
                    /etc/apt/sources.list.d/google-chrome.list'
				apt update
				apt install google-chrome-stable -y
                ;;
            7)
                # Install Java.
                echo "Installing Java"
                add-apt-repository ppa:webupd8team/java -y
                apt update
                apt install oracle-java8-installer -y
                ;;
            8)
                # Installing image editing software.
                echo "Installing Image editing software"
                apt install gimp inkscape -y
                ;;
        esac
    done

    apt autoremove -y
    apt autoclean

    exit 0
fi
