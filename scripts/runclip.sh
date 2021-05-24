#! /bin/sh --

CLIPBOARD_PROGRAM=/tmp/runclip_`date +%Y_%m_%d__%H_%M_%S`.sh

# If on my mac, use `pbpaste`
HOST=`hostname`
if [ $HOST = 'nebuchadnezzar' ]
then
    pbpaste > $CLIPBOARD_PROGRAM
else 
    getclip > $CLIPBOARD_PROGRAM
fi

chmod +x /tmp/runclip.sh
/tmp/runclip.sh
