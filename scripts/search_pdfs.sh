#! /bin/sh --

# Check for arg.
if [ -z "$1" ]
  then
  echo "No argument given."
  return 1
fi

search_term=$1
for f in $(ls *.pdf); 
do 
    echo "-----------------------------"; 
    echo "$f"; 
    echo "-----------------------------"; 
    pdftotext "$f" - | grep -ni $search_term; 
done
