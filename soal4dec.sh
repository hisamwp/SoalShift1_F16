#!/bin/bash

read filename
rotat="${filename:0:2}"
#echo $rotat

format1=ABCDEFGHIJKLMNOPQRSTUVWXYZ
format2=abcdefghijklmnopqrstuvwxyz

#format2=PQRSTUVWXYZABCDEFGHIJKLMNOpqrstuvwxyzabcdefghijklmno

f1=($(echo ${format1[@]})$(echo ${format1[@]}))
f2=($(echo ${format2[@]})$(echo ${format2[@]}))

fUL=($(echo ${format1[@]})$(echo ${format2[@]}))
newf1=$(echo $format1 | tr "${format1:0:26}" "${f1:${rotat}:26}")
newf2=$(echo $format2 | tr "${format2:0:26}" "${f2:${rotat}:26}")
fUL2=($(echo ${newf1[@]})$(echo ${newf2[@]}))

< "$filename" > "$filename decrypted" tr "${fUL2}" "${fUL}"
