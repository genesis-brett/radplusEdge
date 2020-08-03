#!/bin/awk -f

BEGIN {
    exchangeRate[5] = 96;
    exchangeRate[6] = 2256;
    exchangeRate[7] = 90;
    exchangeRate[8] = 2100;
    exchangeRate[9] = 24;
    # currency exchange rate setting
    radCoinExchangeRate["CNY"] = (10/8);
    radCoinExchangeRate["EUR"] = (10/8);
    radCoinExchangeRate["USD"] = (20/8);
    # partner baseline setting
    partner["1xBet_R8"]=2.0;
    partner["BBIN"]=4.0;
    partner["BBINTEST"]=4.0;
    partner["BBIN_Staging"]=4.0;
    partner["BetConstruct"]=2.0;
    partner["Fun88"]=2.0;
    partner["GPKTEST"]=2.0;
    partner["GPK_Staging"]=2.0;
    partner["GT"]=2.0;
    partner["GTDemo"]=2.0;
    partner["GTDemo_radi8"]=2.0;
    partner["GT_radi8"]=2.0;
    partner["HappyLuke"]=2.0;
    partner["Lebo"]=2.0;
    partner["PDparent"]=2.0;
    partner["Pomadorro"]=2.0;
    partner["PomadorroStaging"]=2.0;
    partner["Royal77R8"]=2.0;
    partner["Sekabet"]=2.0;
    partner["fun88"]=2.0;
    partner["gt"]=2.0;
    partner["happyluke"]=2.0;
    partner["lebo"]=2.0;
    partner["OG"]=2.0;
    partner["GNS"]=2.0;

} {
    baseline = 1.0
    if ($1 in partner) {
        baseline = partner[$1];
    }
    if($4+$5+$6+$7+$8+$9>0){
        if( $3 in radCoinExchangeRate){
            username[$1 "," $2] += radCoinExchangeRate[$3] * ($4 + ($5 * exchangeRate[5] + $6 * exchangeRate[6] + $7 * exchangeRate[7] + $8 * exchangeRate[8] + $9 * exchangeRate[9]))*baseline;
        }
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
