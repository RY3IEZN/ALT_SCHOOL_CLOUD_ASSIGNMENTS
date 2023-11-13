#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
  echo "Usage: $0 <directory_path> [<directory_path>]... [a|d]"
  exit 1
fi

# Determine if sorting option is provided
sorting_option="${!#}" # Get the last argument

# Check if the last argument is "a" or "d" for sorting
if [ "$sorting_option" == "a" ] || [ "$sorting_option" == "d" ]; then
  # Remove the last argument from the list
  set -- "${@:1:($#-1)}"
else
  # Default to no sorting if the last argument is not "a" or "d"
  sorting_option=""
fi

# Iterate through the provided directory paths and list their contents
for dir_path in "$@"; do
  if [ -d "$dir_path" ]; then
    echo "Contents of $dir_path:"
    if [ "$sorting_option" == "a" ]; then
      # List in ascending order
      ls -1 "$dir_path" | sort
    elif [ "$sorting_option" == "d" ]; then
      # List in descending order
      ls -1 -r "$dir_path" | sort -r
    else
      # Default listing without sorting
      ls -1 "$dir_path"
    fi
  else
    echo "Error: $dir_path is not a directory."
  fi
done
