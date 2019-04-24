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

# Detach a process to run in the background SILENTLY!
detach() {
    nohup $1 >/dev/null
}

# Check if a reboot is required.
reboot_required() {
    if [ -f /var/run/reboot-required ]; then
        echo "Reboot required!"
    else
        echo "None required"
    fi
}

# CD into a directory and then list it immediately.
cdl() {
    cd $1
    ls -a
}
