#!/bin/bash
clock(){

    now="$(date +"%R %d/%m/%y")"
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

    # get sound volume value
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    # get [on] or [off] 
    mute=$(amixer get Master | tail -n1 | grep -Po "\[[a-z]{2,3}\]")
    sign=""
    if [ "$mute" = "[on]" ];
    then
        sign="🔉"
    fi

    
    if [ "$mute" = "[off]" ];
    then
        sign=""
    fi
    echo "$sign $VOL%"
    return 0
}

internet(){

    packet=$(ping 8.8.8.8 -c 1 -W 1) # ping only once (-c) and timeout after 1 sec (-W)

    if $(grep -iq "1 received" <<< $packet);
    then
        echo ""
        return 0
    else
        echo ""
        return 0
    fi

}


echo $$ > /tmp/bar_pid

while true
do
    data=$(clock) #update clock

    nvs=$(nord_vpn_status) #update vpn
    data="$nvs | $data"

    vol=$(sound) #update volume info
    data="$vol | $data"

    net=$(internet)
    data="$net | $data"

    echo $data
    xsetroot -name "| $data"
    sleep 1m
done


