--DELETE from Firm;
 --where gstNo in ('F2', 'F3', 'F4');

--INSERT INTO Firm (gstNo, firmName, addressLineOne, state, stateCode, phoneNumber, emailId, bankName, accountNumber, ifscCode, bankBranch, gstEnabled, invoicePrefix, invoiceStartIndex, invoiceCurrentIndex) VALUES('F2', 'Firm2', 'Firm2-Address', 'West Bengal', '19', '88888', 'F1@F1.com', 'AXIS BANK', '12456789F2', 'UTI116549F2', 'Burrabazar', 'Y', 'F222', 1, 1);
--INSERT INTO Firm (gstNo, firmName, addressLineOne, state, stateCode, phoneNumber, emailId, bankName, accountNumber, ifscCode, bankBranch, gstEnabled, invoicePrefix, invoiceStartIndex, invoiceCurrentIndex)  VALUES('F3', 'Firm3', 'Firm3-Address', 'West Bengal', '19', '88888', 'F1@F1.com', 'AXIS BANK', '12456789F3', 'UTI116549F3', 'Burrabazar', 'Y', 'F333', 100, 99);
--INSERT INTO Firm (gstNo, firmName, addressLineOne, state, stateCode, phoneNumber, emailId, bankName, accountNumber, ifscCode, bankBranch, gstEnabled, invoicePrefix, invoiceStartIndex, invoiceCurrentIndex)  VALUES('F4', 'Firm4', 'Firm4-Address', 'Karnataka', '25', '88888', 'F1@F1.com', 'AXIS BANK', '12456789F4', 'UTI116549F4', 'Burrabazar', 'Y', 'F444', 2000, 1999);
--INSERT INTO Firm (gstNo, firmName, addressLineOne, state, stateCode, phoneNumber, emailId, bankName, accountNumber, ifscCode, bankBranch, gstEnabled, invoicePrefix, invoiceStartIndex, invoiceCurrentIndex)  VALUES('Jaali', 'Jaali', 'Jali-Address', 'West Bengal', '19', '88888', 'Jaali@F1.com', 'AXIS BANK', '12456789F4', 'UTI116549F4', 'Burrabazar', 'N', 'JAAL', 1, 0);

--delete from Transaction;
--delete from TRANSACTIONDETAIL;

--DELETE from Party where gstNo in ('P2', 'P3', 'P4', 'P5', 'P6');

--INSERT INTO Party (gstNo, name, address, state, stateCode, phoneNumber, email) VALUES('P2', 'P2-Name', 'P2-Address', 'West Bengal', '19', '7897889', 'abcd@a.com');
--INSERT INTO Party (gstNo, name, address, state, stateCode, phoneNumber, email) VALUES('P3', 'P3-Name', 'P3-Address', 'West Bengal', '19', '7897889', 'abcd@a.com');
--INSERT INTO Party (gstNo, name, address, state, stateCode, phoneNumber, email) VALUES('P4', 'P4-Name', 'P4-Address', 'West Bengal', '19', '7897889', 'abcd@a.com');
--INSERT INTO Party (gstNo, name, address, state, stateCode, phoneNumber, email) VALUES('P5', 'P5-Name', 'P5-Address', 'West Bengal', '19', '7897889', 'abcd@a.com');
--INSERT INTO Party (gstNo, name, address, state, stateCode, phoneNumber, email) VALUES('P6', 'P6-Name', 'P6-Address', 'Karnataka', '25', '7897889', 'abcd@a.com');

DELETE FROM ITEM WHERE code in ('I1', 'I2', 'I3', 'I4', 'I5', 'I6');

INSERT INTO Item (code, name, hsnCode, unit, rate, gstRate) VALUES('I1', 'I1-Name', 'I1-hsnCode', '30 Kg Bag', '10.0', '5.0');
INSERT INTO Item (code, name, hsnCode, unit, rate, gstRate) VALUES('I2', 'I2-Name', 'I2-hsnCode', '30 Kg Bag', '20.0', '5.0');
INSERT INTO Item (code, name, hsnCode, unit, rate, gstRate) VALUES('I3', 'I3-Name', 'I3-hsnCode', '30 Kg Bag', '30.0', '5.0');
INSERT INTO Item (code, name, hsnCode, unit, rate, gstRate) VALUES('I4', 'I4-Name', 'I4-hsnCode', '30 Kg Bag', '40.0', '5.0');
INSERT INTO Item (code, name, hsnCode, unit, rate, gstRate) VALUES('I5', 'I5-Name', 'I5-hsnCode', '30 Kg Bag', '50.0', '5.0');
INSERT INTO Item (code, name, hsnCode, unit, rate, gstRate) VALUES('I6', 'I6-Name', 'I6-hsnCode', '30 Kg Bag', '60.0', '5.0');

commit;
