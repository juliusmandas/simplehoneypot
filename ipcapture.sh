flag="0";
while read line; do
#echo $line | grep -Eo ".+\.[0-9]{6}";

IP=$(echo $line | grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}\.[0-9]{1,5}:" | grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}");
PORT=$(echo $line | grep -Eo "\.[0-9]{1,5}\s" | grep -Eo "[0-9]{1,5}");

        while read stored; do
                IP2=$(echo $stored | grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}")
                if [ "$IP" == "$IP2" ];
                then
                        flag="1";
                        break;
                fi
        done < "/tmp/storedips.txt";

if [ "$flag" = "0" ];
then
        echo "$IP $PORT" >> /tmp/storedips.txt;
fi
flag="0";

done < "susipz.txt"
