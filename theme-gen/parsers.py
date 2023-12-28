def alacritty(text, palette):
	def match_colour(cname):
		match cname.strip():
			case "background":
				return palette.background
			case "foreground":
				return palette.foreground
			case "black":
				return palette.black
			case "red":
				return palette.red
			case "green":
				return palette.green
			case "yellow":
				return palette.yellow
			case "blue":
				return palette.blue
			case "magenta":
				return palette.magenta
			case "cyan":
				return palette.cyan
			case "white":
				return palette.white
		raise ValueError(f"Colour name {cname} does not exist in palette")

	lines = text.split("\n")
	output_lines = []
	region = False
	for line in lines:
		res = line

		if line.startswith("    background"):
			region = True

		if line.startswith("window:"):
			region = False

		if region and len(line.rstrip().split(":")) == 2:
			name, value = line.split(":")

			if value.strip():
				res = name + ": '" + match_colour(name) + "'"

		output_lines.append(res)

	return "\n".join(output_lines)



def i3wm(text, palette):
	lines = text.split("\n")
	output_lines = []
	for line in lines:
		res = line

		if line.startswith("set $bgcolour"):
			res = "set $bgcolour " + palette.background_alt

		if line.startswith("set $borderactivecolour"):
			res = "set $borderactivecolour " + palette.tint

		if line.startswith("set $textcolour"):
			res = "set $textcolour " + palette.foreground

		output_lines.append(res)

	return "\n".join(output_lines)


def dunst(text, palette):
	lines = text.split("\n")
	output_lines = []
	for line in lines:
		res = line

		if line.startswith("background ="):
			res = "background = " + palette.tint

		if line.startswith("foreground ="):
			res = "foreground = " + palette.background

		if line.startswith("frame_color ="):
			res = "frame_color = " + palette.tint

		output_lines.append(res)

	return "\n".join(output_lines)


def polybar(text, palette):
	def match_colour(cname):
		match cname.strip():
			case "background": return palette.background
			case "background-alt": return palette.background_alt
			case "foreground": return palette.tint
			case "foreground-alt": return palette.tint_alt
		raise ValueError(f"Colour name {cname} does not exist in palette")

	lines = text.split("\n")
	output_lines = []
	region = False
	g = 0
	for line in lines:
		res = line

		if line.startswith("[colors]"):
			region = True

		elif line.startswith("["):
			region = False

		if region and line.rstrip() and len(line.split("=")) == 2:
			name, value = line.split("=")

			if name.startswith("gradient"):
				colour = palette.tint
				g += 1
			else:
				colour = match_colour(name)

			res = name.strip() + " = " + colour

		output_lines.append(res)

	return "\n".join(output_lines)


def rofi(text, palette):
	def match_colour(cname):
		match cname.strip():
			case "selected-normal-foreground": return palette.tint
			case "foreground": return palette.tint
			case "alternate-normal-background": return palette.background
			case "red": return palette.red
			case "selected-urgent-foreground": return palette.red
			case "blue": return palette.blue
			case "urgent-foreground": return palette.red
			case "alternate-urgent-background": return palette.red
			case "active-foreground": return palette.red
			case "lightbg": return palette.white
			case "selected-active-foreground": return palette.tint_alt
			case "bordercolor": return palette.tint
			case "lightfg": return palette.white
			case "selected-normal-background": return palette.background_alt
			case "border-color": return palette.tint_alt
			case "separatorcolor": return palette.tint_alt
			case "urgent-background": return palette.black
			case "selected-urgent-background": return palette.black
			case "background-color": return palette.background
			case "active-background": return palette.background_alt
			case "selected-active-background": return palette.background_alt
		return None

	lines = text.split("\n")
	output_lines = []
	region = False
	for line in lines:
		res = line

		if line.startswith("* {"):
			region = True

		elif line.startswith("}"):
			region = False

		if region and line.rstrip() and len(line.split(":")) == 2:
			name, value = line.split(":")
			colour = match_colour(name)
			if colour is not None:
				res = name + ": " + colour + ";"

		output_lines.append(res)

	return "\n".join(output_lines)
