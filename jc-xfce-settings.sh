#!/usr/bin/env bash
#
# This file is part of the jc-xfce-settings:
# https://github.com/jamescherti/jc-xfce-settings
#
# This file was created with the help of watch-xfce-xfconf:
# https://github.com/jamescherti/watch-xfce-xfconf/
#
# Copyright (C) 2021-2025 James Cherti
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

#-------------------------------------------------------------------------------
# xsettings
#-------------------------------------------------------------------------------
xfconf-query --create -c 'xsettings' -p '/Xft/Antialias' --type 'int' --set '1'

# 1 enable hinting / 0 disable hinting
xfconf-query --create -c 'xsettings' -p '/Xft/Hinting' --type 'int' --set '1'

# hintnone, hintslight, hintmedium, hintfull
xfconf-query --create -c 'xsettings' \
  -p '/Xft/HintStyle' --type 'string' --set 'hintmedium'

# none, rgb, bgr, vrgb, vbgr
xfconf-query --create -c 'xsettings' \
  -p '/Xft/RGBA' --type 'string' --set 'rgb'

xfconf-query --create -c 'xsettings' \
  -p '/Gtk/CursorThemeSize' --type 'string' --set '32'

#-------------------------------------------------------------------------------
# Thunar
#-------------------------------------------------------------------------------
xfconf-query --create -c 'thunar' \
  -p '/misc-thumbnail-mode' --type 'string' \
  --set 'THUNAR_THUMBNAIL_MODE_ALWAYS'
xfconf-query --create -c 'thunar' \
  -p '/misc-directory-specific-settings' --type 'bool' --set 'true'
xfconf-query --create -c 'thunar' \
  -p '/misc-single-click' --type 'bool' --set 'true'
xfconf-query --create -c 'thunar' \
  -p '/misc-thumbnail-mode' --type 'string' \
  --set 'THUNAR_THUMBNAIL_MODE_ONLY_LOCAL'

#-------------------------------------------------------------------------------
# Keyboard
#-------------------------------------------------------------------------------
# The time, in milliseconds, before a pressed key begins repeating
xfconf-query --create -c 'keyboards' \
  -p '/Default/KeyRepeat/Delay' --type 'int' --set '290'

# The rate at which keystrokes are generated while a key is pressed
xfconf-query --create -c 'keyboards' \
  -p '/Default/KeyRepeat/Rate' --type 'int' --set '120'
xfconf-query --create -c 'keyboards' \
  -p '/Default/KeyRepeat' --type 'bool' --set 'true'

#-------------------------------------------------------------------------------
# Notifications
#-------------------------------------------------------------------------------
xfconf-query --create -c 'xfce4-notifyd' \
  -p '/theme' --type 'string' --set 'Bright'
xfconf-query --create -c 'xfce4-notifyd' \
  -p '/expire-timeout' --type 'int' --set '5'
xfconf-query --create -c 'xfce4-notifyd' \
  -p '/notify-location' --type 'uint' --set '3' # 3=bottom right

#-------------------------------------------------------------------------------
# xfce4-desktop
#-------------------------------------------------------------------------------
# 0=no_icons 1=minimized_apps_icons 2=file_launcher_icons
xfconf-query --create -c 'xfce4-desktop' \
  -p '/desktop-icons/style' --type 'int' --set '0'

# Window list menu
xfconf-query --create -c 'xfce4-desktop' \
  -p '/windowlist-menu/show' --type 'bool' --set 'false'

# Desktop menu
xfconf-query --create -c 'xfce4-desktop' \
  -p '/desktop-menu/show' --type 'bool' --set 'false'

xfconf-query --create -c 'xfce4-desktop' \
  -p '/desktop-icons/show-tooltips' --type 'bool' --set 'false'

#-------------------------------------------------------------------------------
# Displays
#-------------------------------------------------------------------------------
# Configure new displays when connected
xfconf-query --create -c 'displays' \
  -p '/Notify' --type 'bool' --set 'true'

#-------------------------------------------------------------------------------
# Session
#-------------------------------------------------------------------------------
xfconf-query --create -c 'xfce4-session' \
  -p '/general/SaveOnExit' --type 'bool' --set 'false'
xfconf-query --create -c 'xfce4-session' \
  -p '/general/AutoSave' --type 'bool' --set 'false' # auto save session

#-------------------------------------------------------------------------------
# Power management
#-------------------------------------------------------------------------------
# 0=switch_off_display 1=suspend 2=hibernate 3=lock_screen
xfconf-query --create -c 'xfce4-power-manager' \
  -p '/xfce4-power-manager/lid-action-on-ac' --type 'uint' --set '1'

# 0=switch_off_display 1=suspend 2=hibernate 3=lock_screen
xfconf-query --create -c 'xfce4-power-manager' \
  -p '/xfce4-power-manager/lid-action-on-battery' --type 'uint' --set '1'

# 0=do_nothing 1=suspend 2=hibernate 3=ask 4=shutdown
xfconf-query --create -c 'xfce4-power-manager' \
  -p '/xfce4-power-manager/power-button-action' --type 'uint' --set '1'

# 0=do_nothing 1=suspend 2=hibernate 3=ask 4=shutdown
xfconf-query --create -c 'xfce4-power-manager' \
  -p '/xfce4-power-manager/sleep-button-action' --type 'uint' --set '1'

# 0=do_nothing 1=suspend 2=hibernate 3=ask 4=shutdown
xfconf-query --create -c 'xfce4-power-manager' \
  -p '/xfce4-power-manager/battery-button-action' --type 'uint' --set '1'

xfconf-query --create -c 'xfce4-power-manager' \
  -p '/xfce4-power-manager/lock-screen-suspend-hibernate' \
  --type 'bool' --set 'true'

# Disables logind handling, allowing XFCE to handle the lid switch.
# It allows a per-user configuration, and avoid conflicts with logind.
xfconf-query --create -c 'xfce4-power-manager' \
  -p '/xfce4-power-manager/logind-handle-lid-switch' --type 'bool' --set 'false'

# Configure the session manager to lock the screen on shutdown or restart
xfconf-query --create -c 'xfce4-session' \
  -p '/shutdown/LockScreen' --type 'bool' --set 'true'

#-------------------------------------------------------------------------------
# XFCE 4 Screensaver
#-------------------------------------------------------------------------------
# Set the session lock command depending on the available screen locker
if type -P xfce4-screensaver-command &>/dev/null; then
  xfconf-query --create -c 'xfce4-session' -p '/general/LockCommand' \
    -s "xfce4-screensaver-command  -a" --type string

  # Enable Display Power Management Signaling (DPMS) to allow the system to
  # automatically manage monitor power states
  xfconf-query --create -c 'xfce4-power-manager' \
    -p '/xfce4-power-manager/dpms-enabled' --type 'bool' --set 'true'

  # Enables screen locking when the screensaver is activated.
  xfconf-query --create -c 'xfce4-screensaver' \
    -p '/lock/enabled' --type 'bool' --set 'true'

  # Enables the screensaver itself, so that it activates after a period of
  # inactivity.
  xfconf-query --create -c 'xfce4-screensaver' \
    -p '/saver/enabled' --type 'bool' --set 'true'

  # Locks the screen on logout, so that if someone logs out, the screen will be
  # locked and require authentication to access again.
  xfconf-query --create -c 'xfce4-screensaver' \
    -p '/lock/logout/enabled' --type 'bool' --set 'true'

  # Allow fullscreen applications to inhibit the screensaver
  xfconf-query --create -c 'xfce4-screensaver' \
    -p '/saver/fullscreen-inhibit' --type 'bool' --set 'true'

  # Enable screensaver activation based on user idle time
  xfconf-query --create -c 'xfce4-screensaver' \
    -p '/saver/idle-activation/enabled' --type 'bool' --set 'true'

  # Enable screen locking when the screensaver activates
  xfconf-query --create -c 'xfce4-screensaver' \
    -p '/lock/saver-activation/enabled' --type 'bool' --set 'true'
elif type -P light-locker &>/dev/null && type -P dm-tool &>/dev/null; then
  xfconf-query --create -c 'xfce4-session' -p '/general/LockCommand' \
    -s "dm-tool lock" --type string
elif type -P xscreensaver-command &>/dev/null; then
  xfconf-query -c xfce4-session -p /general/LockCommand \
    -s "xscreensaver-command -lock" --create -t string
elif type -P light-locker; then
  xfconf-query --create -c 'xfce4-session' -p '/general/LockCommand' \
    -s "light-locker-command -l" --type string
fi

#-------------------------------------------------------------------------------
# XFWM 4
#-------------------------------------------------------------------------------
xfconf-query --create -c 'xfwm4' \
  -p '/general/cycle_workspaces' --type 'bool' --set 'false'
xfconf-query --create -c 'xfwm4' \
  -p '/general/box_move' --type 'bool' --set 'false'
xfconf-query --create -c 'xfwm4' \
  -p '/general/box_resize' --type 'bool' --set 'true'
xfconf-query --create -c 'xfwm4' \
  -p '/general/activate_action' --type 'string' --set 'switch'

# Hide frame of windows when maximized
xfconf-query --create -c 'xfwm4' \
  -p '/general/borderless_maximize' --type 'bool' --set 'true'

xfconf-query --create -c 'xfwm4' \
  -p '/general/cycle_minimum' --type 'bool' --set 'true'

# Cycle windows using icons
xfconf-query --create -c 'xfwm4' \
  -p '/general/cycle_tabwin_mode' --type 'int' --set '0'

xfconf-query --create -c 'xfwm4' \
  -p '/general/frame_opacity' --type 'int' --set '100'
xfconf-query --create -c 'xfwm4' \
  -p '/general/inactive_opacity' --type 'int' --set '100'
xfconf-query --create -c 'xfwm4' \
  -p '/general/move_opacity' --type 'int' --set '100'
xfconf-query --create -c 'xfwm4' \
  -p '/general/placement_mode' --type 'string' --set 'mouse'
xfconf-query --create -c 'xfwm4' \
  -p '/general/popup_opacity' --type 'int' --set '100'

# Keep it false because the Application Finder cannot steal focus
xfconf-query --create -c 'xfwm4' \
  -p '/general/prevent_focus_stealing' --type 'bool' --set 'false'

xfconf-query --create -c 'xfwm4' \
  -p '/general/raise_with_any_button' --type 'bool' --set 'false'
xfconf-query --create -c 'xfwm4' \
  -p '/general/resize_opacity' --type 'int' --set '100'

# Use the mouse wheel on the desktop to switch workspaces
xfconf-query --create -c 'xfwm4' \
  -p '/general/scroll_workspaces' --type 'bool' --set 'false'

# Window snapping to other windows
xfconf-query --create -c 'xfwm4' \
  -p '/general/snap_to_windows' --type 'bool' --set 'true'

# Hide title of windows when maximized
xfconf-query --create -c 'xfwm4' \
  -p '/general/titleless_maximize' --type 'bool' --set 'true'

xfconf-query --create -c 'xfwm4' \
  -p '/general/wrap_cycle' --type 'bool' --set 'false'

# Wrap workspaces when the first of the last workspace is reached
xfconf-query --create -c 'xfwm4' \
  -p '/general/wrap_cycle' --type 'bool' --set 'false'

xfconf-query --create -c 'xfwm4' \
  -p '/general/wrap_layout' --type 'bool' --set 'false'

# Do not wrap workspaces when reaching the screen edge when dragging a Window
xfconf-query --create -c 'xfwm4' \
  -p '/general/wrap_windows' --type 'bool' --set 'false'

# Display full screen overlay windows directly
xfconf-query --create -c 'xfwm4' \
  -p '/general/unredirect_overlays' --type 'bool' --set 'true'

# Show windows preview in place of icons when cycling
xfconf-query --create -c 'xfwm4' \
  -p '/general/cycle_preview' --type 'bool' --set 'false'

# Show shadows under popup windows
xfconf-query --create -c 'xfwm4' \
  -p '/general/show_popup_shadow' --type 'bool' --set 'false'

# Show shadows under regular windows
xfconf-query --create -c 'xfwm4' \
  -p '/general/show_frame_shadow' --type 'bool' --set 'false'

# Show shadows under dock windows
xfconf-query --create -c 'xfwm4' \
  -p '/general/show_dock_shadow' --type 'bool' --set 'false'

# Zoom pointer along with the desktop
xfconf-query --create -c 'xfwm4' \
  -p '/general/zoom_pointer' --type 'bool' --set 'false'

# Zoom desktop with mouse wheel
xfconf-query --create -c 'xfwm4' \
  -p '/general/zoom_desktop' --type 'bool' --set 'false'

# Minimum size to trigger smart placement
xfconf-query --create -c 'xfwm4' \
  -p '/general/placement_ratio' --type 'int' --set '100'

xfconf-query --create -c 'xfwm4' \
  -p '/general/cycle_hidden' --type 'bool' --set 'true'
xfconf-query --create -c 'xfwm4' \
  -p '/general/cycle_draw_frame' --type 'bool' --set 'true'

echo "Success."
