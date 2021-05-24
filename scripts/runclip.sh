#! /bin/sh --

CLIPBOARD_PROGRAM=/tmp/runclip_`date +%Y_%m_%d__%H_%M_%S`.sh

# If on my mac, use `pbpaste`
HOST=`hostname`
if [ $HOST = 'nebuchadnezzar' ]
then
    pbpaste > $CLIPBOARD_PROGRAM
else 
    xclip -selection c -o > $CLIPBOARD_PROGRAM
fi

chmod +x $CLIPBOARD_PROGRAM
$CLIPBOARD_PROGRAM
