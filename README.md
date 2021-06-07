# DevOps
This is the solution for the DevOps Week-1 assignment.

The script takes in three arguments

1) The file to be backed up
2) The compression type. Only three values are allowed i.e. 'none', 'gzip' and 'bzip'
3) The name of the output file

The status of the backup along with any errors are directed towards the file error.log
The backup will always be created in the directory backup_dir under the users $HOME. If the folder doesn't exist, it will be created by the script.
If the number of arguments is less than 3, then the backup will not be performed. Similarly if the compression is not one of 'none', 'gzip' or 'bzip', then too backup will not be perfomed. 

When the compression type argument is none, simple tar is performed and the backup archive will be names 'outputfile'.tar
When the compression type argument is gzip, gzip is performed and the backup archive will be names 'outputfile'.tar.gz
When the compression type argument is bzip, tbzip is performed and the backup archive will be names 'outputfile'.tar.tbz

The command for decrypting the archive (depending on the compression type) is given below

openssl enc -d -aes256 -in 'outputfile'.tar | tar x -C test
openssl enc -d -aes256 -in 'outputfile'.tar.gz | tar xz -C test
openssl enc -d -aes256 -in 'outputfile'.tar.tbz | tar xj -C test

I have used the encryption/decryption code from the site https://www.tecmint.com/encrypt-decrypt-files-tar-openssl-linux/
