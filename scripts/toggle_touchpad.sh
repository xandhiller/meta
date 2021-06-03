touchpad_id=$(xinput | grep "Touchpad" | awk -e '{ print $6 }' | sed -e 's/id=//g')
enabled=$(xinput list-props $touchpad_id | grep "Enabled" | awk -e '{ print $4 }' )

echo $enabled $touchpad_id

if [ $enabled = '1' ]
then
    xinput disable $touchpad_id 
    dwm_statusbar.sh "touchpad disabled"
else
    xinput enable $touchpad_id
    dwm_statusbar.sh "touchpad enabled"
fi


# ⎜   ↳ DELL0A20:00 0488:101A Touchpad            id=13   [slave  pointer  (2)]
