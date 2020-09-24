username=$1
passwd=$2
bohost=$3
genplushost=$4
 
passwd_hash=$(echo -n "$passwd" | openssl dgst -sha1 | cut -d" " -f2)
bo_token=$( curl -s "https://$bohost/bo-api/login"  -H 'content-type: application/json' --data-binary "{\"userName\":\"$username\",\"password\":\"$passwd_hash\"}" | cut -d\" -f4 )

oldmessageId=$(curl -s "http://$genplushost:8090/api/messageconditions" |jq '.[] |select(.conditionId == "FIRST_TIME_UNLOCK_LOOTBOX")|.messageId' | cut -d\" -f2)

echo "oldMessageId:",$oldmessageId

messageId=$(curl -s --location --request POST "https://$bohost/bo-api/messages" \
  -H "Authorization: Bearer $bo_token" \
  -H 'Content-Type: application/json' \
  -d '{
    "partnerCodes": [],
    "messageCategory": "MESSAGE",
    "messageTag": "DIALOG",
    "messageSource": "RADPLUS",
    "brand": "RADI8",
    "messageStatus": "ACTIVE",
    "inbox": true,
    "popup": true,
    "conditional": true,
    "playerIds": {},
    "gameCodes": [],
    "expireDate": 1924963199999,
    "pushDate": 1598500800000,
    "cta" : {
		"ctaType" : "OPEN_RADPLUS_PANEL",
		"payload" : "{}"
	},
    "messageContents": [
        {
            "localeCode": "en",
            "title": "Congratulations! You can get your first Loot Box.",
            "subtitle": "",
            "contentDetailOfPushMsg": "Congratulations! You can get your first Loot Box.",
            "previewOfContentDetail": "",
            "contentDetail": "You have earned enough Reward Coins to get your first Loot Box. Go to your Edge control center to find more ways to win.",
            "ctaText": "Get Loot Box Now",
            "messageContentPictures": [
                {
                    "name": "",
                    "url": ""
                },
                {
                    "name": "",
                    "url": ""
                }
            ]
        },
        {
            "localeCode": "zh-hans",
            "title": "恭喜！您能获得自己的第一个惊喜宝箱了。",
            "subtitle": "",
            "contentDetailOfPushMsg": "恭喜！您能获得自己的第一个惊喜宝箱了。",
            "previewOfContentDetail": "",
            "contentDetail": "您已赚足奖励币，可以获得自己的第一个惊喜宝箱了。前往R8红利机制控制中心，查看更多赢奖方法。",
            "ctaText": "立即获得惊喜宝箱",
            "messageContentPictures": [
                {
                    "name": "KB",
                    "url": ""
                },
                {
                    "name": "BK",
                    "url": ""
                }
            ]
        },
        {
            "localeCode": "zh-hant",
            "title": "恭喜！您能獲得自己的第一個驚喜寶箱了。",
            "subtitle": "",
            "contentDetailOfPushMsg": "恭喜！您能獲得自己的第一個驚喜寶箱了。",
            "previewOfContentDetail": "",
            "contentDetail": "您已賺足獎勵幣，可以獲得自己的第一個驚喜寶箱了。前往R8紅利機制控制中心，查看更多贏獎方法。",
            "ctaText": "馬上獲得驚喜寶箱",
            "messageContentPictures": [
                {
                    "name": "KB",
                    "url": ""
                },
                {
                    "name": "BK",
                    "url": ""
                }
            ]
        },
        {
            "localeCode": "in",
            "title": "Selamat! Anda bisa mendapatkan Loot Box\npertama Anda.",
            "subtitle": "",
            "contentDetailOfPushMsg": "Selamat! Anda bisa mendapatkan Loot Box\npertama Anda.",
            "previewOfContentDetail": "",
            "contentDetail": "Anda telah mendapatkan Hadiah Koin yang cukup untuk mendapatkan Loot Box pertama Anda. Masuk ke pusat kontrol Edge Anda untuk menemukan lebih banyak cara untuk menang.",
            "ctaText": "Dapatkan Loot Box Sekarang",
            "messageContentPictures": [
                {
                    "name": "KB",
                    "url": ""
                },
                {
                    "name": "BK",
                    "url": ""
                }
            ]
        },
        {
            "localeCode": "vi",
            "title": "Chúc mừng! Bạn có thể nhận Loot Box đầu tiên.",
            "subtitle": "",
            "contentDetailOfPushMsg": "Chúc mừng! Bạn có thể nhận Loot Box đầu tiên.",
            "previewOfContentDetail": "",
            "contentDetail": "Bạn đã kiếm đủ Reward Coins để nhận Loot Box đầu tiên của bạn. Đi đến trung tâm điều khiểnEdge  để tìm thêm đường thắng.",
            "ctaText": "Nhận Loot Box Ngay",
            "messageContentPictures": [
                {
                    "name": "KB",
                    "url": ""
                },
                {
                    "name": "BK",
                    "url": ""
                }
            ]
        },
        {
            "localeCode": "th",
            "title": "ยินดีด้วย! คุณรับ Loot Box ชิ้นแรกของคุณได้แล้ว",
            "subtitle": "",
            "contentDetailOfPushMsg": "ยินดีด้วย! คุณรับ Loot Box ชิ้นแรกของคุณได้แล้ว",
            "previewOfContentDetail": "",
            "contentDetail": "คุณได้รับเหรียญรางวัลเพียงพอที่จะรับ Loot Box ชิ้นแรก ไปยังศูนย์ควบคุม Edge ของคุณเพื่อหาวิธีในการชนะรางวัลเพิ่มอีก",
            "ctaText": "รับ Loot Box ทันที",
            "messageContentPictures": [
                {
                    "name": "KB",
                    "url": ""
                },
                {
                    "name": "BK",
                    "url": ""
                }
            ]
        },
        {
            "localeCode": "ru",
            "title": "Ура! Доступен первый ящик Loot Box.",
            "subtitle": "",
            "contentDetailOfPushMsg": "Ура! Доступен первый ящик Loot Box.",
            "previewOfContentDetail": "",
            "contentDetail": "Вы заработали достаточно монет Монет-наград, чтобы приобрести первый ящик Loot Box. Перейдите в центр управления Edge, чтобы узнать, какие есть дополнительные способы выигрыша.",
            "ctaText": "Получите ящик Loot Box",
            "messageContentPictures": [
                {
                    "name": "",
                    "url": ""
                },
                {
                    "name": "",
                    "url": ""
                }
            ]
        },
        {
            "localeCode": "tr",
            "title": "Tebrikler! İlk Loot Box'\''ını alabilirsin.",
            "subtitle": "",
            "contentDetailOfPushMsg": "Tebrikler! İlk Loot Box'\''ını alabilirsin.",
            "previewOfContentDetail": "",
            "contentDetail": "İlk Loot Box'\''ını almak için yeterli Ödül Jetonu kazandın. Kazanmanın daha fazla yolunu bulmak için Edge kontrol merkezine git.",
            "ctaText": "Loot Box'\''ını Hemen Al",
            "messageContentPictures": [
                {
                    "name": "",
                    "url": ""
                },
                {
                    "name": "",
                    "url": ""
                }
            ]
        },
        {
            "localeCode": "ja",
            "title": "おめでとうございます！最初のLoot Boxを入手しました。",
            "subtitle": "",
            "contentDetailOfPushMsg": "おめでとうございます！最初のLoot Boxを\n入手しました。",
            "previewOfContentDetail": "",
            "contentDetail": "最初のLoot Boxを入手するのに十分なリワードコインを獲得しました。Edgeコントロールパネルに移動して獲得方法を確認します。",
            "ctaText": "今すぐLoot Box入手",
            "messageContentPictures": [
                {
                    "name": "",
                    "url": ""
                },
                {
                    "name": "",
                    "url": ""
                }
            ]
        }
    ]
}' | cut -d\" -f 16) 

echo "messageId:",$messageId

curl -X DELETE "http://$genplushost:8090/api/genplus-messageconditions" --header 'Content-Type: application/json' --data-raw "{
    \"conditionId\": \"FIRST_TIME_UNLOCK_LOOTBOX\",
    \"conditionDesc\" :\"First time unlock lootbox MSG with CTA\",
    \"messageId\":\"$oldmessageId\"
}"

curl -X POST "http://$genplushost:8090/api/genplus-messageconditions" --header 'Content-Type: application/json' --data-raw "{
    \"conditionId\": \"FIRST_TIME_UNLOCK_LOOTBOX\",
    \"conditionDesc\" :\"First time unlock lootbox MSG with CTA\",
    \"messageId\":\"$messageId\"
}"
