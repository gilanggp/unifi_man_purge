#!/bin/bash

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/b‌​in


echo -n "Enter path: "
read DIR

cd $DIR

echo ""
#ls -l

# Check if the directory variable is set
if [ -z "$DIR" ]; then
  echo "The variable DIR is not set. Please set DIR to the target directory."
  exit 1
fi

# Check if the directory exists
if [ ! -d "$DIR" ]; then
  echo "The directory $DIR does not exist."
  exit 1
fi

# Find the three oldest files or directories inside $DIR
oldest=$(find "$DIR" -type f -printf '%T+ %p\n' -o -type d -printf '%T+ %p\n' | sort | head -n 3)

# Check if any file or directory was found
if [ -z "$oldest" ]; then
  echo "No files or directories found inside $DIR."
else
  echo "The three oldest files or directories inside $DIR are:"
  echo "$oldest" | awk '{print $2}'
fi
