#!/bin/sh

# resume KWIN compositor
echo $XDG_CURRENT_DESKTOP | grep KDE && qdbus org.kde.KWin /Compositor resume

# set display
[ -z $SWAYSOCK ] || [ -z $(echo $XDG_SESSION_TYPE | grep wayland) ] && $HOME/arch/scripts/display/100-144-tearfree.sh && exit 1
$HOME/.config/sway/displayreset.sh

# reset XWAYLAND primary monitor
xrandr --output XWAYLAND0 --primary
