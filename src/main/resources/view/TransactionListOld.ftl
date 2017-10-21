<html>
<head><title></title>
    <link href="http://cdn-na.infragistics.com/igniteui/2017.1/latest/css/themes/infragistics/infragistics.theme.css" rel="stylesheet" />
    <link href="http://cdn-na.infragistics.com/igniteui/2017.1/latest/css/structure/infragistics.css" rel="stylesheet" />


</head>
<body>
<div id="content" caption="Transactions">
        <div class=".ui-widget-overlay"></div>

   <div id="checkboxSelectPartyCombo"></div>
   <input type="button" value="Filter" onclick="filter()" />
   <table border="1" >
        <tr>
            <th>Invoice No</th><th>Firm's GST No</th><th>Firm Name</th><th>Party's GST No</th><th>Party Name</th><th> Total Amount </th>        </tr>
        <#list entities as entity>
           <tr>
               <td><a href="/transactiondetail/list/filter?invoiceNo=${(entity.invoiceNo)!''}" >${(entity.invoiceNo)!""}</a></td>
<td>${(entity.firmGstNo)!""}</td>
<td>${(entity.firmName)!""}</td>
<td>${(entity.partyGstNo)!""}</td>
<td>${(entity.partyName)!""}</td>
<td>${(entity.totalAmount)!""}</td>
<td><input type="button" onclick="duplicateInvoice('${entity.invoiceNo}')" value="Duplicate Copy" /> </td>
           </tr>
       </#list>
   </table>
   <p><a hidden href="/transaction?action=ADD"> ADD </a></p>
 </p>
</div>

    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/jqueryui.js"></script>
    <script src="/assets/js/Transaction.js"></script>
    <script src="/assets/js/main.js"></script>
      <script src="http://ajax.aspnetcdn.com/ajax/modernizr/modernizr-2.8.3.js"></script>
        <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
        <!-- Ignite UI Required Combined JavaScript Files -->
        <script src="http://cdn-na.infragistics.com/igniteui/2017.1/latest/js/infragistics.core.js"></script>
        <script src="http://cdn-na.infragistics.com/igniteui/2017.1/latest/js/infragistics.lob.js"></script>
    <script>

        var dom;
        $(function () {
            var colors= [
                    {"name": "a", "value": "A"},
                    {"name": "b", "value": "B"},
                    {"name": "c", "value": "C"},
                    {"name": "d", "value": "D"}
                ];
            dom = $("#checkboxSelectPartyCombo").igCombo({
                id: "xxx",
                width: 300,
                dataSource: colors,
                textKey: "name",
                valueKey: "value",
                multiSelection: {
                    enabled: true,
                    showCheckboxes: true
                },
                dropDownOrientation: "bottom"
            });
        });
        function filter(){
            var items = dom.igCombo("selectedItems");
            for(var i=0; i< items.length; i++){
                alert(items[i].data.value);
            }
        }
        function duplicateInvoice(invoiceNumber){
            window.open("/invoice?invoiceNumber="+invoiceNumber).reload();
        }
    </script>
    <style>
        tr:nth-child(even) {
            background-color: #e8ebed;
        }
    </style>
</body>
</html>
