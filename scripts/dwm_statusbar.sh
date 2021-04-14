#! /bin/sh --
date=`date +"%Y-%m-%d, %H:%M"`
battery=`acpi | awk -e '{ print $4 }' | sed -e s/,//g`
STRING=" $battery | $date "
xsetroot -name "$STRING"
