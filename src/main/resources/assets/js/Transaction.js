function getEntity(){
 var entity = {
	"invoiceNo" : $("#invoiceNo").val(),
	"firmGstNo" : $("#firmGstNo").val(),
	"firmName" : $("#firmName").val(),
	"partyGstNo" : $("#partyGstNo").val(),
	"partyName" : $("#partyName").val(),
	"totalAmount" : $("#totalAmount").val(),
 };
 return entity;
}

function getUrl(){
    return "/transaction"
}
