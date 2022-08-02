#!/bin/sh

# exit if not running on sway session
test -z $SWAYSOCK && exit 1

# check if adaptive sync is enabled on any output
status="$(swaymsg -t get_outputs | grep "\"adaptive_sync_status\": \"enabled\",")"

# enable adaptive sync for DP-2
while [ ! -z "$status" ]
do 
	swaymsg output DP-1 adaptive_sync off && sleep 0.01
	swaymsg output DP-2 adaptive_sync off && sleep 0.01
	status="$(swaymsg -t get_outputs | grep "\"adaptive_sync_status\": \"enabled\",")"
done
