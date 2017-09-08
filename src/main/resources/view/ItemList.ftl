<html>
<head><title></title>
<body>
<div id="content">
   <table border="1" caption="Items/Goods">
        <tr>
            <th>Code</th><th>Name</th><th>HSN Code</th><th>Unit</th><th>Rate(per unit)</th><th>GST Rate(%)</th>        </tr>
        <#list entities as entity>
           <tr>
               <td><a href="/item?id=${(entity.code)!''}" >${(entity.code)!""}</a></td>
<td>${(entity.name)!""}</td>
<td>${(entity.hsnCode)!""}</td>
<td>${(entity.unit)!""}</td>
<td>${(entity.rate)!""}</td>
<td>${(entity.gstRate)!""}</td>
           </tr>
       </#list>
   </table>
   <p><a href="/item?action=ADD"> ADD </a></p>
 </p>
</div>

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
