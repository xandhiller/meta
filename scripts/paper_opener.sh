#! /bin/bash

dir="~/Papers/"

# List the contents of the Textbooks folder but ignore the archive folder.
choice="$(ls ~/Papers | dmenu -i -l 80)"

# As long as the choice is not NULL then open the textbook.
if [ "X$choice" != "X" ]
then
  i3-msg exec zathura $dir$choice
fi
