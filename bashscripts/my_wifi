#! /bin/sh --

connections=$(nmcli c show --active)

# echo $connections
echo "[" $(echo $connections | grep -e "UTS-WPA" | awk -e '{ print $5 }') "]  "

