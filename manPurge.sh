#!/bin/bash

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/b‌​in


echo -n "Enter path: "
read DIR

cd $DIR

echo ""
#ls -l

# Cek variabel directory tidak kosong
if [ -z "$DIR" ]; then
  echo "directory kosong, tolong masukan directory."
  exit 1
fi

# Cek directory ada
if [ ! -d "$DIR" ]; then
  echo "directory $DIR tidak ada."
  exit 1
fi

# cari directory ter lama
oldest=$(find "$DIR" -mindepth 3 -maxdepth 3 -type d -printf '%T+ %p\n' | sort -T /srv/tmp | head -n 3)

# Cek file atau directory ada
if [ -z "$oldest" ]; then
  echo "No files or directories found inside $DIR."
else
  echo "The three oldest files or directories inside $DIR are:"
  echo "$oldest" 
fi

#prompt penghapusan
  echo ""
  echo -n "deleting oldest file ? Y\n "
  read OP

  if [ -z "$OP" ]; then
    echo "command tidak ada...!"
    exit 1
  elif [ "$OP" = "Y" ]; then
    echo "$oldest" | awk '{print $2}' | xargs rm -rv
    echo "deleted...!"
  else
    echo "exiting..."
	exit 1
  fi

echo ""

done