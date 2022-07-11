#!/bin/sh

# stop opentabletdriver.service
systemctl --user stop opentabletdriver.service

# resume KWIN compositor
echo $XDG_CURRENT_DESKTOP | grep KDE && qdbus org.kde.KWin /Compositor resume

# set x display and exit if not running on sway session
[ -z $SWAYSOCK ] || [ -z $(echo $XDG_SESSION_TYPE | grep wayland) ] && $HOME/arch/scripts/display/100-144-tearfree.sh && exit 1

# enable fullscreen and raw input
sed -i "s/^Fullscreen = 0/Fullscreen = 1/g" /mnt/games/osu/game/osu\!.marco.cfg
sed -i "s/^RawInput = 0/RawInput = 1/g" /mnt/games/osu/game/osu\!.marco.cfg
sed -i "s/^Letterboxing = 0/Letterboxing = 1/g" /mnt/games/osu/game/osu\!.marco.cfg

# adjust display
$HOME/.config/sway/displayreset.sh
