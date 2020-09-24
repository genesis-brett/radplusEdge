for host in "$@"
do
	curl -X DELETE "http://$host:8090/api/genplus/partnerfeaturetoggle"
	curl -X DELETE "http://$host:8090/api/genplus/levelup/levelupwagerexchange"
	curl -X PUT "http://$host:8090/api/genplus/levelupseason/clearcache"
	curl -X PUT "http://$host:8090/api/genplus/leveluprewardroad/clearcache"	
	curl -X DELETE "http://$host:8090/api/genplus/partnerwagerexchange"
	curl -X PUT "http://$host:8090/api/genplus/levelupseason/clearcache"
done
