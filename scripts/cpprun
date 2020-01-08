#! /bin/sh --

# Only run the script if there's an argument
if [ -z "$1" ]
then
  echo "No argument given."
  return 1
fi

# Create commonly used values in this script
fullName=$1
baseName="bin/$(echo $fullName | sed s/.cpp//)"
errorFile="$baseName.cpperror"

# Check if CMakeLists.txt present in the pwd.
CMAKE=`ls | grep "CMakeLists.txt"`

# Compile with g++
if [ "X"$CMAKE = "X" ]
then
    mkdir -p bin
    echo "[No 'CMakeLists.txt' file detected. Compiling with g++.]\n\n"
    # Remove the previous error file.
    touch $(pwd)/$errorFile
    rm $(pwd)/$errorFile

    # Compile statement.
    g++ -std=c++11 -o $baseName $fullName 2> $errorFile

    if [ "$2" = "-build" ]
    then 
        echo "\nBuilding only..."
    fi

    # If it compiled, run it.
    if [ -s $errorFile ] # Tests if file exists and not empty. If true = no compile.
    then
      printf "\n\n" >> $(pwd)/$errorFile # Formatting
      date >> $(pwd)/$errorFile # Date/time of compiling for context
      echo "Warnings present or didn't compile.\n\n"
      cat $(pwd)/$errorFile
      return 1
    else
      # if build argument given, then just build.
      if [ "$2" = "-build" ]
      then 
          echo "\nBuilt successfully."
          return 0
      fi
      $(pwd)/$baseName # Run the file if no errors or warnings.
    fi
fi

# Compile with cmake
if [ "X"$CMAKE = "XCMakeLists.txt" ]
then
    rm -rf build
    mkdir -p build
    cd build
    echo "'[CMakeLists.txt' file detected. Compiling with cmake.]\n\n"
    cmake ..
    # If any errors, cmake will display.
    # TODO: If cmake errors, bail out.
    make
    # If any errors, make will display.
    executable=`grep "add_executable(" ../CMakeLists.txt | sed -e 's/add_executable(//g' | awk -e '{ print $1 }'`

    # Only run executable if it is present in the directory i.e. it compiled.
    if [ "X"`ls | grep $executable` = "X"$executable ]
    then
        # If build only, finish up.
        if [ "$2" = "-build" ]
        then 
          echo "\nBuilt successfully."
          return 0
        fi
        echo "\n\n [Running executable...]\n\n"
        ./$executable
    fi
fi

