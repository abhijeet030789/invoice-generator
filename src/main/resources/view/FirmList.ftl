<html>
<head><title></title>
<body>
<a href="/" style="float: right;">Home</a>

<div id="content">
   <table border="1" >
        <tr>
            <th>GST No</th><th>Firm Name</th><th>Address</th><th>State</th><th>stateCode</th><th>Phone Number</th><th>Email</th><th>Bank Name</th>
            <th>AccountNumber</th><th>IFSC Code</th><th>Bank Branch</th>
            <th>Invoice Start Index</th> <th>Invoice Current Index</th>

              </tr>
        <#list entities as entity>
           <tr>
               <td><a href="/firm?id=${(entity.gstNo)!''}" >${(entity.gstNo)!""}</a></td>
                <td>${(entity.firmName)!""}</td>
                <td>${(entity.addressLineOne)!""}</td>
                <td>${(entity.state)!""}</td>
                <td>${(entity.stateCode)!""}</td>
                <td>${(entity.phoneNumber)!""}</td>
                <td>${(entity.emailId)!""}</td>
                <td>${(entity.bankName)!""}</td>
                <td>${(entity.accountNumber)!""}</td>
                <td>${(entity.ifscCode)!""}</td>
                <td>${(entity.bankBranch)!""}</td>
                <td>${(entity.invoiceStartIndex)!""} </td>
                <td>${(entity.invoiceCurrentIndex)!""} </td>
           </tr>
       </#list>
   </table>
   <p><a href="/firm?action=ADD"> ADD </a></p>
 </p>
</div>

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
