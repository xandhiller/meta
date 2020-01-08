#! /bin/sh --

mouse_id=$(xinput --list | grep -e "Logitech MX Anywhere 2S" | awk -e '{ print $7 }' | sed -e 's/id=//g')

constant_decel=$(xinput list-props $mouse_id | grep -e 'Device Accel Constant Deceleration' | awk -e '{ print $5 }' | sed -e 's/(//g' | sed -e 's/)://g')


adaptive_decel=$(xinput list-props $mouse_id | grep -e 'Device Accel Adaptive Deceleration' | awk -e '{ print $5 }' | sed -e 's/(//g' | sed -e 's/)://g')


xinput set-prop $mouse_id $constant_decel 0.5
xinput set-prop $mouse_id $adaptive_decel 1
