#! /bin/sh --
ARG=" $@"
date=`date +"%Y-%m-%d, %H:%M"`
battery=`acpi | awk -e '{ print $4 }' | sed -e s/,//g`
STRING="$ARG | $battery | $date "
xsetroot -name "$STRING"
