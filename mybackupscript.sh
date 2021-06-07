#!/bin/bash

TOBACKUP=$1
COMPRESSIONTYPE=$2
OUTPUTFILE=$3

echo "" >> error.log
echo "Backup process started, $(date)" >> error.log

if [ ! -d $HOME/backup_dir ]
then
	mkdir $HOME/backup_dir
	echo "Backup directory created" >> error.log
fi

if [ $# -ne 3 ]
then
	echo "Number of valid arguments entered not equal to 3. Backup failed" >> error.log
else
	if [ $COMPRESSIONTYPE == "none" ]
	then
		tar cf - -P $TOBACKUP | openssl enc -e -aes256 -out $OUTPUTFILE.tar
		mv $OUTPUTFILE.tar $HOME/backup_dir
	elif [ $COMPRESSIONTYPE == "gzip" ]
	then
		tar czf - -P $TOBACKUP | openssl enc -e -aes256 -out $OUTPUTFILE.tar.gz
		mv $OUTPUTFILE.tar.gz $HOME/backup_dir
	elif [ $COMPRESSIONTYPE == "bzip" ]
	then
		tar cfj - -P $TOBACKUP | openssl enc -e -aes256 -out $OUTPUTFILE.tar.tbz
		mv $OUTPUTFILE.tar.tbz $HOME/backup_dir
	else
		echo "Value entered for argument 2 is not among none, gzip or bzip. Backup failed" >> error.log
	fi
fi
	
echo "Backup process finished, $(date)" >> error.log


