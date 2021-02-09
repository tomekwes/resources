#!/bin/bash


get_volume(){
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    echo $VOL
}


mod_volume(){
    if [ "$1" = "up" ]; then
        VOL=$(get_volume)

        if [ $VOL = "100" ]; then
            return 1
        fi

        VOL="$((VOL+5))%"
        amixer sset 'Master' $VOL &>/dev/null
        return 0

    fi

    if [ "$1" = "down" ]; then
        VOL=$(get_volume)
        if [ $VOL = "0" ]; then
            return 1
        fi
        VOL="$((VOL-5))%"
        amixer sset 'Master' $VOL &>/dev/null
        return 0

    fi

    return 2
}

mute_volume(){

    amixer -D pulse set Master 1+ toggle &>/dev/null
    return $?

}

arg=$(echo $1 | tr '[:upper:]' '[:lower:]')

if [ $arg = "get" ]; then
    echo $(get_volume)
    exit 0
fi

if [ $arg = "mute" ]; then
    $(mute_volume)
elif ! $(mod_volume $arg) ; then
    exit $?
fi


#update dwm status bar
kill -9 $(cat /tmp/bar_pid)
bar &

