#!/bin/sh

line_count=`adb devices | wc -l`
log_enabled=`adb shell cat /system/etc/bluetooth/bt_stack.conf | grep BtSnoopLogOutput | grep true`

if [ "$line_count" -gt "2" ]; then
  adb remount
  adb pull /system/etc/bluetooth/bt_stack.conf

  if [ "$log_enabled" ]; then
    sed -i 's/BtSnoopLogOutput=true/BtSnoopLogOutput=false/g' bt_stack.conf
    log_enabled=0
  else
    sed -i 's/BtSnoopLogOutput=false/BtSnoopLogOutput=true/g' bt_stack.conf
    log_enabled=1;
  fi

  adb push bt_stack.conf /system/etc/bluetooth

  if [ "$log_enabled" -eq "1" ]; then
    echo "The log has been ENABLED."
  else
    echo "The log has been DISABLED."
  fi

  rm bt_stack.conf
else
  echo "No device connected."
fi
