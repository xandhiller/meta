#Battery: $battery |! /bin/sh --
ARG=" $@"
date=`date +"%a, %Y-%m-%d, %H:%M"`
battery=`acpi | awk -e '{ print $4 }' | sed -e s/,//g`
STRING="$ARG | UK: `gettime "London" --small` | IRV: `gettime "US/Pacific" --small` | JHB: `gettime "Johannesburg" --small` | IND: `gettime "Kolkata" --small` | SYD: $date | BTRY: $battery "
xsetroot -name "$STRING"
