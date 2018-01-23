function getEntity(){
 var entity = {
	"gstNo" : $("#gstNo").val(),
	"name" : $("#name").val(),
	"address" : $("#address").val(),
	"state" : $("#state").val(),
	"stateCode" : $("#stateCode").val(),
	"phoneNumber" : $("#phoneNumber").val(),
	"email" : $("#email").val(),
	"transporter" : $("#transporter").val()
 };
 return entity;
}

function getUrl(){
    return "/party"
}
