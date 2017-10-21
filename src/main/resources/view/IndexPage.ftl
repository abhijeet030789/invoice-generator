<html>
    <head>
        <title>Invoice Generator</title>
    </head>
    <body>
        <table width="50%">
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
       <br />
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
               <a href="/party?action=ADD"> ADD </a>
           </td>
       </tr>
       <tr/>
       <tr>
            <td> <font size="10">Select Item:</font> </td>
            <td>
                <select id="selectItem" onchange="itemSelectPost();">
                    <optgroup>
                    <option disabled selected value> -- Select Item -- </option>
                    <#list itemList as item>
                       <option value="${item.code}">${item.name}</option>
                    </#list>
                    </optgroup>
                </select>
            </td>
            <td> <font size="12"> Quantity:</font></td> <td> <input type="number" id="inputQuantity" min="1" max="9999999" /></td>
            <td> <font size="12"> Rate:</font></td>   <td> <input type="number" id="inputRate" min="1" max="9999999" /></td>
            <td> <input hidden  type="number" id="actualRate" min="1" max="9999999" /></td>
            <td> <button id="buttonAddItem"> Add Item </button></td>
       </tr>
       <tr>
          <table id="tableFinalItems" border="1" >
            <thead>
                <tr>
                     <th>Item</th> <th>Predefined Rate</th> <th>Proposed Rate</th> <th>Quantity</th> <th> </th>
                </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
       </tr>
       </table>
       <br /> <br />
       <input type="radio" name="payment" value="cash" checked /> Cash  <input type="radio" name="payment" value="credit" /> Credit
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
                        alert("[ERROR] Hint: Please select an item"); return;
                    }
                    if(quantity == ''){
                       alert("[ERROR] Hint: Please enter quantity");  return;
                    }
                    var markup = "<tr><td>" + name + "</td><td>" + $("#actualRate").val() + "</td><td>"+ $("#inputRate").val() + "</td><td>"+ quantity + "</td>"+  "<th><input type=\"button\" value=\"Delete\" /></th></tr>";
                    $("#tableFinalItems tbody").append(markup);
           });

           $('#tableFinalItems').on('click', 'input[type="button"]', function () {
               $(this).closest('tr').remove();
           });
           $("#buttonGenerateInvoice").click(function(){
                var partyGstNo = $("#selectParty").val();
               var payment = $("input[type='radio'][name='payment']:checked").val();
               var isCash = payment == 'cash' ? true : false;
               if(null == partyGstNo || '' == partyGstNo){
                     alert("[ERROR] Hint: Please select an buyer."); return;
               }
               var entity = {"partyGstNo" : partyGstNo, "firmGstNo" : $("#selectFirm").val(), "cash" : isCash};
               var itemList = $('table#tableFinalItems tbody tr').get().map(function(row) {
                 return $(row).find('td').get().map(function(cell) {
                   return $(cell).html();
                 });
               });
                entity["itemList"] = itemList;
                if(itemList.length == 0){
                    alert("[ERROR] Hint: Please select an item and enter its quantity, then press 'Add Item' button."); return;
                }
                var str = JSON.stringify(entity);
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
            function itemSelectPost(){
                var url = getUrl() + "/json?id=" + $("#selectItem").val();
                $.ajax({type: "GET", url: url,
                        success:function(response) {
                           if(response.success){
                                $("#inputRate").val(response.t.rate);  $("#actualRate").val(response.t.rate);
                           }else{alert(response.errorMsg);}
                        },
                        error:function(response) {alert(response.responseText);}
                    });
            }
       </script>
       <style>
       	    optgroup { font-size:16px; }
       	    select { height:30px; }
       	    input { height:30px; }
       	    button {
       	        height:25px;
                border: solid 1px #4b2a55;
             }
            button1 {
                   	        height:25px;
                            background: #5f396a;
                            background: -webkit-gradient(linear, 0 0, 0 bottom, from(#5f396a), to(#be95b7));
                            background: -moz-linear-gradient(#5f396a, #be95b7);
                            background: linear-gradient(#5f396a, #be95b7);
                            border: solid 1px #4b2a55;
                            box-shadow: inset 0 10px 15px 0 #4d2955;
                         }

       </style>
    </body>
</html>