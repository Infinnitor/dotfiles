#!/usr/bin/env sh
FONT_DL_DIR="/tmp/JetBrainsMono"
START_DIR=$PWD
FONT_DL_ZIP="JetBrainsMono.zip"
INSTALL_DIR="$HOME/.local/share/fonts/"

mkdir -p $FONT_DL_DIR --verbose
mkdir -p $INSTALL_DIR --verbose
cd $FONT_DL_DIR
echo "--------- DOWNLOADING ---------"
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip" -O $FONT_DL_ZIP

echo "--------- UNZIPPING ---------"
unzip $FONT_DL_ZIP

echo "--------- INSTALLING ---------"
mv *.ttf $INSTALL_DIR
fc-cache --force --verbose

cd $START_DIR
rm -r $FONT_DL_DIR
