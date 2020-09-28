db.playerWagerInventory.aggregate([{
        $match: {}
    }, {
        $lookup: {
            from: "playerGenCoinInventory",
            localField: "_id",
            foreignField: "_id",
            as: "radcoin_info"
        }
    }, {
        $unwind: {
            path: "$radcoin_info",
            preserveNullAndEmptyArrays: true
        }
    }, {
        $lookup: {
            from: "playerFreeSpinBoosterInventory",
            localField: "_id",
            foreignField: "_id",
            as: "freespin_info"
        }
    }, {
        $unwind: {
            path: "$freespin_info",
            preserveNullAndEmptyArrays: true
        }
    },
    {
        $lookup: {
            from: "playerSuperFreeSpinBoosterInventory",
            localField: "_id",
            foreignField: "_id",
            as: "superfreespin_info"
        }
    }, {
        $unwind: {
            path: "$superfreespin_info",
            preserveNullAndEmptyArrays: true
        }
    },
    {
        $lookup: {
            from: "playerWildBoosterInventory",
            localField: "_id",
            foreignField: "_id",
            as: "wild_info"
        }
    }, {
        $unwind: {
            path: "$wild_info",
            preserveNullAndEmptyArrays: true
        }
    },
    {
        $lookup: {
            from: "playerSuperWildBoosterInventory",
            localField: "_id",
            foreignField: "_id",
            as: "superwild_info"
        }
    }, {
        $unwind: {
            path: "$superwild_info",
            preserveNullAndEmptyArrays: true
        }
    },
    {
        $lookup: {
            from: "playerLiteFreeSpinBoosterInventory",
            localField: "_id",
            foreignField: "_id",
            as: "liteFreeSpin_info"
        }
    }, {
        $unwind: {
            path: "$liteFreeSpin_info",
            preserveNullAndEmptyArrays: true
        }
    },
    {
        $lookup: {
            from: "playerRadcoinInventory",
            localField: "_id",
            foreignField: "_id",
            as: "new_radcoin_info"
        }
    }, {
        $unwind: {
            path: "$new_radcoin_info",
            preserveNullAndEmptyArrays: true
        }
    },
    {
        $project: {
            partnerCode: 1,
            playerId: 1,
            currency: 1,
            gencoinBalance: {
                $ifNull: [{
                    "$subtract": ["$radcoin_info.totalAdded", "$radcoin_info.totalUsed"]
                }, 0]
            },
            freespinBalance: {
                $ifNull: [{
                    "$subtract": ["$freespin_info.totalAdded", "$freespin_info.totalUsed"]
                }, 0]
            },
            superfreespinBalance: {
                $ifNull: [{
                    "$subtract": ["$superfreespin_info.totalAdded", "$superfreespin_info.totalUsed"]
                }, 0]
            },
            wildBalance: {
                $ifNull: [{
                    "$subtract": ["$wild_info.totalAdded", "$wild_info.totalUsed"]
                }, 0]
            },
            superWildBalance: {
                $ifNull: [{
                    "$subtract": ["$superwild_info.totalAdded", "$superwild_info.totalUsed"]
                }, 0]
            },
            liteFreeSpinBalance: {
                $ifNull: [{
                    "$subtract": ["$liteFreeSpin_info.totalAdded", "$liteFreeSpin_info.totalUsed"]
                }, 0]
            },
            radcoinBalance: {
                $ifNull: [{
                    "$subtract": ["$new_radcoin_info.totalAdded", "$new_radcoin_info.totalUsed"]
                }, 0]
            }
        }
    }
]).forEach(result => {
    print(result.partnerCode + "," + result.playerId + "," + result.currency + "," + result.gencoinBalance + "," + result.freespinBalance + "," + result.superfreespinBalance + "," + result.wildBalance + "," + result.superWildBalance + "," + result.liteFreeSpinBalance + "," + result.radcoinBalance);
});