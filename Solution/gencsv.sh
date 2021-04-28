#!/bin/bash
n=10
if [ "$#" -ne 0 ]
then
	n=$1
fi
for i in `seq $n`
do
echo $((i-1))"," `od -An -N1 -i /dev/random` >>./inputFile
done
