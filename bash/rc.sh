export PATH="$PATH:/home/computer/.local/bin/"
export TERMINAL=alacritty
export EDITOR="vim"

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

PS1="\[\033[01;31m\]\w \$ \[\033[00m\]"
tabs -4
(cat ~/.cache/wal/sequences &)
