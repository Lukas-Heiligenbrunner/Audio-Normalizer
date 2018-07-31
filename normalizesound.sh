#!/bin/bash


#ffmpeg -i file.mp3 -af "volumedetect" -vn -sn -dn -f null /dev/null 2>&1 | grep "max_volume" | tr -s ' ' '\n' | tail -n 2 | head -n 1

for i in  *.m4a
do

echo "$i"
dbvalue=$(ffmpeg -i "$i" -af "volumedetect" -vn -sn -dn -f null /dev/null 2>&1 | grep "max_volume" | tr -s ' ' '\n' | tail -n 2 | head -n 1)

echo $dbvalue

if [ "$dbvalue" == "0.0" ]
then
echo "nothing to change..."

else 

dbvaluechanged=$(echo $dbvalue | cut -c 2-)

echo 'change '$dbvaluechanged'db'

#ffmpeg -i "$i" -af 'volume='$dbvaluechanged'dB' "new_$i" 2> /dev/null
#rm "$i"
#mv "new_$i" "$i"
#echo "replaced old file..."


fi
done
