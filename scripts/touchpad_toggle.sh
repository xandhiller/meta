#! /bin/sh --

touchpad_id=$(xinput --list | grep -e "Touchpad" | awk -e '{ print $8 }' | sed -e 's/id=//g')
# Check if enabled
enabled=$(xinput list-props $touchpad_id | grep -e "Enabled" | awk -e '{ print $4 }')

if [ $enabled = 1 ]
then
    xinput disable $touchpad_id
else
    xinput enable $touchpad_id
fi


