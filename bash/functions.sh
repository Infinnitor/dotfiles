wal-background() {
	wal -n -i "$@"
	gsettings set org.gnome.desktop.background picture-uri-dark "file://$(< "${HOME}/.cache/wal/wal")"
}


wal-url() {
	wal -c
	wget $1 -O /tmp/wallpaper -q
	wal -n -i /tmp/wallpaper
	gsettings set org.gnome.desktop.background picture-uri-dark "file://$(< "${HOME}/.cache/wal/wal")"
}


gnome-wallpaper() {
	gsettings set org.gnome.desktop.background picture-uri-dark "file://$(realpath $1)"
}

print-colours() {
	for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo ""
}


wget-image() {
	wget -q -O "$@"
}
