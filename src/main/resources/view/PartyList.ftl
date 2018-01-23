<html>
<head><title></title>
<body>
<a href="/" style="float: right;">Home</a>

<div id="content">
   <table border="1" >
        <tr>
            <th>Gst No</th><th>Name</th><th>Address</th><th>State</th><th>StateCode</th><th>PhoneNumber</th><th>Email</th><th>Transporter</th>        </tr>
        <#list entities as entity>
           <tr>
               <td><a href="/party?id=${(entity.gstNo)!''}" >${(entity.gstNo)!""}</a></td>
                <td>${(entity.name)!""}</td>
                <td>${(entity.address)!""}</td>
                <td>${(entity.state)!""}</td>
                <td>${(entity.stateCode)!""}</td>
                <td>${(entity.phoneNumber)!""}</td>
                <td>${(entity.email)!""}</td>
                <td>${(entity.transporter)!""}</td>
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
