<html>
<head><title></title>
<body>
    <table>
         <tr><td><b>gstNo</b></td> <td><input type="text" id="gstNo" value="${(entity.gstNo)!''}"></td></tr>
         <tr><td><b>name</b></td> <td><input type="text" id="name" value="${(entity.name)!''}"></td></tr>
         <tr><td><b>address</b></td> <td><input type="text" id="address" value="${(entity.address)!''}"></td></tr>
         <tr><td><b>state</b></td> <td><input type="text" id="state" value="${(entity.state)!''}"></td></tr>
         <tr><td><b>stateCode</b></td> <td><input type="text" id="stateCode" value="${(entity.stateCode)!''}"></td></tr>
         <tr><td><b>phoneNumber</b></td> <td><input type="text" id="phoneNumber" value="${(entity.phoneNumber)!''}"></td></tr>
         <tr><td><b>email</b></td> <td><input type="text" id="email" value="${(entity.email)!''}"></td></tr>
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
