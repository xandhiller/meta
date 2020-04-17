#! /bin/sh --

dir="~/Documents/aut20"
dir_string=$(echo $dir | sed -e 's/\//\\\//g')
file=$(find ~/Documents/aut20/ -name *.pdf | awk -e '{ print $1 }' | sed -e 's/"$dir_string"//g' | dmenu -l 50 -i)

if [ "X$file" == "X" ]
then
    exit
fi

zathura "$file"
