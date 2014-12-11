#!/bin/sh
## getsubject.sh for getsubject in /home/exam/scripts/mogversion
## 
## Made by Moghrabi Alexandre
## Login   <alexandre.moghrabi@epitech.eu>
## 
## Started on  Wed Dec  3 19:10:02 2014 Moghrabi Alexandre
## Last update Thu Dec 11 15:16:12 2014 Moghrabi Alexandre
##

SERVERIP="10.40.0.116"
EXAMDIR="/home/exam/"

read -p "Login: " user
read -p "Token: " password

echo "Cleaning exam dir..."
rm -rf $EXAMDIR/rendu
rm -rf $EXAMDIR/sujet
rm -rf $EXAMDIR/temp

echo "Getting exam subject..."
mkdir -p $EXAMDIR/rendu
mkdir -p $EXAMDIR/sujet
mkdir -p $EXAMDIR/temp
ncftpget -u $user -p $password $SERVERIP $EXAMDIR/temp/ subject.tar.gz
cd $EXAMDIR/sujet
echo "Extracting exam subject..."
tar -xzvf $EXAMDIR/temp/subject.tar.gz
rm -f $EXAMDIR/temp/subject.tar.gz
read -p "Done. You can start your exam. GL HF!" r
