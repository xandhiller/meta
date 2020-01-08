#! /bin/sh --

todo_dir=$HOME/todo
filename=$(date +%F | sed -e 's/-/_/g').md
fullpath=$todo_dir/$filename

# if the file doesn't exist echo in the date and title and beginning of a todo list
if [ -s "$fullpath" ]
then
    nvim $fullpath
else
    echo -n "# " >> $fullpath
    echo $(date +%F) >> $fullpath
    echo >> $fullpath
    echo "┌───────┐\n│ TO-DO │\n└───────┘\n\n* <++>" >> $fullpath
    nvim $fullpath
fi

