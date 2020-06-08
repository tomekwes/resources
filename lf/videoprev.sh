#!/bin/bash
Off='\033[0m'
Black='\033[0;30m'        
Red='\033[0;31m'          
Green='\033[0;32m'        
Yellow='\033[0;33m'       
Blue='\033[0;34m'         
Purple='\033[0;35m'       
Cyan='\033[0;36m'         
White='\033[0;37m'        
readarray -t data < <(mediainfo $1 | sed -n '3p;6p;7p;24,26p')
#printf '%s\n' "${data[2]}"
name=$(echo -e "${data[0]#*:}")
name=$(basename $name)
echo -e "Name:\t $Green${name}$Off"
echo -e "Size:\t$Red${data[1]#*:}$Off"
echo -e "Time:\t$Blue${data[2]#*:}$Off"
echo -e "Width:\t$Cyan${data[3]#*:}$Off"
echo -e "Height:\t$Cyan${data[4]#*:}$Off"
echo -e "Aspect:\t${data[5]#*:}"
