#!/bin/bash

writefile=$1
writestr=$2

if [ $# -lt 2 ];
then
	echo "Wrong format"
	exit 1
fi

IFS='/'
read -ra arr <<< "$writefile"
IFS=''

for((i=1;i<${#arr[@]}-1;i++));
do
	path+="/${arr[$i]}"
	if [ ! -d $path ]
	then
		mkdir $path
	fi
done

echo $writestr > $writefile
