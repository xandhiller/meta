#! /bin/sh --

# full screen or selection
TMP_SAVE="$HOME/tmp/screen_grab.png"
rm -f $TMP_SAVE
echo $TMP_SAVE
import -window root "$TMP_SAVE"

# Properties
width=$(file $TMP_SAVE | awk -e '{ print $5 }')
height=$(file $TMP_SAVE | awk -e '{ print $7 }' | sed -e 's/,//g')

name=$(date +%Y_%m_%d__%H_%M_%S__$width\_x_$height\_screen_grab.png)
echo $name
FILE_PATH="$HOME/Pictures/screen_grabs/$(echo $name)"
mv $TMP_SAVE $FILE_PATH
TYPE=$(file -b --mime-type $FILE_PATH) 
xclip -selection clipboard -t "$TYPE" -i "$FILE_PATH"
