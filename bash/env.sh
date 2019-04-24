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

export TERM=xterm-256color
export EDITOR=vim
export LC_ALL=en_US.UTF-8

export PATH=~/.composer/vendor/bin:$PATH

# Colored GCC warnings and errors.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Export the home path of the lib-gdsl library.
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
