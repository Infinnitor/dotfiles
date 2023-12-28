#!/usr/bin/env python3
import sys, os
import parsers
from apps import AppPath, Palette


def main(args):
	palette = Palette(
		background = '#0a0a0f',
		background_alt = '#1a1b36',
		foreground = '#a9b1d6',
		foreground_alt = '#a9b1d6',
		tint = '#f7768e',
		tint_alt = '#452535',
		black = '#32344a',
		red = '#f7768e',
		green = '#9ece6a',
		yellow = '#e0af68',
		blue = '#7aa2f7',
		magenta = '#ad8ee6',
		cyan = '#449dab',
		white = '#787c99',
	)
	palette = Palette(
		background = '#0a0a0f',
		background_alt = '#1a1f46',
		foreground = '#a9b1d6',
		foreground_alt = '#a9b1d6',
		tint = '#ad8ee6',
		tint_alt = '#af93ec',
		black = '#6C5BB3',
		red = '#7462BA',
		green = '#826DC5',
		yellow = '#917AD3',
		blue = '#9F85DE',
		magenta = '#AF93EC',
		cyan = '#ad8ee6',
		white = '#787c99',
	)

	alacritty = AppPath(
		name="alacritty",
		config_path=os.path.expanduser("~/.config/alacritty/alacritty.yml"),
		parser=parsers.alacritty,
		# output_path="./alacritty.yml"
	)

	i3wm = AppPath(
		name="i3",
		config_path=os.path.expanduser("~/.config/i3/config"),
		parser=parsers.i3wm,
		# output_path="./i3"
	)

	dunst = AppPath(
		name="dunst",
		config_path=os.path.expanduser("~/.config/dunst/dunstrc"),
		parser=parsers.dunst,
		# output_path="./dunst"
	)

	polybar = AppPath(
		name="polybar",
		config_path=os.path.expanduser("~/.config/polybar/config.ini"),
		parser=parsers.polybar,
		# output_path="./polybar.ini"
	)

	rofi = AppPath(
		name="rofi",
		config_path=os.path.expanduser("~/.config/rofi/theme.rasi"),
		parser=parsers.rofi,
		# output_path="./rofi.css"
	)

	alacritty.run(palette)
	i3wm.run(palette)
	polybar.run(palette)
	rofi.run(palette)
	dunst.run(palette)


if __name__ == "__main__":
	main(sys.argv)
