<html>
    <head>
        <title>Invoice Generator</title>
    </head>
    <body>
        <table width="100%">
           <tr>
            <td> <a href="/item/list"> Items </a> </td>
            <td> <a href="/party/list"> Party Details </a> </td>
            <td> <a href="/firm/list"> Registered Firms </a> </td>
            <td> <a href="/transaction/list"> Transactions </a> </td>
           </tr>
        </table>
        <br>
        <div align="centre">
            <table>
            <tr>
                <td><font size="10"> Select Firm: </font></td>
                <td>
                    <select id="selectFirm">
                      <optgroup>
                        <#list firmList as firm>
                            <option value="${firm.gstNo}">${firm.firmName}</option>
                        </#list>
                       </optgroup>
                    </select>
                </td>
            </tr>
            </table>
        </div>
       <br /><br />
       <table>
       <tr>
           <td>  <font size="10">Select Buyer: </font> </td>
           <td>
               <select id="selectParty" name="selectParty">
                  <optgroup>
                   <option disabled selected value> -- Select Buyer -- </option>
                   <#list partyList as party>
                      <option value="${party.gstNo}">${party.name}</option>
                   </#list>
                  </optgroup>
               </select>
           </td>
       </tr>
       <tr/>
       <tr>
            <td> <font size="10">Select Item: </font> </td>
            <td>
                <select id="selectItem" >
                    <optgroup>
                    <option disabled selected value> -- Select Item -- </option>
                    <#list itemList as item>
                       <option value="${item.code}">${item.name}</option>
                    </#list>
                    </optgroup>
                </select>
            </td>
            <td> <font size="12"> Quantity: </font></td>
            <td> <input type="number" id="inputQuantity" min="1" max="9999999" /></td>
            <td> <button id="buttonAddItem"> Add Item </button>
       </tr>
       <tr>
          <table id="tableFinalItems" border="1" >
            <thead>
                <tr>
                     <th>Item</th> <th>Quantity</th> <th> </th>
                </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
       </tr>
       </table>
       <br />
              <button id="buttonGenerateInvoice"> Generate Invoice </button>
       <script src="/assets/js/jquery.min.js"></script>
       <script src="/assets/js/bootstrap.min.js"></script>
       <script src="/assets/js/jqueryui.js"></script>
       <script src="/assets/js/Item.js"></script>
       <script src="/assets/js/main.js"></script>
       <script>
           $("#buttonAddItem").click(function(){
                    var name = $("#selectItem").val();
                    var quantity = $("#inputQuantity").val();
                    if(name == null || name == ''){
                        alert("Error ! Hint: Please select an item"); return;
                    }
                    if(quantity == ''){
                       alert("Error ! Hint: Please enter quantity");  return;
                    }
                    var markup = "<tr><td>" + name + "</td><td>" + quantity + "</td>"+
                        "<th><input type=\"button\" value=\"Delete\" /></th></tr>";
                    $("#tableFinalItems tbody").append(markup);
           });

           $('#tableFinalItems').on('click', 'input[type="button"]', function () {
               $(this).closest('tr').remove();
           });
           $("#buttonGenerateInvoice").click(function(){
               alert($("#selectFirm").val());
               var entity = {"partyGstNo" : $("#selectParty").val(), "firmGstNo" : $("#selectFirm").val()};
               var itemList = $('table#tableFinalItems tbody tr').get().map(function(row) {
                 return $(row).find('td').get().map(function(cell) {

                   return $(cell).html();
                 });
               });
                entity["itemList"] = itemList;
                if(itemList.length == 0){
                    alert("Error ! Hint: Please select an item and enter its quantity"); return;
                }
                var str = JSON.stringify(entity);
                alert(str);
                $.ajax({
                   type: "POST",	url: "/invoice", dataType: "json",
                   contentType: "application/json; charset=utf-8",
                   data: str,
                   traditional: true,
                   success:function(response) {
                      if(response.success){
                          //alert(response.t);
                          window.open("/invoice?invoiceNumber="+response.t).reload();
                      }else{
                          alert(response.errorMsg);
                      }
                   },
                   error:function(response) {
                       alert(response.responseText);
                   }
                });
            });
       </script>
       <style>
       	    optgroup { font-size:16px; }
       	    select { height:30px; }
       	    input { height:30px; }

       </style>
    </body>
</html>