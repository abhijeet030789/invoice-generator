<html>
<head><title></title>
<link rel="stylesheet"	href="/assets/css/kendo.common.min.css" />
<link rel="stylesheet"	href="/assets/css/kendo.default.min.css" />
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/kendo.all.min.js"></script>
<script src="/assets/js/Transaction.js"></script>
</head>
<body>
<a href="/" style="float: right;">Home</a>

<div id="example" class="k-content">
        <div class="toolbar">
            <label for="firmName">Firm Name/GstNo:</label>   <input type="search" id="firmName" style="width: 230px"/>
            <label for="partyName">Party Name/GST-No:</label>   <input type="search" id="partyName" style="width: 230px"/>
            <input id="reset" type="button" value="Reset"/>
        </div>
    <div id="grid"></div>

</div>

<script>

    function duplicateInvoice(invoiceNumber){
        window.open("/invoice?invoiceNumber="+invoiceNumber).reload();
    }

    $(document).ready(function () {
        $.ajax({type: "GET", url: "/transaction/list/json",
                success:function(response) {
                    dataX = response;
                    var grid = $("#grid").kendoGrid({
                    dataSource: {
                        data : dataX,
                        pageSize: 10, serverPaging   : false, serverSorting  : false, serverFiltering: false
                    },
                    sortable  : true,  pageable  : true,
                    columns   : [
                        {field: "invoiceNo", title: "Invoice No",
                            template: '<a href="/transactiondetail/list/filter?invoiceNo=#=invoiceNo#">#=invoiceNo#</a>'},
                        {field: "firmGstNo",title: "Firm's GST No"},
                        {field: "firmName",title: "Firm's Name"},
                        {field: "partyGstNo",title: "Party's GST No"},
                        {field: "partyName",title: "Party's Name"},
                        {field: "totalAmount",title: "Total Amount"},
                        {field: "billingDate",title: "Billing Date",template: "#= kendo.toString(new Date(billingDate), 'yyyy-MM-dd HH:mm') #"},
                        {field: "invoiceNo",  title: "Duplicate",
                           template:'<input type="button" onclick="duplicateInvoice(&quot;#=invoiceNo#&quot;)" value="Duplicate Copy" />'
                        }
                    ]
                });

                $("#firmName").kendoAutoComplete({
                    dataTextField : "firmName",
                    dataValueField: "firmName",
                    dataSource    : new kendo.data.DataSource({data : dataX})
                });

                $("#firmName").keyup(function () {
                    var val = $('#firmName').val();
                    $("#grid").data("kendoGrid").dataSource.filter({
                        logic  : "or",
                        filters: [
                           {field : "firmGstNo", operator: "contains",value   : val},
                           {field : "firmName", operator: "contains",value   : val},
                        ]
                    });
                });

                $("#partyName").kendoAutoComplete({
                    dataTextField : "partyName",
                    dataValueField: "partyName",
                    dataSource    : new kendo.data.DataSource({data : dataX})
                });

                $("#partyName").keyup(function () {
                    var val = $('#partyName').val();
                    $("#grid").data("kendoGrid").dataSource.filter({
                        logic  : "or",
                        filters: [
                           {field : "partyGstNo", operator: "contains",value   : val},
                           {field : "partyName", operator: "contains",value   : val},
                        ]
                    });
                });

                $('#reset').click(function () {
                    $('#firmName').val('');
                    $('#partyName').val('');
                    $("#grid").data("kendoGrid").dataSource.filter([]);
                });

                },
                error:function(response) {alert(response.responseText);}
            });
    //change event

    });
</script>
</body>