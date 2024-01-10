#!/usr/bin/env bash
cp config/* ~/.config/ -r --verbose

cp vim/.vim ~/ -r --verbose
cp vim/.vimrc ~/ --verbose

cp bash ~/ -r --verbose
cat bash/activate

if [[ ! -f ~/.bashrc.bck ]]; then
	cp ~/.bashrc ~/.bashrc.bck
	cat bash/activate >> ~/.bashrc
fi
