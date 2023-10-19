#!/usr/bin/bash


#CHEMIN="/mnt/c/Users/drvba/OneDrive/Documents/Dev/GitHub/shell-exe/job08"
DATE=$(date +%Y-%m-%d-%H:%M)

grep "session opened for user barbz" /var/log/auth.log | wc -l > /mnt/c/Users/drvba/OneDrive/Documents/Dev/GitHub/shell-exe/job08/number_connection-$DATE

if [ ! -f /mnt/c/Users/drvba/OneDrive/Documents/Dev/GitHub/shell-exe/job08/Backup/number_connection-DATE.tar ]
then
	tar -cvf /mnt/c/Users/drvba/OneDrive/Documents/Dev/GitHub/shell-exe/job08/Backup/number_connection-DATE.tar /mnt/c/Users/drvba/OneDrive/Documents/Dev/GitHub/shell-exe/job08/number_connection-$DATE && rm /mnt/c/Users/drvba/OneDrive/Documents/Dev/GitHub/shell-exe/job08/number_connection-$DATE
else 
	tar -uvf /mnt/c/Users/drvba/OneDrive/Documents/Dev/GitHub/shell-exe/job08/Backup/number_connection-DATE.tar /mnt/c/Users/drvba/OneDrive/Documents/Dev/GitHub/shell-exe/job08/number_connection-$DATE && rm /mnt/c/Users/drvba/OneDrive/Documents/Dev/GitHub/shell-exe/job08/number_connection-$DATE
fi 	
