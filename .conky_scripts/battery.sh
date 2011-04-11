#!/bin/bash

level=8

info=`acpitool -b | awk '{print $4,$5,$6}'`
charge=`echo $info | cut -d. -f1 | cut -d, -f2`

if [ $charge -lt $level ]; then
	aplay ~/.conky_scripts/beep.wav
fi

echo $info
