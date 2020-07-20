split("\n") | map(select(length>0))|.[1:] |map(split(","))| map(.[2]|= tonumber)|
        map({"_id": (.[0]+"/"+.[1]),
             "_class": "com.genesis.platform.genplus.core.model.PlayerRadCoinInventory",
             "partnerCode": .[0],
             "playerId": .[1],
             "totalAdded" : .[2],
             "totalUsed" : 0.0,
             "lastTxId": "",
             "updateTime" : {"$date":now|todate}
             })
