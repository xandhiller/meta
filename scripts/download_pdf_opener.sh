#! /bin/sh --

dir="~/Documents/teaching"
dir_string=$(echo $dir | sed -e 's/\//\\\//g')
file=$(find ~/Downloads/ -name *.pdf | sed -e 's/"$dir_string"//g' | sort | dmenu -l 50 -i)

if [ "X$file" != "X" ]
then
    zathura "$file"
fi

