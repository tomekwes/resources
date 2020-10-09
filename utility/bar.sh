
clock(){

    now="$(date +"%R %D")"
    echo " $now"
}

nord_vpn_status(){
    n_status="$(nordvpn status)"
    ret="0"
    
    if $(echo $n_status | grep -q "Connected" );
    then
        country="$(grep Country <<< $n_status)" #get line with country name
        name=${country#* } #cut up until white space

        case $name in
            "United States")
                name="US" ;;
            Poland)
                name="PL" ;;
            Ireland)
                name="IR" ;;
            "United Kingdom")
                name="GB" ;;
            Japan)
                name="JP" ;;
        esac
        ret=" $name"
        echo $ret
        return 0
    fi

    if $(echo $n_status | grep -q "Disconnected" );
    then
        echo " "
    fi
    return 1
}


sound(){

    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    echo "🔉 $VOL%"
}

echo $$ > /tmp/bar_pid

while true
do
    data=$(clock) #update clock

    nvs=$(nord_vpn_status) #update vpn
    data="$nvs | $data"

    vol=$(sound) #update volume info
    data="$vol | $data"

    xsetroot -name "$data"
    sleep 1m
done


