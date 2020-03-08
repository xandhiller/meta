#! /bin/sh --

############################################################
# Only run the script if there's an argument
if [ -z "$1" ]
  then
  echo "No argument given."
  return 1
fi
############################################################
# Make directory if non-existent else no error warning.
mkdir -p bin

fullName="$1"
baseName="$(echo $fullName | sed -e 's/\.c//g')"
errorFile="$baseName.cerror"

############################################################
# Remove the previous error file.
touch "$(pwd)/bin/$errorFile"
rm "$(pwd)/bin/$errorFile"
touch "$(pwd)/bin/$baseName"
rm "$(pwd)/bin/$baseName"
############################################################

# Compile statement.
gcc -Wall -o "./bin/$baseName" $fullName -lm | grep --color=always . > "./bin/$errorFile"

############################################################
# If it compiled, run it.
if [ -s "./bin/$errorFile" ] # Tests if file exists and not empty. If true = no compile.
then
    printf "\n\n" >> $(pwd)/bin/$errorFile # Formatting
    date >> $(pwd)/$errorFile # Date/time of compiling for context
    echo "Warnings present or didn't compile.\n\n"
    highlight $(pwd)/bin/$errorFile
    return 1
elif [ -s "./bin/$baseName" ]
then
    rm "$(pwd)/bin/$errorFile" # Delete the error file, it's empty.
    $(pwd)/bin/$baseName # Run the file if no errors or warnings.
fi
