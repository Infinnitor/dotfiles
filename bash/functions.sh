wal-url() {
	wal -c
	wget $1 -O /tmp/wallpaper -q
	wal -i /tmp/wallpaper ${@:2}
}

wal-backend() {
	wal -i $1 --backend $2
}

print-colours() {
	for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo ""
}

wget-image() {
	wget -q -O "$@"
}
