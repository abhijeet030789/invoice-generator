<html>
<head><title>Sri Ganeshay Namah</title></head>
<body>
   <div width="100%">
    <div class="container">
           <table width="100%">
             <tr>
               <td width="25%">
                <table align="left">
                    <tr><th>Invoice No:</th><th>${invoiceNo}</th></tr>
                    <tr><th>Billing Date:</th><th>${currentDate?date}</th></tr>
                </table>
               </td>
               <td width="50%">
                <table align="center">
                    <tr><td align="center">TAX INVOICE</td></tr>
                    <tr><td align="center"><strong>${firm.firmName}</strong></td></tr>
                    <tr><td align="center">${firm.addressLineOne!''}</td></tr>
                    <tr><td align="center">${firm.addressLineTwo!''}</td></tr>
                    <tr><td align="center">Phone: ${firm.phoneNumber!'N/A'}</td></tr>
                    <tr><td align="center">Email: ${firm.emailId!'N/A'}</td></tr>
                    <tr><td align="center"><strong>GSTIN: ${firm.gstNo!'Unregistered'}</strong></td></tr>
                </table>
               </td>
               <td width="25%">
                <table align="right">
                    <tr><td><input type="checkbox"/> </td><td>Buyer's Copy</td></tr>
                    <tr><td><input type="checkbox"/> </td><td>Transporter's Copy</td></tr>
                    <tr><td><input type="checkbox"/> </td><td>Seller's Copy</td></tr>
                </table>
               </td>
              </tr>
            </table>
    </div>

<div>
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
                        <tr><td border="1">State and State Code:</td><td>${party.state}</td>  <td>| ${party.stateCode} |</td></tr>
			        </table>
			    </td>
			    <td style="width: 50%">
			        <table>
                        <tr><td>Name:</td><td>${party.name}</td></tr>
                        <tr><td>Address:</td><td>${party.address}</td></tr>
                        <tr><td>GSTIN:</td><td>${party.gstNo}</td></tr>
                        <tr><td>State and State Code:</td><td>${party.state}</td>  <td>| ${party.stateCode} |</td></tr>
                    </table>
			    </td>
			</tr>
		</tbody>
	</table>
</div>
<div><br /></div>
<div>
    <table style="width: 100%; height: 50%; text-align: center;" border="1">
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

                <#if party.stateCode == firm.stateCode>
                    <th style="width: 15%" colspan="2">CGST</th>
                    <th style="width: 15%;" colspan="2">SGST</th>
                <#else>
                    <th style="width: 15%;" colspan="2">IGST</th>
                </#if>
                <th rowspan="2" style="width: 10%;">Amount</th>
            </tr>
        <tr style="height: 5%;">
            <#if party.stateCode == firm.stateCode>
                <td>Rate (%)</td><td>Amount</td>
                <td>Rate (%)</td><td>Amount</td>
            <#else>
                <td>Rate (%)</td><td>Amount</td>
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
                <#if party.stateCode == firm.stateCode>
                    <td>${bi.cgstRate?string(",##0.00")}</td>
                    <td>${bi.cgstAmount?string(",##0.00")}</td>
                    <td>${bi.sgstRate?string(",##0.00")}</td>
                    <td>${bi.sgstAmount?string(",##0.00")}</td>
                <#else>
                    <td>${bi.igstRate?string(",##0.00")}</td>
                    <td>${bi.igstAmount?string(",##0.00")}</td>
                </#if>
                <td>${bi.amount?string(",##0.00")}</td>
            </tr>
        </#list>

        <tr style="height: 5%;">
            <#if party.stateCode == firm.stateCode>
                <th  colspan="9">Invoice Amount</th><th colspan="5">${total?string(",##0.00")}</th>
            <#else>
                <th  colspan="9">Invoice Amount</th><th colspan="3">${total?string(",##0.00")}</th>
            </#if>
        </tr>
        <tr style="height: 5%;">
            <#if party.stateCode == firm.stateCode>
                <th colspan="9">Invoice Amount in Words</th><th colspan="5">${amountInWords}</th>
            <#else>
                <th colspan="9">Invoice Amount in Words</th><th colspan="3">${amountInWords}</th>
            </#if>
        </tr>
        <tr style="height: 5%;">
            <#if party.stateCode == firm.stateCode>
                <th colspan="9">GST Reverse Charges</th><th colspan="2"></th><th colspan="2"></th><th></th>
            <#else>
                <th colspan="9">GST Reverse Charges</th><th colspan="2"></th><th></th>
            </#if>
        </tr>
    </table>
</div>
<div><br /></div>
<div>
    <table caption="Bank Details">
        <tr><th align="left">Name</th><td>${firm.firmName}</td></tr>
        <tr><th align="left">Bank Name</th><td>${firm.bankName}</td></tr>
        <tr><th align="left">A/c No</th><td>${firm.accountNumber}</td></tr>
        <tr><th align="left">Branch</th><td>${firm.bankBranch}</td> <th align="left">IFSC Code:</th><td>${firm.ifscCode}</td></tr>
    </table>
</div>
</div>
<style>
@page {
   size: 9in 11.25in;
}
</style>
</body>
</html>