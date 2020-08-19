xfile=$1
for exchangeRate in $(cat $1)
do
  currency=$(echo $exchangeRate | cut -d, -f1)
  betAmount=$(echo $exchangeRate | cut -d, -f2)
  targetValue=$(echo $exchangeRate | cut -d, -f3)
  echo $rate 
  curl --location --request POST 'http://10.201.11.54:8090/api/genplus/levelup/levelupwagerexchange' \
    --header 'Content-Type: application/json' \
    --data-raw "{
	\"exchangeType\":\"LEVEL_UP_POINT_EXCHANGE\",
	\"currency\": \"$currency\",
	\"betAmount\": $betAmount,
	\"targetValue\": $targetValue,
	\"tag\":\"RegularRM02\"
  }"
done
