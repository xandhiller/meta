#! /bin/sh --

sh -c "sleep 0.2 && scrot ~/screen_grab.png -s "

# Properties
width=$(file ~/screen_grab.png | awk -e '{ print $5 }')
height=$(file ~/screen_grab.png | awk -e '{ print $7 }' | sed -e 's/,//g')
TYPE=$(file -b --mime-type ~/screen_grab.png) 

name=$(date +%Y_%m_%d__%H_%M_%S__$width\_x_$height\_screen_grab.png)
mv ~/screen_grab.png ~/Pictures/screen_grabs/$name
xclip -selection clipboard -t "$TYPE" -i ~/Pictures/screen_grabs/$name

