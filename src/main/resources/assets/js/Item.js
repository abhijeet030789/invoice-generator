function getEntity(){
 var entity = {
	"code" : $("#code").val(),
	"name" : $("#name").val(),
	"hsnCode" : $("#hsnCode").val(),
	"unit" : $("#unit").val(),
	"rate" : $("#rate").val(),
	"gstRate" : $("#gstRate").val(),
 };
 return entity;
}

function getUrl(){
    return "/item"
}
