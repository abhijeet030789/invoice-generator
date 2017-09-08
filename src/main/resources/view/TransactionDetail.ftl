<html>
<head><title></title>
<body>
    <table>
         <tr><td><b>id</b></td> <td><input type="text" id="id" value="${(entity.id)!''}"></td></tr>
         <tr><td><b>invoiceNo</b></td> <td><input type="text" id="invoiceNo" value="${(entity.invoiceNo)!''}"></td></tr>
         <tr><td><b>slNo</b></td> <td><input type="text" id="slNo" value="${(entity.slNo)!''}"></td></tr>
         <tr><td><b>itemName</b></td> <td><input type="text" id="itemName" value="${(entity.itemName)!''}"></td></tr>
         <tr><td><b>hsnCode</b></td> <td><input type="text" id="hsnCode" value="${(entity.hsnCode)!''}"></td></tr>
         <tr><td><b>unit</b></td> <td><input type="text" id="unit" value="${(entity.unit)!''}"></td></tr>
         <tr><td><b>quantity</b></td> <td><input type="text" id="quantity" value="${(entity.quantity)!''}"></td></tr>
         <tr><td><b>rate</b></td> <td><input type="text" id="rate" value="${(entity.rate)!''}"></td></tr>
         <tr><td><b>total</b></td> <td><input type="text" id="total" value="${(entity.total)!''}"></td></tr>
         <tr><td><b>discount</b></td> <td><input type="text" id="discount" value="${(entity.discount)!''}"></td></tr>
         <tr><td><b>taxableAmount</b></td> <td><input type="text" id="taxableAmount" value="${(entity.taxableAmount)!''}"></td></tr>
         <tr><td><b>cgstRate</b></td> <td><input type="text" id="cgstRate" value="${(entity.cgstRate)!''}"></td></tr>
         <tr><td><b>cgstAmount</b></td> <td><input type="text" id="cgstAmount" value="${(entity.cgstAmount)!''}"></td></tr>
         <tr><td><b>sgstRate</b></td> <td><input type="text" id="sgstRate" value="${(entity.sgstRate)!''}"></td></tr>
         <tr><td><b>sgstAmount</b></td> <td><input type="text" id="sgstAmount" value="${(entity.sgstAmount)!''}"></td></tr>
         <tr><td><b>igstRate</b></td> <td><input type="text" id="igstRate" value="${(entity.igstRate)!''}"></td></tr>
         <tr><td><b>igstAmount</b></td> <td><input type="text" id="igstAmount" value="${(entity.igstAmount)!''}"></td></tr>
         <tr><td><b>amount</b></td> <td><input type="text" id="amount" value="${(entity.amount)!''}"></td></tr>
    </table>
    <p>
        <#if editMode >
            <button hidden id="buttonEditEntity">EDIT</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <button hideen id="buttonDeleteEntity">DELETE</button>
        <#else>
            <button hidden id="buttonAddEntity">ADD</button>
        </#if>
    </p>
    <br>
    <br>

    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/jqueryui.js"></script>
    <script src="/assets/js/TransactionDetail.js"></script>
    <script src="/assets/js/main.js"></script>

    <style>
        tr:nth-child(even) {
            background-color: #e8ebed;
        }
    </style>
</body>
</html>
</body>
</html>
