#!/bin/sh

# start opentabletdriver.service
systemctl --user start opentabletdriver.service

# suspend KWIN compositor
echo $XDG_CURRENT_DESKTOP | grep KDE && qdbus org.kde.KWin /Compositor suspend

# set x display and exit if not running on sway session
[ -z $SWAYSOCK ] || [ -z $(echo $XDG_SESSION_TYPE | grep wayland) ] && $HOME/arch/scripts/display/100-144.sh && exit 1

# disable fullscreen and raw input
sed -i "s/^Fullscreen = 1/Fullscreen = 0/g" $HOME/Games/osu/game/osu\!.marco.cfg
sed -i "s/^RawInput = 1/RawInput = 0/g" $HOME/Games/osu/game/osu\!.marco.cfg
sed -i "s/^Letterboxing = 1/Letterboxing = 0/g" $HOME/Games/osu/game/osu\!.marco.cfg

# adjust display
swaymsg output DP-1 max_render_time 1
sleep 0.1
swaymsg output DP-2 max_render_time off
sleep 0.1
$HOME/.config/sway/vrr_on.sh
