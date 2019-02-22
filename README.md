# Nomor 2

<li>Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
  ---bash
  ---
  Dalam source code diatas, pertama kita berikan kondisi untuk menyaring data / record dengan tahun 2012 ---bash $7=="2012"---. Jika memenuhi kondisi, maka string a dengan indeks berupa nama negara, akan terisi nilai dari jumlah quantity tiap barang. akan berulang hingga record terakhir. Setelah itu kita mendapat jumlah quantity tiap negara, lalu di sort dengan ---bash sort -nr --- dan print hasilnya. Untuk memperlihatkan negara dengan penjualan terbanyak, kita saring dengan ---bash head -1 ---. 
  
<li>Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
  ---bash
  ---
  Dalam source code diatas, kita menyaring data dengan kondisi, kolom ke 1 equivalent dengan hasil nomor 2a, dimana disimpan dalam variabel a. Kondisi keduanya adalah kolom ke 7 merupakan tahun 2012 ---bash $1 -eq $a && $7 == "2012" ---. Jika memenuhi kondisi, maka string b dengan indeks product line akan terisi nilai jumlah quantitynya. Setelah mengetahui jumlah quantity tiap product line, maka disorting dengan ---bash sort -nr---. Lalu kita print 3 terbesar, dengan cara menyaringnya ---bash head -3---. Lalu kita dapatkan hasilnya.
<li>Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.
  ---bash
  ---
  Dalam source code diatas, kita menyaring data dengan kondisi ---bash $1 -eq $a && $4 -eq $b---, dimana a merupakan hasil dari nomor 2a dan b merupakan hasil dari nomor 2b. Jika memenuhi kondisi, maka string c dengan indeks product akan terisi dengan jumlah quantity tiap product. Setelah mendapat nilai tersebut, kita sorting dengan ---bash sort -nr---. Setelah sorting, kita print dan kita saring menjadi 3 terbesar dengan ---bash head -3---.

# Nomer 4
