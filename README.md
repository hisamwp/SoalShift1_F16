# Nomor 1
<li> Decode base64 lalu reverse menjadi hexxadecimal
  
```
  unzip nature.zip

olah1=`ls ~/Desktop/nomor1/nature | grep "[.]jpg$"`

for tes in $olah1
do
        `base64 -d ~/Desktop/nomor1/nature/"$tes" | xxd -r > ~/Desktop/nomor1/nature/"akhir$tes"`
done
```
1. pertama download file nature.zip lalu ditaruh di dalam folder nomor1 bersama dengan script bash nomor1.sh

2. Buat Script bash sebagai berikut :
- Pertama unzip nature.zip memasukan kedalam folder nature (Line pertama : unzip nature.zip)
- Lalu langkah setelah diekstrak cari file yang dicari memiliki extensi jpg, untuk melakukan hal ini dapat dilakukan dengan melist file yang ada dalam sebuah direktori, dengan menggunakan ls ~/Desktop/nomor1/nature. setelah di list file-file tersebut harus di ambil dengan kriteria jpg dengan menggunakan grep "[.]jpg$". lalu setelah di list dan grep dimasukan kedalam sebuah variabel agar bisa diolah.
- Setelah file diambil sesuai dengan kriteria, lakukan looping untuk mencari file yang ingin didecode dan di hex dump agar dapat dilihat fotonya dapat diakses. lalu lakukan perintah base64 untuk merubah file yang telah diiterasi menjadi hexadesimal, lalu di pipe agar file tersebut di kembalikan menjadi file aslinya dengan menggunakan perintah hexxdump (xxd -r > "direktori yang diinginkan"). -r berguna untuk melakukan reverse, dan > untuk menyimpan kedalam file.

3.  Lalu ditaruh kedalam crontab sesuai dengan aturan yang diinginkan. masuk ke menu crontab dengan command  crontab -e. lalu tulis dengan aturan : 14 14 14 2 fri ~/Desktop/nomor1/nomor1.sh


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

# Nomor 3
<li> Menggenerate Password acak dengan ketentuan tertentu

```
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

```
1. Dari soal yang diberikan diasumsikan kita melakukan input sesuai dengan banyak password yang ingin dibuat.

2. Buat Script Bash sebagai berikut :
- Pertama read input, lalu dimasukan kedalam sebuah variabel
- Buat loop dengan iterasi sebanyak dari input yang kita masukan (variabel iterasi i, sebanyak input)
- Buat 2 percabangan dengan guna sebagai berikut, percabangan pertama digunakan untuk melakukan check apakah nama dengan password-$i sudah dibuat apabila sudah makan pinda kepada iterasi selanjutnya. Dengan menggunakan perintah  -f 'lokasifile' "nama_file" (-f ~/Desktop/nomor3/"password-$i.txt"). jika belum pindah ke percabangan selanjutnya
- Pada percabangan selanjutnya perintahkan untuk menggenerate password dengan aturan maximum 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Perintah yang digunakan untuk menggenerate password adalah ( tr -cd '[:alnum:]'  < /dev/urandom | fold -w12 | head -n1&>> "password-$i.txt" ). guna dari -cd adalah untuk menghapus segala jenis password selain alfanumerik, dan alfanumerik adalah kriteria yang diinginkan. fold -w12 digunakan untuk membatasi banyaknya jumlah password yang digenerate. sedangkan head -n1 digunakan agar hanya 1 baris password yang digenerate, dan diguna dari &>> "password-$i.txt" untuk memasukan kedalam file tersebut.

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

# Nomor 5
<li> Menyimpan record dalam syslog dengan ketentuan tertentu

```
cat /var/log/syslog | awk 'tolower($0) ~ /cron/ && tolower($0) ~ !/sudo/ {print $0}' | awk 'NF<13' >> ~/Desktop/nomor5
```
1. Buat Script Bash sebagai berikut :
- Pertama hal yang harus dilakukan adalah menampilkan isi file syslog dengan perintah cat (cat /var/log/syslog)
- lalu pipe dan ikutin syarat yang perlu diikuti. gunakan awk untuk mengambil record yang sudah ditampilkan barusan. dengan aturan tidak mengandung string sudo dan mengandung string cron (/cron/ && !/sudo/), dan tidak bersifat case sensitif (tolower($0), lalu field pada baris kurang dari 13 ( NF<13 ) , >> ~/home/alfin/nomor5. untuk memasukan ke file tersebut.

2. Lalu ditaruh di crontab untuk menjalankan script secara periodik dengan tempo yang diinginkan 2-30/6 * * * * ~Desktop/nomor5/nomor5.sh
