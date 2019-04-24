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

source ~/.dotfiles/scripts/.git-prompt.sh
if [ $(tput colors) -lt 256 ]; then
    PS1='\[\e[1;33m\]\[$(printf '%*s' $(tput cols) '' | tr " " "=")\]\r=[\[\e[1;34m\]\t | \W$(__git_ps1 " | \e[1;31m%s")\[\e[1;33m\]]\n\[\e[1;34m\]Path: \w\n\[\e[1;32m\]>\[\e[0;31m\]\u\[\e[0;34m\]@\h\[\e[0;0m\]\$ '
else
    PS1='\[\e[38;5;214m\]\[$(printf '%*s' $(tput cols) '' | tr " " "=")\]\r=[\[\e[1m\e[38;5;141m\]\t | \W$(__git_ps1 " | \e[1;31m%s")\[\e[1m\e[38;5;214m\]]\n\[\e[38;5;141m\]Path: \w\n\[\e[38;5;114m\]>\[\e[0m\e[38;5;162m\]\u\[\e[38;5;39m\]@\h\[\e[0;0m\]\$ '
fi
