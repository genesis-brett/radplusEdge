del(.[].awardPrize[1,2])|
.[0].tierProbability=14.99 | .[0].awardPrize[].amount=10|
.[1].tierProbability=25.0 | .[1].awardPrize[].amount=15|
.[2].tierProbability=40.0 | .[2].awardPrize[].amount=50|
.[3].tierProbability=10.0 | .[3].awardPrize[].amount=50| .[3].awardPrize += [{ "prizeType":"CASH" , "amount":0 , "amountByCurrency":{"CNY": 500} }] |
.[4].tierProbability=10.0 | .[4].awardPrize[].amount=100| .[4].awardPrize += [{ "prizeType":"CASH" , "amount":0 , "amountByCurrency":{"CNY": 2000} }] |
.[5].tierProbability=0.01 | .[5].awardPrize[].amountByCurrency={"CNY":50000}
