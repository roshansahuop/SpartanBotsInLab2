#!/bin/sh
IFS=' ' read arr < q4_in.txt
count=0.0
mean=0.0
sum=0.0
lines=0

rm temp temp2 2> /dev/null

for number in $arr
do
    sum=$(echo $sum+$number | bc )
    count=$(echo $count+1 | bc )
    echo $number >> temp
done
echo " scale=2; $sum/$count" | bc

sort < temp > temp2

lines=$(wc -l < temp2)
middle=$((lines/2+1))
middle1=$((lines/2))

if [ $((lines%2)) -eq 0 ]
then
  n2=$(tail -n +$middle temp2 | head -n 1)
  n1=$(tail -n +$middle1 temp2 | head -n 1)
  echo " scale=2; ($n1+$n2)/2" | bc
else
  tail -n +$middle temp2 | head -n 1
fi
 
rm temp temp2 2> /dev/null