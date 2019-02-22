# Nomor 1
<li> Decode Hexadecimal lalu lakukan hexxdump
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
<li>Membuat Password yang digenerate secara random
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

