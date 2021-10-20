#!/bin/sh
# ASR Image Bash Script 
# Tom Landis 
#V3 updated Oct 19, 2021
# 
diskutil unmount /dev/disk1
sleep 3
echo "Welcome to Rollback Loan Mac!  Which OS would you like to rollback to?"
PS4="Please select an OS to roll back to: "
osver=("Catalina" "BigSur") 
select fav in "${osver[@]}"; do
case $fav in 
"Catalina")
#echo "chose Catalina"
thepath=$( hdiutil attach /Volumes/Loan\ Images/Dec2020.dmg -noverify -nomount | sed -n '2 p' | awk '{print$1}' )
break
;;
"BigSur")
#echo "chose bigSur"
thepath=$( hdiutil attach /Volumes/Loan\ Images/Oct2021.dmg -noverify -nomount | sed -n '2 p' | awk '{print$1}' )
break
;;
*) echo "Invalid Option selected: $REPLY";;
esac
done
diskutil  apfs deleteContainer /dev/disk0s2
sleep 3
diskutil eraseDisk apfs loaner /dev/disk0
Echo Disk Formatted!
sleep 3


#echo "thepath var is:"
#echo $thepath
sleep 3
asr --source $thepath --target /dev/disk1 --erase --noprompt

sleep 3 


#
Echo The Restore succeeded !!!! 

sleep 3



reboot
#End Script