#!/bin/sh

# reset display if on sway session, else exit
[ -z $SWAYSOCK ] || [ -z $(echo $XDG_SESSION_TYPE | grep wayland) ] && exit 1
swaymsg $(cat $HOME/.config/sway/config | grep "output DP-1 max_render_time")
sleep 0.1
swaymsg $(cat $HOME/.config/sway/config | grep "output DP-2 max_render_time")
sleep 0.1
swaymsg $(cat $HOME/.config/sway/config | grep "output DP-1 mode 2560x1440@")
sleep 0.1
swaymsg $(cat $HOME/.config/sway/config | grep "output DP-2 mode 3440x1440@")
sleep 0.1
cat $HOME/.config/sway/config | grep "output DP-1 adaptive_sync on" || $HOME/.config/sway/vrr_off.sh
