#!/bin/bash

wallpaperDir="/home/tomek/Pictures/wallpapers/"

pick_random_wallpaper() {

    echo $(ls $wallpaperDir | shuf | head -n 1)

}

feh "$wallpaperDir/$(pick_random_wallpaper)" --bg-fill
bar &
#compton -b
#nordvpn connect Ireland
dwm
