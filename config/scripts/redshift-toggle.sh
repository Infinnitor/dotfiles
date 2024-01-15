#!/usr/bin/env bash
SWITCH_PATH="/home/computer/.cache/.redshift_toggle_on"

if [[ -f $SWITCH_PATH ]]; then
	rm $SWITCH_PATH
	redshift -P -O 2500K
else
	touch $SWITCH_PATH
	redshift -x
fi
