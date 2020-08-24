#!/bin/awk -f

BEGIN {
    # booster price
    exchangeRate[5] = 96;
    exchangeRate[6] = 2256;
    exchangeRate[7] = 90;
    exchangeRate[8] = 2100;
    exchangeRate[9] = 24;
    # currency exchange rate setting
    radCoinExchangeRate["USD"] = 2;
    # partner baseline setting
    partner["BBIN"]=4.0;
    partner["BBINTEST"]=4.0;
    partner["BBIN_Staging"]=4.0;
    partner["BetConstruct"]=2.0;
    partner["BOS"]=2.0;
    partner["Rescuebet"]=2.0;
    partner["Entaplay"]=2.0;
    partner["OG"]=2.0;
    partner["GNS"]=2.0;
    partner["Simbo"]=2.0;
    partner["TGP"]=2.0;
    partner["HongChow"]=2.0;
    partner["BG"]=2.0;
} {
    baseline = 1.0
    radCoinCurrencyExchangeRate = 1.0
    if ($1 in partner) {
        baseline = partner[$1];
    }
    if ($3 in radCoinExchangeRate){
        radCoinCurrencyExchangeRate = radCoinExchangeRate[$3];
    }
    if($4+$5+$6+$7+$8+$9>0){
        username[$1 "," $2] += radCoinCurrencyExchangeRate * ($4 + ($5 * exchangeRate[5] + $6 * exchangeRate[6] + $7 * exchangeRate[7] + $8 * exchangeRate[8] + $9 * exchangeRate[9]))*baseline;
    }
}
END {
    print "partnerCode,playerId,playerRadcoinInventoryDelta";
    for (i in username) {
        if(username[i]>0){
            printf("%s,%.2f\n",i,username[i]);
        }
    }
}
