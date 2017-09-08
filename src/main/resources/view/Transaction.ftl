<html>
<head><title></title>
<body>
    <table>
         <tr><td><b>invoiceNo</b></td> <td><input type="text" id="invoiceNo" value="${(entity.invoiceNo)!''}"></td></tr>
         <tr><td><b>firmGstNo</b></td> <td><input type="text" id="firmGstNo" value="${(entity.firmGstNo)!''}"></td></tr>
         <tr><td><b>firmName</b></td> <td><input type="text" id="firmName" value="${(entity.firmName)!''}"></td></tr>
         <tr><td><b>partyGstNo</b></td> <td><input type="text" id="partyGstNo" value="${(entity.partyGstNo)!''}"></td></tr>
         <tr><td><b>partyName</b></td> <td><input type="text" id="partyName" value="${(entity.partyName)!''}"></td></tr>
         <tr><td><b>totalAmount</b></td> <td><input type="text" id="totalAmount" value="${(entity.totalAmount)!''}"></td></tr>
    </table>
    <p>
        <#if editMode >
            <button hidden id="buttonEditEntity">EDIT</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <button hidden id="buttonDeleteEntity">DELETE</button>
        <#else>
            <button hidden id="buttonAddEntity">ADD</button>
        </#if>
    </p>
    <br>
    <br>

    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/jqueryui.js"></script>
    <script src="/assets/js/Transaction.js"></script>
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
