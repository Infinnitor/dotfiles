#!/usr/bin/env bash
SWITCH_PATH="/home/computer/.cache/.polybar_toggle_on"
POLYBAR_LAUNCH="/home/computer/.config/polybar/split/launch.sh"

if [[ ! -f $SWITCH_PATH ]]; then
	touch $SWITCH_PATH
	i3-msg "gaps outer all set 5px;"
	i3-msg "gaps inner all set 5px;"
	i3-msg "gaps top all set 50px;"
	$POLYBAR_LAUNCH
	exit
else
	rm $SWITCH_PATH
	i3-msg "gaps outer all set 0px;"
	i3-msg "gaps inner all set 5px;"
	i3-msg "gaps top all set 0px;"
	sleep 0.15
	killall polybar
fi
