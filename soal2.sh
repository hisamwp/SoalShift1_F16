echo "nomer 2a"

a=$(awk -F "," '{if($7=="2012") {a[$1]+=$10}} {for(n in a){print n}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1)
echo $a
echo ""

echo "nomer 2b"

b=$(awk -F "," '{if($1 -eq $a && $7 == "2012") {b[$4] += $10}} END {for(pl in b){printf "%s, \n", pl}}' WA_Sales_Products_2012-14.csv | sort -nr | head -3)
echo $b;
echo ""

echo "nomer 2c"

c=$(awk -F "," '{if($1 -eq $a && $4 -eq $b){c[$6]+=$10}} END {for(p in c) {printf "%s, \n", p}}' WA_Sales_Products_2012-14.csv | sort -nr | head -3)
echo $c
echo ""
