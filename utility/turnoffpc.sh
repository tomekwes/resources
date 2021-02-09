#!/bin/bash

answ=$(echo -e "no\nyes" | dmenu)
if [[ $answ = yes ]]; then
    $(shutdown)
fi
