bluedroid-log-tool
==================

Prerequisite

* Wireshark - a protocol viewer which can be installed from Ubuntu Software Center.
* btsnoop log has been enabled on your target device
  * Can be checked via command "adb shell cat /system/etc/bluetooth/bt_stack.conf | grep BtSnoopLogOutput"

My Environment

* Ubuntu 13.04
* Nexus 4 (with Firefox OS 1.3)

Scripts

* togglelog.sh
  * You could easily enable/disable btsnoop log on the target device by executing this script.

* openlog.sh
  * Help you pull btsnoop log from target device and launch pre-installed Wireshark to view the file

