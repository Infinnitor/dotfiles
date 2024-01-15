#!/usr/bin/env bash
MUTE=$(pamixer --get-mute)

case $MUTE in
	(true) pamixer --unmute;;
	(false) pamixer --mute;;
esac
