
#!/bin/bash
echo "berapa banyak jumlah password yang akan dibuat: "
read input

for((i=1; i<=input; i=i+1))
do
	if [ -f ~/Desktop/nomor3/"password-$i.txt" ]
	then input=$input+1
	else
		`tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1&>> "password-$i.txt"`
	fi
done

