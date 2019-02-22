#!/bin/bash

unzip nature.zip

olah1=`ls ~/Desktop/nomor1/nature | grep "[.]jpg$"`

for tes in $olah1
do
	`base64 -d ~/Desktop/nomor1/nature/"$tes" | xxd -r > ~/Desktop/nomor1/nature/"akhir$tes"`
done
