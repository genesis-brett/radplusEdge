xfile=$1
index=0
for rewardRoad in $(cat $1)
do
  levelStr=$(echo $rewardRoad | cut -d, -f1)
  points=$(echo $rewardRoad | cut -d, -f2)
  radcoins=$(echo $rewardRoad | cut -d, -f3)
  boostRate=$(echo $rewardRoad | cut -d, -f4)
  if [[ $levelStr == "Milestone" ]]; then
     type=${levelStr^^}
     ((index=index+1))
     levelNumberStr=$levelNumber-$index
  else
     type=$(echo "LEVEL")
     levelNumber=$(echo $levelStr | awk -F"vl" '{print $2}')
     levelNumberStr=$levelNumber
     index=0
  fi

  if [[ -z $boostRate ]]; then
      boostRate=1.0
  fi
  
  if [[ ! -z $radcoins ]]; then
      reward=$(jq -n --arg prizeType 'NEW_RADCOIN' --argjson amount $radcoins '{ "prizeType":$prizeType , "amount": $amount}')
  else
      reward=' '
  fi
  echo "radcoins:"$radcoins",reward:"$reward," boostRate:"$boostRate
  curl --location --request POST 'http://172.16.50.52:8090/api/genplus/leveluprewardroad' \
    --header 'Content-Type: application/json' \
    --data-raw "{
        \"levelMainId\": \"RegularRM02\",
        \"level\": \"$levelNumberStr\",
        \"radCoinBoostRate\": $boostRate,
        \"rewards\": [ 
		       $reward
        ],
        \"neededLevelUpPoints\": $points,
        \"rewardRoadType\": \"$type\"
    }"
done
