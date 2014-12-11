#!/bin/sh
## rendu.sh for rendu in /home/exam/scripts/mogversion
## 
## Made by Moghrabi Alexandre
## Login   <alexandre.moghrabi@epitech.eu>
## 
## Started on  Wed Dec  3 19:23:35 2014 Moghrabi Alexandre
## Last update Thu Dec 11 15:16:19 2014 Moghrabi Alexandre
##

IPSERVER="10.40.0.116"
EXAMDIR="/home/exam/"

read -p "Login: " login
read -p "Password: " password

echo "Creating user tarball..."
cp -r $EXAMDIR/rendu/ $EXAMDIR/temp/
cd $EXAMDIR/temp/
tar -czpf $login.tar.gz rendu
echo "Testing tarball..."
ret=`tar -xzvf $login.tar.gz 2>&1 1>/dev/null`
echo $ret
if [ "$ret" != "" ];
then
    echo "ERROR ON TESTING TARBALL. RETRY PLZ."
    exit 1
else
    echo "OK."
fi
echo "Uploading tarball..."
ncftpput -u $login -p $password $IPSERVER . $EXAMDIR/temp/$login.tar.gz
read -p "Done, you can disconnect. GG." r