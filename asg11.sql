Create view InvoiceBasic
as
select vendorname, invoicenumber, invoicetotal
From vendors as v join invoices as i on v. vendorid=i.vendorid;

select * 
from InvoiceBasic
where vendorname like '[N-P]%'
order by vendorname;

create view Top10PaidInvoices
as 
select top 10 vendorname, max(invoicedate) as lastinvoice, sum(invoicetotal) as sumofinvoices
From vendors as v join invoices as i on v. vendorid=i.vendorid
where invoicetotal - PaymentTotal - CreditTotal = 0
group by VendorName;

select * from Top10PaidInvoices;

3. Skip

select * from  sys.foreign_keys;trailer

create proc spInvoiceReport
as
select vendorname, invoicenumber, invoicetotal
From vendors as v join invoices as i on v. vendorid=i.vendorid
where invoicetotal - PaymentTotal - CreditTotal > 0
order by VendorName

exec spInvoiceReport;

create proc spCopyInvoices
as
if object_id('InvoiceCopy') is not null
drop table invoicecopy
select * 
into InvoiceCopy
from invoices

exec spCopyInvoices;

CREATE TABLE ShippingLabels

(VendorName       varchar(50),

 VendorAddress1   varchar(50),

 VendorAddress2   varchar(50),

 VendorCity       varchar(50),

 VendorState      char(2),

 VendorZipCode    varchar(20))

 create trigger trPaidInvoiceLabels
 on invoices after insert, update
 as 
 insert into ShippingLabels
 select vendorname, vendoraddress1, vendoraddress1, vendorcity, vendorstate, vendorzipcode
 from vendors join inserted
 on vendors.vendorid = (select VendorID from inserted)
 where InvoiceTotal - PaymentTotal - CreditTotal = 0;

 UPDATE Invoices

SET PaymentTotal = 67.92, PaymentDate = '2008-08-23'

WHERE InvoiceID = 100;

alter table vendors_copy
add YTDPurchases money default 0 not null;

create trigger trYTDPurchases
on invoices after insert
as 
update vendors_copy
set YTDPurchases = YTDPurchases + (select invoicetotal from inserted)
where vendorid in (select vendorid from inserted)


insert into invoices 
values(123, 'lakdjfa', getDate(), 10000, 0,0,1,getDate()+30, null)

select * from vendors_copy