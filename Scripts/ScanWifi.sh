#!/usr/bin/env bash

while true
do
    clea
    echo "Scanning networks . . ."
    nmcli dev wifi list
    sleep 1
done
