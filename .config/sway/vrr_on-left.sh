#!/bin/sh

# exit if not running on sway session
test -z $SWAYSOCK && exit 1

# check if adaptive sync is disabled on any output
status="$(swaymsg -t get_outputs | grep "\"adaptive_sync_status\": \"enabled\"," | wc -l)"

# enable adaptive sync for DP-1
while [ "$status" != "2" ]
do 
	echo $status
	swaymsg output DP-1 adaptive_sync on && sleep 0.01
	swaymsg output DP-2 adaptive_sync on && sleep 0.01
	status="$(swaymsg -t get_outputs | grep "\"adaptive_sync_status\": \"enabled\"," | wc -l)"
done
