<html>
<head><title></title>
<body>
    <table>
         <tr><td><b>Code</b></td> <td><input type="text" id="code" value="${(entity.code)!''}"></td></tr>
         <tr><td><b>Name</b></td> <td><input type="text" id="name" value="${(entity.name)!''}"></td></tr>
         <tr><td><b>HSN Code</b></td> <td><input type="text" id="hsnCode" value="${(entity.hsnCode)!''}"></td></tr>
         <tr><td><b>Unit</b></td> <td><input type="text" id="unit" value="${(entity.unit)!''}"></td></tr>
         <tr><td><b>Rate(per unit)</b></td> <td><input type="text" id="rate" value="${(entity.rate)!''}"></td></tr>
         <tr><td><b>GST Rate(%)</b></td> <td><input type="text" id="gstRate" value="${(entity.gstRate)!''}"></td></tr>
    </table>
    <p>
        <#if editMode >
            <button id="buttonEditEntity">EDIT</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <button id="buttonDeleteEntity">DELETE</button>
        <#else>
            <button id="buttonAddEntity">ADD</button>
        </#if>
    </p>
    <br>
    <br>

    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/jqueryui.js"></script>
    <script src="/assets/js/Item.js"></script>
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
