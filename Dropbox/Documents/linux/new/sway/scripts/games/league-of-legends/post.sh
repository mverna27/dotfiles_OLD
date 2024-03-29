#!/bin/bash

# only execute if running on sway session
if [ ! -z $SWAYSOCK ] && [ ! -z $(echo $XDG_SESSION_TYPE | grep wayland) ]
then
	$HOME/.config/sway/displayreset.sh
else
	echo $XDG_CURRENT_DESKTOP | grep KDE && qdbus org.kde.KWin /Compositor resume
	$HOME/arch/scripts/display/100-144-tearfree.sh
fi

# reset mouse DPI
ratbagctl "Logitech G Pro Gaming Mouse" dpi set 6000

# check if vsyscall32 is disabled and if yes, enable it (NO LONGER NEEDED SINCE LUTRIS-GE-LOL-7.0-3)
#test $(cat /proc/sys/abi/vsyscall32 | grep 0) && sudo sysctl -w abi.vsyscall32=1
