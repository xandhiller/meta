while true
	do
    #compton &   # for alpha effect on terminals
    feh --bg-fill ~/Pictures/self_portrait_mc_escher.png  # for background image
    dwm_statusbar.sh
	/usr/local/bin/dwm 2> /dev/null  # run dwm
done
