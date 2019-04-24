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

foreground=38
background=48

echo
echo
for color in {0..256} ; do
    echo -en "\e[${foreground};5;${color}m ${color}\t\e[0m"
    if [ $((($color + 1) % 10)) == 0 ] ; then
        # After 10 colors, go to the next line.
        echo
        let lower=color-9
        for ((bgcolor=$lower; bgcolor<=$color; bgcolor+=1)) ; do
            # Print the corresponding 10 background colors.
            echo -en "\e[${background};5;${bgcolor}m ${bgcolor}\t\e[0m"
        done
        echo
    fi
done
echo
# Finish of the remaining background colors.
for bgcolor in {250..256} ; do
    echo -en "\e[${background};5;${bgcolor}m ${bgcolor}\t\e[0m"
done
echo
echo
echo
