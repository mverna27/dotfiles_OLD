#!/bin/sh

# only execute if running on sway session
if [ ! -z $SWAYSOCK ] && [ ! -z $(echo $XDG_SESSION_TYPE | grep wayland) ]
then
	swaymsg output DP-1 max_render_time 1
	sleep 0.1
	swaymsg output DP-2 max_render_time off
	sleep 0.1
	$HOME/.config/sway/vrr_on.sh
else
	echo $XDG_CURRENT_DESKTOP | grep KDE && qdbus org.kde.KWin /Compositor suspend
	$HOME/arch/scripts/display/100-144.sh
fi

# set mouse DPI
ratbagctl "Logitech G Pro Gaming Mouse" dpi set 8000

# check if vsyscall32 is enabled and if yes, disable it (NO LONGER NEEDED SINCE LUTRIS-GE-LOL-7.0-3)
#test $(cat /proc/sys/abi/vsyscall32 | grep 1) && sudo sysctl -w abi.vsyscall32=0
