#!/bin/sh

# suspend KWIN compositor
echo $XDG_CURRENT_DESKTOP | grep KDE && qdbus org.kde.KWin /Compositor suspend

# set display
[ -z $SWAYSOCK ] || [ -z $(echo $XDG_SESSION_TYPE | grep wayland) ] && $HOME/arch/scripts/display/100-144.sh && exit 1
swaymsg output DP-1 max_render_time off
sleep 0.1
swaymsg output DP-2 max_render_time off
sleep 0.1
$HOME/.config/sway/vrr_on.sh

# launch on left monitor
xrandr --output XWAYLAND1 --primary
