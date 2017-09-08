function getEntity(){
 var entity = {
	"id" : $("#id").val(),
	"invoiceNo" : $("#invoiceNo").val(),
	"slNo" : $("#slNo").val(),
	"itemName" : $("#itemName").val(),
	"hsnCode" : $("#hsnCode").val(),
	"unit" : $("#unit").val(),
	"quantity" : $("#quantity").val(),
	"rate" : $("#rate").val(),
	"total" : $("#total").val(),
	"discount" : $("#discount").val(),
	"taxableAmount" : $("#taxableAmount").val(),
	"cgstRate" : $("#cgstRate").val(),
	"cgstAmount" : $("#cgstAmount").val(),
	"sgstRate" : $("#sgstRate").val(),
	"sgstAmount" : $("#sgstAmount").val(),
	"igstRate" : $("#igstRate").val(),
	"igstAmount" : $("#igstAmount").val(),
	"amount" : $("#amount").val(),
 };
 return entity;
}

function getUrl(){
    return "/transactiondetail"
}
