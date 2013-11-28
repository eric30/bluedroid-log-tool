#!/bin/sh

line_count=`adb devices | wc -l`
download_folder=~/btlog
default_filename=btsnoop_hci.log

if [ "$line_count" -gt "2" ]; then
  echo "Device connected. Ready for retriving btsnoop log ..."

  # Check if local download folder exists
  if [ ! -d $download_folder ]; then
    echo "Download folder doesn't exist. Created."
    mkdir $download_folder
  fi

  # Ask user for log file name
  printf "Please enter file name:"
  read new_filename

  fullpath=$download_folder/${new_filename:=$default_filename}

  # Retrieve file from device
  adb pull /sdcard/$default_filename $fullpath

  echo "btsnoop log has been downloaded. Launching Wireshark ..."
  exec wireshark $fullpath

else
  echo "No device connected."
fi

