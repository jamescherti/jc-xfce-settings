#l!/usr/bin/env bash
#
# This file is part of the jc-xfce-settings:
# https://github.com/jamescherti/jc-xfce-settings
#
# This file was created with the help of watch-xfce-xfconf:
# https://github.com/jamescherti/watch-xfce-xfconf/
#
# Copyright (C) 2021-2024 James Cherti
#
# Distributed under terms of the MIT license.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

set -euf -o pipefail
IFS=$'\n\t'

#-------------------------------------------------------------------------------
# Init
#-------------------------------------------------------------------------------
# shellcheck disable=SC2317
error_handler() {
  local errno="$?"
  echo "Error: ${BASH_SOURCE[1]}:${BASH_LINENO[0]}" \
    "(${BASH_COMMAND} exited with status $errno)" >&2
  exit "${errno}"
}

trap "error_handler" ERR
set -o errtrace

if ! which xfconf-query >/dev/null 2>&1; then
  echo "Error: the command 'xfconf-query' does not exist." >&2
  exit 1
fi

#-------------------------------------------------------------------------------
# Title bar
#-------------------------------------------------------------------------------
xfconf-query --create -c 'xsettings' \
  -p '/Gtk/DecorationLayout' --type 'string' --set ':minimize,close'
xfconf-query --create -c 'xfwm4' \
  -p '/general/button_layout' --type 'string' --set '|HC'

# Windows buttons (O=options H=minimize M=maximize C=close)
# xfconf-query --create -c 'xfwm4' \
#   -p '/general/button_layout' --type 'string' --set 'O|HMC'

#-------------------------------------------------------------------------------
# xsettings
#-------------------------------------------------------------------------------
xfconf-query --create -c 'xsettings' -p '/Xft/Antialias' --type 'int' --set '1'

# 1 enable hinting / 0 disable hinting
xfconf-query --create -c 'xsettings' -p '/Xft/Hinting' --type 'int' --set '1'

# hintnone, hintslight, hintmedium, hintfull
xfconf-query --create -c 'xsettings' \
  -p '/Xft/HintStyle' --type 'string' --set 'hintfull'

# none, rgb, bgr, vrgb, vbgr
xfconf-query --create -c 'xsettings' \
  -p '/Xft/RGBA' --type 'string' --set 'rgb'

xfconf-query --create -c 'xsettings' \
  -p '/Gtk/CursorThemeSize' --type 'string' --set '32'

# xfconf-query --create -c 'xsettings' \
#   -p '/Net/ThemeName' --type 'string' --set 'Adwaita-dark'

# xfconf-query --create -c 'xsettings' \
#   -p '/Net/IconThemeName' --type 'string' --set 'Adwaita'

#-------------------------------------------------------------------------------
# Thunar
#-------------------------------------------------------------------------------
xfconf-query --create -c 'thunar' \
  -p '/misc-thumbnail-mode' --type 'string' --set 'THUNAR_THUMBNAIL_MODE_ALWAYS'
