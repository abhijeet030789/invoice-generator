function entityX(entity, action){
    var type = "";
    var url = getUrl();
    switch(action){
        case "ADD" : type = "POST"; break;
        case "EDIT" : type = "PUT";  break;
        case "DELETE" : type = "DELETE"; break;
        default : throw "action not handled. action = " + action;
    }
    var returnVal;
    $.ajax({
        type: type,	url: url, dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(entity),
        traditional: true,
        success:function(response) {
           if(response.success){
               alert(response.t);
               window.open( url+"/list", "_self").reload();
           }else{
               alert(response.errorMsg);
           }
        },
        error:function(response) {
            alert(response.responseText);
        }
    });
}

$("#buttonEditEntity").click(function(){entityX(getEntity(), "EDIT");});
$("#buttonDeleteEntity").click(function(){entityX(getEntity(), "DELETE");});
$("#buttonAddEntity").click(function(){entityX(getEntity(), "ADD");});
