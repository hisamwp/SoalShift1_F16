# Nomor 2

<li>Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
  
  ```
  a=$(awk -F "," '{if($7=="2012") {a[$1]+=$10}} {for(n in a){print n}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1)
  echo $a
  echo ""
  ```
  
  Dalam source code diatas, pertama kita berikan kondisi untuk menyaring data / record dengan tahun 2012 ```$7=="2012"```. Jika memenuhi kondisi, maka string a dengan indeks berupa nama negara, akan terisi nilai dari jumlah quantity tiap barang. akan berulang hingga record terakhir. Setelah itu kita mendapat jumlah quantity tiap negara, lalu di sort dengan ``` sort -nr ``` dan print hasilnya. Untuk memperlihatkan negara dengan penjualan terbanyak, kita saring dengan ```head -1```. 
  
<li>Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
  
  ```
  b=$(awk -F "," '{if($1 -eq $a && $7 == "2012") {b[$4] += $10}} END {for(pl in b){printf "%s, \n", pl}}' WA_Sales_Products_2012-14.csv | sort -nr | head -3)
  echo $b;
  echo ""
  ```
  
  Dalam source code diatas, kita menyaring data dengan kondisi, kolom ke 1 equivalent dengan hasil nomor 2a, dimana disimpan dalam variabel a. Kondisi keduanya adalah kolom ke 7 merupakan tahun 2012 ``` $1 -eq $a && $7 == "2012" ```. Jika memenuhi kondisi, maka string b dengan indeks product line akan terisi nilai jumlah quantitynya. Setelah mengetahui jumlah quantity tiap product line, maka disorting dengan ``` sort -nr```. Lalu kita print 3 terbesar, dengan cara menyaringnya ```bash head -3```. Lalu kita dapatkan hasilnya.
<li>Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.
  
  ```
  c=$(awk -F "," '{if($1 -eq $a && $4 -eq $b){c[$6]+=$10}} END {for(p in c) {printf "%s, \n", p}}' WA_Sales_Products_2012-14.csv | sort -nr | head -3)
  echo $c
  echo ""
  ```
  Dalam source code diatas, kita menyaring data dengan kondisi ``` $1 -eq $a && $4 -eq $b```, dimana a merupakan hasil dari nomor 2a dan b merupakan hasil dari nomor 2b. Jika memenuhi kondisi, maka string c dengan indeks product akan terisi dengan jumlah quantity tiap product. Setelah mendapat nilai tersebut, kita sorting dengan ``` sort -nr```. Setelah sorting, kita print dan kita saring menjadi 3 terbesar dengan ``` head -3```.

# Nomer 4

```
rotat=`date +"%H"`

format1=ABCDEFGHIJKLMNOPQRSTUVWXYZ
format2=abcdefghijklmnopqrstuvwxyz
```

Pertama, kita ambil jam dari sistem kita, lalu disimpan dalam variabel rotat. Lalu kita membuat variabel format1 dan format2, format1 berisi huruf uppercase, sedangkan format2 berisi huruf lowercase.

```
f1=($(echo ${format1[@]})$(echo ${format1[@]}))
f2=($(echo ${format2[@]})$(echo ${format2[@]}))

fUL=($(echo ${format1[@]})$(echo ${format2[@]}))
newf1=$(echo $format1 | tr "${format1:0:26}" "${f1:${rotat}:26}")
newf2=$(echo $format2 | tr "${format2:0:26}" "${f2:${rotat}:26}")
fUL2=($(echo ${newf1[@]})$(echo ${newf2[@]}))
```

Lalu, variabel f1 berisi huruf A-ZA-Z, dan f2 berisi huruf a-za-z. variabel fUL berisi huruf A-Za-z. Lalu untuk meng-enkripsi f1 dan f2, kita menggunakan menggunakan konsep caesar cipher, jika caesar cipher meng enkripsi dengan suatu bilangan, kita menggunakan bilangan yang kita simpan dalam rotat tadi. newf1 merupakan hasil enkripsi dari f1. newf2 merupakan hasil enkripsi dari f2. fUL2 merupakan gabungan dari newf1 dan newf2.

```
filename=`date +"%H:%M %d-%m-%Y"`

< /var/log/syslog > "$filename" tr "${fUL}" "${fUL2}"
```

variabel filename berisi jam:menit hari-bulan-tahun. filename ini untuk menamai file yang akan dibuat setelah file /var/log/syslog dienkripsi. perintah selanjutnya adalah enkripsi akhir dari /var/log/syslog. Enkripsi tersebut disimpan dalam file bernama filename.
