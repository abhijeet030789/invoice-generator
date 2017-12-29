<html>
<head><title>Sri Ganeshaay Namah</title></head>
<body>
   <div width="100%" height="100%">
        <div class="container">
               <table width="100%">
                 <tr>
                   <td width="25%" valign="bottom">
                    <table align="left">
                        <tr><th align="left"><font size="2">Invoice No</font></th><th>:</th><th align="left"><font size="2">${invoiceNo}</font></th></tr>
                        <tr><th align="left"><font size="2">Billing Date</font></th><th>:</th><th align="left"><font size="2">${currentDate?date}</font></th></tr>
                    </table>
                   </td>
                   <td width="50%">
                    <table align="center">
                        <tr><td align="center">TAX INVOICE</td></tr>
                        <tr><td align="center"><font size="5"><strong>${firm.firmName}</strong></font></td></tr>
                        <tr><td align="center">${firm.addressLineOne!''}</td></tr>
                        <tr><td align="center">${firm.addressLineTwo!''}</td></tr>
                        <tr><td align="center">Phone: ${firm.phoneNumber!'N/A'}</td></tr>
                        <tr><td align="center">Email: ${firm.emailId!'N/A'}</td></tr>
                        <tr><td align="center"><strong>GSTIN: ${firm.gstNo!'Unregistered'}</strong></td></tr>
                    </table>
                   </td>
                   <td width="25%">
                    <table align="right">
                        <tr><td><input type="checkbox"/></td><td>Buyer's Copy</td></tr>
                        <tr><td><input type="checkbox"/></td><td>Transporter's Copy</td></tr>
                        <tr><td><input type="checkbox"/></td><td>Seller's Copy</td></tr>
                    </table>
                   </td>
                  </tr>
                </table>
        </div>

        <div height="15%">
            <table style="width: 100%;" border="1">
                <tbody>
                    <tr>
                        <th>Buyer</th><th>Shipped To</th>
                    </tr>
                    <tr>
                        <td style="width: 50%">
                            <table>
                                <tr><td>Name:</td><td>${party.name}</td></tr>
                                <tr><td>Address:</td><td>${party.address}</td></tr>
                                <tr><td>GSTIN:</td><td>${party.gstNo}</td></tr>
                                <tr><td border="1">State and State Code:</td><td>${party.state} (${party.stateCode})</td></tr>
                            </table>
                        </td>
                        <td style="width: 50%">
                            <table>
                                <tr><td>Name:</td><td>${party.name}</td></tr>
                                <tr><td>Address:</td><td>${party.address}</td></tr>
                                <tr><td>GSTIN:</td><td>${party.gstNo}</td></tr>
                                <tr><td border="1">State and State Code:</td><td>${party.state} (${party.stateCode})</td></tr>
                                <tr><td>Transporter:</td><td>${(party.transporter)!"N/A"}</td></tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div><br /></div>
        <div>
            <table style="width: 100%; height: 55%; text-align: center;" border="1">
                    <tr style="height: 5%;">
                        <th rowspan="2" style="width: 2%;">Sl. No1.</th>
                        <th rowspan="2" style="width: 10%;">Item</th>
                        <th rowspan="2"  style="width: 5%;">HSN Code</th>
                        <th rowspan="2" style="width: 10%">Unit</th>
                        <th rowspan="2" style="width: 5%">Quantity</th>
                        <th rowspan="2" style="width: 5%">Rate(per unit)</th>
                        <th rowspan="2" style="width: 5%">Total</th>
                        <th rowspan="2" style="width: 5%">Discount</th>
                        <th rowspan="2" style="width: 5%">Taxable Amount</th>
                        <#if firm.gst>
                            <#if party.stateCode == firm.stateCode>
                                <th style="width: 15%" colspan="2">CGST</th>
                                <th style="width: 15%;" colspan="2">SGST</th>
                            <#else>
                                <th style="width: 15%;" colspan="2">IGST</th>
                            </#if>
                        </#if>
                        <th rowspan="2" style="width: 10%;">Amount</th>
                    </tr>
                <tr style="height: 5%;">
                    <#if firm.gst>
                        <#if party.stateCode == firm.stateCode>
                            <td>Rate (%)</td><td>Amount</td>
                            <td>Rate (%)</td><td>Amount</td>
                        <#else>
                            <td>Rate (%)</td><td>Amount</td>
                        </#if>
                    </#if>
                </tr>

                <#list billedItems as bi>
                    <tr>
                        <td>${bi.slNo}</td>
                        <td>${bi.itemName}</td>
                        <td>${bi.hsnCode}</td>
                        <td>${bi.unit}</td>
                        <td>${bi.quantity?string(",##0.00")}</td>
                        <td>${bi.rate?string(",##0.00")}</td>
                        <td>${bi.total?string(",##0.00")}</td>
                        <td>${bi.discount?string(",##0.00")}</td>
                        <td>${bi.taxableAmount?string(",##0.00")}</td>
                        <#if firm.gst>
                            <#if party.stateCode == firm.stateCode>
                                <td>${bi.cgstRate?string(",##0.00")}</td>
                                <td>${bi.cgstAmount?string(",##0.00")}</td>
                                <td>${bi.sgstRate?string(",##0.00")}</td>
                                <td>${bi.sgstAmount?string(",##0.00")}</td>
                            <#else>
                                <td>${bi.igstRate?string(",##0.00")}</td>
                                <td>${bi.igstAmount?string(",##0.00")}</td>
                            </#if>
                        </#if>
                        <td>${bi.amount?string(",##0.00")}</td>
                    </tr>
                </#list>

                <tr style="height: 5%;">
                    <#if firm.gst>
                        <#if party.stateCode == firm.stateCode>
                            <th  colspan="9">Total</th>
                            <td colspan="2" align="right">${totalCgst?string(",##0.00")}</td>
                            <td colspan="2" align="right">${totalSgst?string(",##0.00")}</td>
                            <td>${total?string(",##0.00")}</td>
                        <#else>
                            <th  colspan="9">Total</th>
                            <td colspan="2" align="right">${totalIgst?string(",##0.00")}</td>
                            <td>${total?string(",##0.00")}</td>
                        </#if>
                    <#else>
                            <th  colspan="5">Total</th><td colspan="5">${total?string(",##0.00")}</td>
                    </#if>
                </tr>
                <tr style="height: 5%;">
                    <#if firm.gst>
                        <#if party.stateCode == firm.stateCode>
                            <th  colspan="5">Invoice Amount</th><th colspan="9"  align="right">${roundedTotal?string(",##0.00")}</th>
                        <#else>
                            <th  colspan="5">Invoice Amount</th><th colspan="7" align="right">${roundedTotal?string(",##0.00")}</th>
                        </#if>
                    <#else>
                            <th  colspan="4">Invoice Amount</th><th colspan="6" align="right">${roundedTotal?string(",##0.00")}</th>
                    </#if>
                </tr>
                <tr style="height: 5%;">
                    <#if firm.gst>
                        <#if party.stateCode == firm.stateCode>
                            <th colspan="5">Invoice Amount in Words</th><th colspan="9" align="right">${amountInWords}</th>
                        <#else>
                            <th colspan="5">Invoice Amount in Words</th><th colspan="7" align="right">${amountInWords}</th>
                        </#if>
                    <#else>
                            <th colspan="4">Invoice Amount in Words</th><th colspan="6" align="right">${amountInWords}</th>
                    </#if>
                </tr>
            </table>
        </div>
        <div><br /></div>
        <div id="container">
          <div id="left">
            <table caption="Bank Details" height="7%">
                <!--<tr><th align="left">Name</th><td>${firm.firmName}</td></tr>-->
                <tr><th align="left">Bank Name</th><td>${firm.bankName}</td></tr>
                <tr><th align="left">A/c No</th><td>${firm.accountNumber}</td></tr>
                <tr><th align="left">Branch</th><td>${firm.bankBranch} (IFSC Code: ${firm.ifscCode})</td></tr>
                <tr width="100%"><td  colspan="2"><hr></td></tr>
                <tr><td colspan="2">
                    <ul>
                      <li>Subject to Kolkata Juridiction</li>
                      <li>Please pay by NEFT, RTGS or A/c Payee cheque only</li>
                    </ul>
                </td></tr>
            </table>
          </div>
          <div id="center"></div>
          <div id="right">
            <br /><br /><br /><br /><br />
            <hr align="right">
            <p align="center"><strong>${firm.firmName}</strong></p>
          </div>
        </div>
   </div>
<style>
#container {
    width:100%;
    text-align:center;
}
#left {
    float:left;
    width:50%
}

#center {
    display: inline-block;
    margin:0 auto;
    width:20%;
}

#right {
    float:right;
    width:30%;
}

@media print {

  html, body {
    height:100%;
    margin: 0 !important;
    padding: 0 !important;
    overflow: hidden;
  }

}



</style>
</body>
</html>