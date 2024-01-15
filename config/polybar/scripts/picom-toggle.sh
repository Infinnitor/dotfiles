#!/usr/bin/env bash
if [[ $(pidof picom) ]]; then
	pkill picom
else
	picom -b
fi
