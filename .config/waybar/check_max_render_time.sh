#!/bin/sh

# save current max_render_time status in string
#status="$(swaymsg -t get_outputs | grep 'render\|DP' | tac | tr '\n' ' ' | tr '\"' ' ' | tr ',' ' ' | sed 's/      name//g' | sed 's/time\ /time/g' | sed 's/  :  /\ \(/g' | sed 's/  /\)/g' | sed 's/)) //g' | sed 's/))))/) /g' | sed 's/.$//' | sed 's/ max/  max/g' | sed 's/max_render_time: //g' | sed 's/ (/ms (/g')"
status="$(swaymsg -t get_outputs | grep "render" | grep -o [0-9] | tac | tr '\n' ' ' | sed 's/ /ms /g' | sed 's/.$//')"

# show max_render_time status only if it's different from default
#if [ "$status" != "2ms (DP-2)  1ms (DP-1)" ] ; then
#	echo $status
#fi

echo $status
