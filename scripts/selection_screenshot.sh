#! /bin/sh --
TMP_SAVE="/tmp/screen_grab.png"
sh -c "sleep 0.2 && scrot $TMP_SAVE -s "

# Properties
width=$(file $TMP_SAVE | awk -e '{ print $5 }')
height=$(file $TMP_SAVE | awk -e '{ print $7 }' | sed -e 's/,//g')
TYPE=$(file -b --mime-type $TMP_SAVE) 

name=$(date +%Y_%m_%d__%H_%M_%S__$width\_x_$height\_screen_grab.png)
mv $TMP_SAVE ~/Pictures/screen_grabs/$name
xclip -selection clipboard -t "$TYPE" -i ~/Pictures/screen_grabs/$name

