<html>
<head><title></title>
<body>
<div id="content">
   <table border="1" >
        <tr>
            <th>gstNo</th><th>name</th><th>address</th><th>state</th><th>stateCode</th><th>phoneNumber</th><th>email</th>        </tr>
        <#list entities as entity>
           <tr>
               <td><a href="/party?id=${(entity.gstNo)!''}" >${(entity.gstNo)!""}</a></td>
<td>${(entity.name)!""}</td>
<td>${(entity.address)!""}</td>
<td>${(entity.state)!""}</td>
<td>${(entity.stateCode)!""}</td>
<td>${(entity.phoneNumber)!""}</td>
<td>${(entity.email)!""}</td>
           </tr>
       </#list>
   </table>
   <p><a href="/party?action=ADD"> ADD </a></p>
 </p>
</div>

    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/jqueryui.js"></script>
    <script src="/assets/js/Party.js"></script>
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
