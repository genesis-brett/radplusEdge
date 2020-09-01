db.lootBoxPartnerConfig.update({partnerCode:partner},{$set:{active:false}},false,true);
db.lootBoxPartnerConfig.insert([
{
	"active" : true,
	"lootBoxId" : "5f27b9fd953487eaf5097b4d",
	"partnerCode" : partner
},
{
	"active" : true,
	"lootBoxId" : "5f3603a5483df3968b8447d6",
	"partnerCode" : partner
},
{
	"active" : true,
	"lootBoxId" : "5f3603a5483df3968b8447d7",
	"partnerCode" : partner
},
{
	"active" : true,
	"lootBoxId" : "5f27b9fd953487eaf5097b4e",
	"partnerCode" : partner
}]);

