#! /bin/sh --

while getopts "s:c:" opt
do
    case "$opt" in
        s) screenshot=$OPTARG;;
        c) copy=$OPTARG;;
        *) exit 2;;
    esac
done

if [ $screenshot ]
then
    case "$screenshot" in
        selection) echo "Doing selection screenshot";;
        whole) echo "Doing whole screenshot";;
        *) exit 2;;
    esac
fi

if [ $copy ]
then
    case "$copy" in
        image) echo "Copying image";;
        path) echo "Copying path";;
        *) exit 2;;
    esac
fi
