#! /bin/sh --

dir="/home/polluticorn/.scripts/"
newScript="+ New Script"
dmenu="dmenu -i -l 50"
choice="$(ls $dir | $dmenu)"

# notify-send "X$choice"

# if [ "$choice" == "$newScript" ]
#   then
#   file="$dir$name"
#   urxvt -e vim $file
# fi

if [ "X$choice" == "X" ]
  then
  return false
else
  file="$dir$choice"
#  notify-send "$file"
  urxvt -e vim $file
fi
