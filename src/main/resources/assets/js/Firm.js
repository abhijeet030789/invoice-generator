function getEntity(){
var gstEnabled = $("#gstEnabled").val();
if(!(gstEnabled == 'Y' || gstEnabled == 'y' || gstEnabled == 'N' || gstEnabled == 'n')){
    alert("[ERROR] Input for GST Enabled should be either Y or N"); return;
}
 var entity = {
	"gstNo" : $("#gstNo").val(),
	"firmName" : $("#firmName").val(),
	"addressLineOne" : $("#addressLineOne").val(),
	"state" : $("#state").val(),
	"stateCode" : $("#stateCode").val(),
	"phoneNumber" : $("#phoneNumber").val(),
	"emailId" : $("#emailId").val(),
	"bankName" : $("#bankName").val(),
	"accountNumber" : $("#accountNumber").val(),
	"ifscCode" : $("#ifscCode").val(),
	"bankBranch" : $("#bankBranch").val(),
	"gstEnabled" : gstEnabled.toUpperCase(),
	"invoicePrefix" : $("#invoicePrefix").val(),
	"invoiceStartIndex": $("#invoiceStartIndex").val(),
    "invoiceCurrentIndex": $("#invoiceStartIndex").val() - 1
 };
 return entity;
}

function getUrl(){
    return "/firm"
}
