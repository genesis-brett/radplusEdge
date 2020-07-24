xfile=$1
for exchangeRate in $(cat $1)
do
  currency=$(echo $exchangeRate | cut -d, -f1)
  rate=$(echo $exchangeRate | cut -d, -f2)
  echo $rate 
  curl --location --request POST 'http://10.201.11.54:8090/api/genplus/levelup/levelupwagerexchange' \
    --header 'Content-Type: application/json' \
    --data-raw "{
	\"exchangeType\":\"RADCOIN_FREE_BET\",
	\"currency\": \"$currency\",
	\"betAmount\": 1,
	\"targetValue\": $rate,
	\"tag\":\"\"
  }"
done
