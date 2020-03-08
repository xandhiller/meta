#! /bin/sh --

dir="/home/alex/Meta/scripts"
newScript="+ New Script"
dmenu="dmenu -i -l 50"
choice="$(ls $dir | $dmenu)"

if [ "X$choice" == "X" ]
  then
  return false
else
  file="$dir/$choice"
  gnome-terminal -e "nvim $file"
fi
