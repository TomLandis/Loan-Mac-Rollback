# Loan-Mac-Rollback

## Overview
This shell script makes the management of loaner Macs easy by automating the reset process between rentals.

## Create new image
To create a new image.  Follow these steps:

1. Boot into usb installer of Catalina or later OS.  Option key during boot with bootable USB inserted.
2. Open Diskutility
3. view > show all devices
4. Unmount internal Disk (the container)
5. right click the disk you just unmounted
6. select 'Image from Container disk 1' -it might be named something else...
7. Save the image as a read only, unencrpted MonthYear.dmg
8. Add it to the same external HDD the other images are on and add it to the shell script in this repo (carefully)


