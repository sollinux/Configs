#!/bin/bash

while true; do
sh ~/.conky_scripts/weather.sh > ~/.conky_scripts/weather
python2 ~/.conky_scripts/gmail.py > ~/.conky_scripts/mail
sleep 180
python2 ~/.conky_scripts/gmail.py > ~/.conky_scripts/mail
sleep 180
python2 ~/.conky_scripts/gmail.py > ~/.conky_scripts/mail
sleep 180
done
