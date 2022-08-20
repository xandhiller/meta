#! /bin/zsh 
#
TMP_SAVE="$HOME/tmp/screen_grab.png"
mkdir -p $HOME/tmp
rm -f $TMP_SAVE

####################
# Functions
####################
usage() {
    echo "USAGE: screenshot.sh"
    echo "-s\tselection or whole"
    echo "-c\timage or path"
}

whole_screenshot() {
    import -window root "$TMP_SAVE"
    # Properties
    width=$(file $TMP_SAVE | awk -e '{ print $5 }')
    height=$(file $TMP_SAVE | awk -e '{ print $7 }' | sed -e 's/,//g')
    # Custom, identifiable name
    name=$(date +%Y_%m_%d__%H_%M_%S__$width\_x_$height\_screen_grab.png)
    FILE_PATH="$HOME/Pictures/screen_grabs/$(echo $name)"
    mv $TMP_SAVE $FILE_PATH
}


selection_screenshot() {
    sh -c "sleep 0.2 && scrot $TMP_SAVE -s "
    # Properties
    width=$(file $TMP_SAVE | awk -e '{ print $5 }')
    height=$(file $TMP_SAVE | awk -e '{ print $7 }' | sed -e 's/,//g')
    # Custom, identifiable name
    name=$(date +%Y_%m_%d__%H_%M_%S__$width\_x_$height\_screen_grab.png)
    echo $name
    FILE_PATH="$HOME/Pictures/screen_grabs/$(echo $name)"
    mv $TMP_SAVE $FILE_PATH
}


copy_link() {
    echo $FILE_PATH | xclip -selection clipboard 

}


copy_image() {
    TYPE=$(file -b --mime-type $FILE_PATH) 
    xclip -selection clipboard -t "$TYPE" -i "$FILE_PATH"
}
####################


# Get args from switches
while getopts "s:c:" opt
do
    case "$opt" in
        s) screenshot=$OPTARG;;
        c) copy=$OPTARG;;
        *) 
            usage
            exit 2;;
    esac
done


# Handle the screenshot args.
if [ $screenshot ]
then
    case "$screenshot" in
        selection) 
            selection_screenshot;;
        whole) 
            whole_screenshot;;
        *) 
            exit 2;;
    esac
fi


# Handle the copy args.
if [ $copy ]
then
    case "$copy" in
        image) 
            copy_image;;
        link) 
            copy_link;;
        *) 
            exit 2;;
    esac
fi
