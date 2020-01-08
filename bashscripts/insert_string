#! /bin/sh --

# Insert $1 on line $2 in file $3
if [ -z $3 ]
then
    echo "insert_string: Not enough arguments. Supposed to be:\n\n" \
    "\tinsert_string [str] [ln_nb] [file]"
    return 1
fi
str=$1
nb=$2
file=$3
sed -i "$nb"'i '"$str" $file

