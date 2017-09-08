function getEntity(){
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
 };
 return entity;
}

function getUrl(){
    return "/firm"
}
