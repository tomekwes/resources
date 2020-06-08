#!/bin/sh


case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    *.mkv | *.avi | *.mp4) /home/tomek/.config/lf/videoprev.sh "$1" ;;
    *rc) highlight --syntax vimscript -l -O ansi "$1" ;;
    #*) bat  --decorations always --color always "$1";;
    *) highlight -l -O ansi "$1" ;;
esac
