partner=$1
toggle=$2
   curl --location --request PUT 'http://10.201.11.54:8090/api/genplus/partnerfeaturetoggle' \
    --header 'Content-Type: application/json' \
    --data-raw "{
	\"partnerCode\" : \"$partner\",
	\"featureToggles\":{
		\"RADPLUS_EDGE\":$toggle
	}
}"
