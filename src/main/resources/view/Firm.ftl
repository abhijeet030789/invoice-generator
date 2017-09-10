<html>
<head><title></title>
<body>
    <table>
         <tr><td><b>GST No</b></td> <td><input type="text" id="gstNo" value="${(entity.gstNo)!''}"></td></tr>
         <tr><td><b>Firm Name</b></td> <td><input type="text" id="firmName" value="${(entity.firmName)!''}"></td></tr>
         <tr><td><b>Address</b></td> <td><input type="text" id="addressLineOne" value="${(entity.addressLineOne)!''}"></td></tr>
         <tr><td><b>State</b></td> <td><input type="text" id="state" value="${(entity.state)!''}"></td></tr>
         <tr><td><b>State Code</b></td> <td><input type="text" id="stateCode" value="${(entity.stateCode)!''}"></td></tr>
         <tr><td><b>Phone Number</b></td> <td><input type="text" id="phoneNumber" value="${(entity.phoneNumber)!''}"></td></tr>
         <tr><td><b>Email</b></td> <td><input type="text" id="emailId" value="${(entity.emailId)!''}"></td></tr>
         <tr><td><b>Bank Name</b></td> <td><input type="text" id="bankName" value="${(entity.bankName)!''}"></td></tr>
         <tr><td><b>Account Number</b></td> <td><input type="text" id="accountNumber" value="${(entity.accountNumber)!''}"></td></tr>
         <tr><td><b>IFSC Code</b></td> <td><input type="text" id="ifscCode" value="${(entity.ifscCode)!''}"></td></tr>
         <tr><td><b>Bank Branch</b></td> <td><input type="text" id="bankBranch" value="${(entity.bankBranch)!''}"></td></tr>
         <tr><td> GST Enabled </td><td><input id="gstEnabled" type="text" maxlength="1" value="Y" /></td></tr>
         <tr><td><b>Invoice Prefix</b></td> <td><input type="text" maxlength="4" id="invoicePrefix" value="${(entity.invoicePrefix)!''}"></td></tr>
         <tr><td><b>Invoice Start Index</b></td> <td><input type="number" min="1" id="invoiceStartIndex" value="${(entity.invoiceStartIndex)!''}"></td></tr>
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
    <script src="/assets/js/Firm.js"></script>
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
