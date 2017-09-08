<html>
<head><title></title>
<body>
<div id="content">
   <table border="1">
        <tr>
            <th hidden>id</th><th>Invoice No</th>
            <th>SlNo</th><th>Item Name</th><th>hsnCode</th><th>Unit</th><th>Quantity</th><th>Rate</th><th>total</th><th>Discount</th>
            <th>TaxableAmount</th><th>C-GST Rate</th><th>C-GST Amount</th><th>S-GST Rate</th><th>S-GST Amount</th><th>I-GST Rate</th><th>I-GST Amount</th><th>Total Amount</th></tr>
        <#list entities as entity>
           <tr>
               <td hidden><a href="/transactiondetail?id=${(entity.id)!''}" >${(entity.id)!""}</a></td>
<td>${(entity.invoiceNo)!""}</td>
<td>${(entity.slNo)!""}</td>
<td>${(entity.itemName)!""}</td>
<td>${(entity.hsnCode)!""}</td>
<td>${(entity.unit)!""}</td>
<td>${(entity.quantity)!""}</td>
<td>${(entity.rate)!""}</td>
<td>${(entity.total)!""}</td>
<td>${(entity.discount)!""}</td>
<td>${(entity.taxableAmount)!""}</td>
<td>${(entity.cgstRate)!""}</td>
<td>${(entity.cgstAmount)!""}</td>
<td>${(entity.sgstRate)!""}</td>
<td>${(entity.sgstAmount)!""}</td>
<td>${(entity.igstRate)!""}</td>
<td>${(entity.igstAmount)!""}</td>
<td>${(entity.amount)!""}</td>
           </tr>
       </#list>
   </table>
   <p><a hidden href="/transactiondetail?action=ADD"> ADD </a></p>
 </p>
</div>

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
