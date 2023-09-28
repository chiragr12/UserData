select il.line as pos, il.qtyinvoiced, p.value as productnumber, p.name as product, il.priceactual, il.linenetamt, cur.iso_code as currency
from adempiere.c_invoiceline il 
join adempiere.c_invoice i on i.c_invoice_id=il.c_invoice_id
join adempiere.m_product p on p.m_product_id=il.m_product_id
join adempiere.c_currency cur on cur.c_currency_id=i.c_currency_id


$F{product} +  " ProdNo. " + $F{productnumber}
$F{currency} +  " "  +$F{priceactual}
$F{currency} +  " "  + $F{linenetamt}


select i.documentno, i.dateinvoiced, b.name as bpname, b.value as bpvalue, loc.address1, loc.postal,loc.city, c.name as country, i.totallines, i.grandtotal, coalesce(it.taxamt,0) as taxamt, coalesce(t.rate,0) as taxrate, t.name as txtname, orginfo.phone, orginfo.fax, orginfo.email, orgloc.address1 as orgaddress, orgloc.city as orgcity, orgloc.postal as orgpostal, org.name as orgname, img.binarydata as orglogo, cur.iso_code as currency
from adempiere.c_invoice i
join adempiere.c_bpartner b on b.c_bpartner_id=i.c_bpartner_id
join adempiere.c_bpartner_location bploc on bploc.c_bpartner_location_id=i.c_bpartner_location_id
join adempiere.c_location loc on loc.c_location_id=bploc.c_location_id
join adempiere.c_country c on c.c_country_id=loc.c_country_id
left join adempiere.c_invoicetax it on it.c_invoice_id=i.c_invoice_id
left join adempiere.c_tax t on t.c_tax_id=it.c_tax_id
join adempiere.ad_orginfo orginfo on orginfo.ad_org_id=i.ad_org_id
join adempiere.c_location orgloc on orgloc.c_location_id=orginfo.c_location_id
join adempiere.ad_org org on org.ad_org_id=i.ad_org_id
left join adempiere.ad_image img on img.ad_image_id=orginfo.logo_id
join adempiere.c_currency cur on cur.c_currency_id=i.c_currency_id
where i.c_invoice_id=103





/home/chirag/JaspersoftWorkspace/MyReports/invoices.jasper

Sql Query:- ALTER TABLE [table name] ADD DEFAULT [DEFAULT VALUE] FOR [NAME OF COLUMN]
PGSql Query :- ALTER TABLE adempiere.c_chirag ALTER COLUMN chairperson SET DEFAULT 'Chirag Rathi';

=======================================================================================================================================
warehouse all product quantity:-
select sum(qtyonhand) from adempiere.m_warehouse a 
left outer join adempiere.m_storageonhand b on a.ad_org_id = b.ad_org_id
where a.name='Main Warehouse';

Column Data type change:-
ALTER TABLE adempiere.rok_war_machine 
ALTER COLUMN rok_war_machine_id TYPE INT
USING rok_war_machine_id::integer;

record remove on the table:-
DELETE FROM adempiere.ad_role
WHERE ad_client_id = 101;

=====================================================================================================================================
Widget Product base query:-

SELECT name,m_product_id FROM adempiere.m_product
WHERE ad_client_id = 1000001

select distinct(grandtotal) from adempiere.c_order b
join adempiere.c_orderline a on a.ad_client_id = b.ad_client_id
where b.issotrx = 'Y' and a.m_product_id = 1000029


select distinct(grandtotal) from adempiere.c_orderline b
join adempiere.c_order c on b.m_warehouse_id = c.m_warehouse_id
where b.m_product_id = 1000028 and c.issotrx = 'N' and b.c_bpartner_id = 1000015


===================================================================================================================================
Client/Tenant all details query:-

SELECT * FROM adempiere.AD_Client WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_Calendar WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.M_Costtype WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_Year WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_Period WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_AcctSchema WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_Bp_Group WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_PaymentTerm WHERE AD_Client_ID = 1000001

SELECT * FROM adempiere.AD_ClientInfo WHERE AD_Client_ID = 1000001
//not show some id like ad_tree_menu_id,ad_tree_org_id,ad_tree_bpartner_id,ad_tree_project_id,ad_tree_salesregion_id,ad_tree_product_id,m_product_freight_id,
c_bpartnercashtrx_id,ad_tree_activity_id,ad_tree_campaign_id

SELECT * FROM adempiere.AD_Org WHERE AD_Client_ID = 1000001

SELECT * FROM adempiere.M_Warehouse WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.M_Warehouse_Acct WHERE AD_Client_ID = 1000001

SELECT * FROM adempiere.C_BPartner WHERE C_BPartner_ID IN (1000013,1000014,1000015,1000016,1000017)
//Business Partner throw error because po_paymentterm_id not show in c_bpartner_id = 1000015

SELECT * FROM adempiere.AD_User WHERE AD_Client_ID = 1000001

SELECT * FROM adempiere.M_Product_Category WHERE M_Product_Category_ID IN (1000004,1000005)
SELECT * FROM adempiere.C_TaxCategory WHERE C_TaxCategory_ID = 1000001

SELECT * FROM adempiere.M_Lotctl WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.M_Sernoctl WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.M_AttributeSet WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.M_Product WHERE M_Product_ID IN (1000028,1000029)
//salesrep_id not find


SELECT * FROM adempiere.C_Region WHERE C_Region_ID IN (1000000,1000001)
SELECT * FROM adempiere.C_City WHERE C_City_ID IN (1000000,1000001)
SELECT * FROM adempiere.C_Location WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_BPartner_Location WHERE AD_Client_ID = 1000001

//if region,city and location added then add orgInfo.
SELECT * FROM adempiere.AD_OrgInfo WHERE AD_Client_ID = 1000001


SELECT * FROM adempiere.C_DocType WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_DocType_Trl WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.M_PriceList WHERE AD_Client_ID = 1000001

SELECT * FROM adempiere.C_Order WHERE AD_Client_ID = 1000001
//salesrep_id,bill_bpartner_id,bill_location_id,bill_user_id (not find direct table)

SELECT * FROM adempiere.C_Tax WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_Uom WHERE C_Uom_ID = 100
SELECT * FROM adempiere.C_OrderLine WHERE AD_Client_ID = 1000001

SELECT * FROM adempiere.C_OrderTax WHERE AD_Client_ID = 1000001

SELECT * FROM adempiere.M_Lot WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.M_AttributeSetInstance WHERE AD_Client_ID = 1000001

SELECT * FROM adempiere.M_LocatorType WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.M_Locator WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.M_StorageOnHand WHERE AD_Client_ID = 1000001

SELECT * FROM adempiere.C_Bank WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_BankAccount WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_Payment WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.C_Invoice WHERE AD_Client_ID = 1000001
//salesrep_id not find this column

SELECT * FROM adempiere.M_Movement WHERE AD_Client_ID = 1000001
//m_warehouseto_id not find table
SELECT * FROM adempiere.M_MovementLine WHERE AD_Client_ID = 1000001
//m_locatorto_id not find table

SELECT * FROM adempiere.M_InOut WHERE AD_Client_ID = 1000001
//salesrep_id not find table
SELECT * FROM adempiere.M_InOutLine WHERE AD_Client_ID = 1000001
SELECT * FROM adempiere.M_Transaction WHERE AD_Client_ID = 1000001


==================================================================================================================================================================
Alter any table with terminal change possible:-
ALTER TABLE adempiere.C_Orderline ADD COLUMN ExpiryDate DATE;

Delete the Existing Column
Alter Table adempiere.c_orderline drop column BatchNo;



How to check Product is valid or not with Qty and show warehouse name:-
SELECT b.name, a.qtyentered, c.name
FROM adempiere.c_orderline a
join adempiere.m_product b on a.m_product_id = b.m_product_id
join adempiere.m_warehouse c on a.m_warehouse_id = c.m_warehouse_id
WHERE expirydate IS NULL OR expirydate < CURRENT_DATE;


select b.name from adempiere.c_payment a
join adempiere.c_bpartner b on a.c_bpartner_id = b.c_bpartner_id
where a.isreceipt = 'Y'and a.docstatus = 'DR'

select b.name, a.grandtotal from adempiere.c_invoice a
join adempiere.c_bpartner b on a.c_bpartner_id = b.c_bpartner_id 
where issotrx = 'Y' and ispaid = 'N'

SELECT bp.Name AS CustomerName,inv.DocumentNo AS InvoiceNumber,
inv.DateInvoiced AS InvoiceDate,inv.TotalLines AS InvoiceAmount
FROM adempiere.C_BPartner bp
INNER JOIN adempiere.C_Invoice inv ON bp.C_BPartner_ID = inv.C_BPartner_ID
LEFT JOIN adempiere.C_Payment pay ON inv.C_Invoice_ID = pay.C_Invoice_ID
WHERE inv.DateInvoiced <= (CURRENT_DATE - INTERVAL '1 month')
AND pay.C_Payment_ID IS NULL AND inv.issotrx = 'Y'



==================================================================================================================================================================
If your Column Type is char to change integer :-
Starting three query using convert char to integer
and last Query using integer max length using like mobile no is 10 digit numeric(10,0)

SELECT * FROM adempiere.c_bankaccount
WHERE MICR ~ '[^0-9]+';

UPDATE adempiere.c_bankaccount
SET MICR = NULL -- or a default numeric value
WHERE MICR ~ '[^0-9]+';

ALTER TABLE adempiere.c_bankaccount
ALTER COLUMN MICR TYPE integer USING MICR::integer;

ALTER TABLE adempiere.c_bankaccount
ALTER COLUMN MICR TYPE numeric(9, 0);

==================================================================================================================================================================
If Alert Name for bill overdue in 21 DAys

SELECT 
a.name as Name,
b.c_invoice_id as Invoice,
b.dateinvoiced as Date,
b.grandtotal as Amount
FROM adempiere.c_invoice b
JOIN adempiere.c_bpartner a on a.c_bpartner_id = b.c_bpartner_id
WHERE b.ispaid = 'N' -- Unpaid
AND b.issotrx = 'Y'	-- Show only Sales Records
AND b.dateinvoiced + INTERVAL '21 days' <= current_date;


==================================================================================================================================================================
Batch_No,BatchDate and ExpiryDate add in idempiere:-

ALTER TABLE adempiere.C_Orderline ADD COLUMN Batch_No numeric;

ALTER TABLE adempiere.C_Orderline ADD COLUMN BatchDate DATE;

ALTER TABLE adempiere.C_Orderline ADD COLUMN ExpiryDate DATE;

SELECT * FROM adempiere.c_orderline
WHERE c_orderline_id = '100'::integer;

Alter Table adempiere.c_orderline drop column BatchNo;

ALTER TABLE adempiere.c_orderline ALTER COLUMN Batch_No TYPE varchar(14);

==================================================================================================================================================================
Window Selecting Query:- Using client_id,user_id,role_id

select c.name as User_Name,b.name as Role_Name,e.name as Access_Window from adempiere.ad_user_roles a
join adempiere.ad_role b on a.ad_role_id = b.ad_role_id
join adempiere.ad_user c on a.ad_user_id = c.ad_user_id
join adempiere.ad_window_access d on a.ad_role_id = d.ad_role_id
join adempiere.ad_window e on d.ad_window_id = e.ad_window_id
where a.ad_client_id = 11 and a.ad_role_id = 102


==================================================================================================================================================================
Currently Working Data:-

select * from adempiere.c_order
where issotrx = 'Y'
and ad_client_id = 11


SELECT kc.ColumnName, dc.ColumnName, t.TableName, rt.IsValueDisplayed FROM adempiere.AD_Ref_Table rt INNER JOIN adempiere.AD_Column kc ON rt.AD_Key=kc.AD_Column_ID INNER JOIN adempiere.AD_Column dc ON rt.AD_Display=dc.AD_Column_ID INNER JOIN adempiere.AD_Table t ON rt.AD_Table_ID=t.AD_Table_ID WHERE rt.AD_Reference_ID=1


ALTER TABLE adempiere.C_Orderline ADD COLUMN Batch_No numeric;

ALTER TABLE adempiere.C_Orderline ADD COLUMN BatchDate DATE;

ALTER TABLE adempiere.C_Orderline ADD COLUMN ExpiryDate DATE;

SELECT * FROM adempiere.c_orderline
WHERE c_orderline_id = '100'::integer;

Alter Table adempiere.c_orderline drop column BatchNo;

ALTER TABLE adempiere.c_orderline ALTER COLUMN Batch_No TYPE varchar(14);

select * from adempiere.ad_client

select * from adempiere.ad_user where ad_client_id = 11

select * from adempiere.ad_user_roles where ad_client_id = 11

select * from adempiere.ad_role where ad_client_id = 11

select * from adempiere.ad_window_access where ad_client_id = 11 and ad_role_id = 1000007


select c.name as User_Name,b.name as Role_Name,e.name as Access_Window from adempiere.ad_user_roles a
join adempiere.ad_role b on a.ad_role_id = b.ad_role_id
join adempiere.ad_user c on a.ad_user_id = c.ad_user_id
join adempiere.ad_window_access d on a.ad_role_id = d.ad_role_id
join adempiere.ad_window e on d.ad_window_id = e.ad_window_id
where c.ad_client_id = 11 and b.ad_role_id = 1000008

// e.name as Access_Window  join adempiere.ad_window e on d.ad_window_id = e.ad_window_id
// d.ad_window_id as Windows
//where a.ad_client_id = 11 and c.ad_user_id = 1000011 and a.ad_role_id = 1000007


select * from adempiere.ad_user_roles a
where a.ad_client_id = 11 and a.ad_role_id = 1000007 and a.ad_user_id = 1000011

SELECT ur.AD_User_ID, ur.AD_Role_ID, r.Name AS RoleName FROM adempiere.AD_User_Roles ur 
INNER JOIN adempiere.AD_Role r ON ur.AD_Role_ID =r.AD_Role_ID
WHERE ur.AD_User_ID = 1000011

==================================================================================================================================================================
Check product Expiry from current date and show product name, qty and lot no.

select b.name as Product_Name, a.expirydate, e.qtyonhand as ExpiryQTY, c.name as Lot_no from adempiere.c_orderline a
join adempiere.m_product b on a.m_product_id = b.m_product_id 
join adempiere.m_lot c on b.m_product_id = c.m_product_id
join adempiere.m_attributesetinstance d on c.m_lot_id = d.m_lot_id
join adempiere.m_storageonhand e on d.m_attributesetinstance_id = e.m_attributesetinstance_id
where a.ad_client_id = 1000002 and a.expirydate < CURRENT_DATE


With Locator wareHouse Name:-

select b.name as Product_Name, a.expirydate, e.qtyonhand as ExpiryQTY,g.value from adempiere.c_orderline a
join adempiere.m_product b on a.m_product_id = b.m_product_id 
join adempiere.m_lot c on b.m_product_id = c.m_product_id
join adempiere.m_attributesetinstance d on c.m_lot_id = d.m_lot_id
join adempiere.m_storageonhand e on d.m_attributesetinstance_id = e.m_attributesetinstance_id
join adempiere.m_locator g on g.m_locator_id = e.m_locator_id
where a.ad_client_id = 1000002 and a.expirydate < CURRENT_DATE

==================================================================================================================================================================
Near one month Expiry product:-

select b.name as Product_Name, a.expirydate, e.qtyonhand as ExpiryQTY, c.name as Lot_no from adempiere.c_orderline a
join adempiere.m_product b on a.m_product_id = b.m_product_id 
join adempiere.m_lot c on b.m_product_id = c.m_product_id
join adempiere.m_attributesetinstance d on c.m_lot_id = d.m_lot_id
join adempiere.m_storageonhand e on d.m_attributesetinstance_id = e.m_attributesetinstance_id
join adempiere.c_order f on f.c_order_id = a.c_order_id
where a.ad_client_id = 1000002 and a.expirydate >= CURRENT_DATE and a.expirydate <= (CURRENT_DATE + INTERVAL '1 month')

==================================================================================================================================================================
Show PO list depend of MR:-
SELECT
    po.documentno AS purchase_order,
    po.dateordered AS order_date,
    CASE
        WHEN po.docstatus = 'CO' THEN 'Completed'
        ELSE 'Not Completed'
    END AS po_status,
    CASE
        WHEN mr.m_inout_id IS NOT NULL THEN 'Material Receipt Created'
        ELSE 'No Material Receipt'
    END AS mr_status
FROM
    adempiere.c_order po
LEFT JOIN
    adempiere.m_inout mr
ON
    po.c_order_id = mr.c_order_id
where po.ad_client_id = 1000002 and po.docstatus = 'CO' and mr.m_inout_id IS null;

==================================================================================================================================================================
Show PO list if poline qty product less then or null in material receipt line from

SELECT
    po.documentno AS purchase_order,
    pol.qtyordered AS po_qty_ordered,
    CASE
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NULL THEN 'Completed, No Material Receipt'
        WHEN po.docstatus = 'DR' AND mr.m_inout_id IS NULL THEN 'Drafted, No Material Receipt'
		WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NOT NULL THEN 'again created Material Receipt'
        ELSE 'Not Completed or Material Receipt Exists'
    END AS status
FROM
    adempiere.c_order po
JOIN
    adempiere.c_orderline pol
ON
    po.c_order_id = pol.c_order_id
LEFT JOIN
    adempiere.m_inout mr
ON
    po.c_order_id = mr.c_order_id
WHERE
    pol.qtyordered > (
        SELECT
            COALESCE(SUM(iol.qtyentered), 0)
        FROM
            adempiere.m_inoutline iol
        WHERE
            iol.c_orderline_id = pol.c_orderline_id
    ) and po.ad_client_id = 1000002;

TIP:- COALESCE this function is use null value to annotate o value.
Aggregating Data:- When using aggregate functions like SUM, AVG, or COUNT, COALESCE
				   can help ensure that NULL values are treated as zero or are not counted, depending on your requirements.

==================================================================================================================================================================
PO list show when not completed poline qty = inoutline qty:- 				   
select * from adempiere.m_inoutline
SELECT
    po.documentno AS purchase_order,
    pol.qtyordered AS po_qty_ordered,
    iol.qtyentered AS inbound_qty
FROM
    adempiere.c_order po
JOIN
    adempiere.c_orderline pol
ON
    po.c_order_id = pol.c_order_id
JOIN
    adempiere.m_inoutline iol
ON
    pol.c_orderline_id = iol.c_orderline_id
WHERE po.ad_client_id = 1000002 and
    pol.qtyordered > iol.qtyentered;

==================================================================================================================================================================
Show PO List with doc no.,date,supplier,warehouse,product,po qty and status:-

SELECT
    po.documentno AS purchase_order,
	bp.name AS Supplier,
	TO_CHAR(po.dateordered, 'DD-MM-YYYY') AS Order_Date,
	wh.name AS Warehouse_Name,
	pr.name AS Product_Name,
    pol.qtyordered AS po_qty_ordered,
    CASE
        WHEN po.docstatus = 'DR' AND mr.m_inout_id IS NULL THEN 'Drafted, No Material Receipt'
		WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NULL THEN 'Completed, No Material Receipt'
		WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NOT NULL THEN 'Material Receipt Created because some qty are pendding'
        ELSE 'Not Completed or Material Receipt Exists'
    END AS status
FROM adempiere.c_order po
JOIN adempiere.c_orderline pol ON po.c_order_id = pol.c_order_id
LEFT JOIN adempiere.m_inout mr ON po.c_order_id = mr.c_order_id
JOIN adempiere.c_bpartner bp ON po.c_bpartner_id = bp.c_bpartner_id	
JOIN adempiere.m_warehouse wh ON po.m_warehouse_id = wh.m_warehouse_id
JOIN adempiere.m_product pr ON pr.m_product_id = pol.m_product_id
WHERE pol.qtyordered > (
        SELECT COALESCE(SUM(iol.qtyentered), 0)
        FROM adempiere.m_inoutline iol
        WHERE iol.c_orderline_id = pol.c_orderline_id
    ) and po.ad_client_id = 1000002;


==================================================================================================================================================================

Change Date Formet:-
SELECT TO_CHAR(dateordered, 'DD-MM-YYYY') AS date_only
FROM adempiere.c_order where ad_client_id = 1000002 and issotrx = 'N'


only Date show not a time stamp:-
SELECT DATE(dateordered) AS date_only FROM adempiere.c_order where ad_client_id = 1000002 and issotrx = 'N'   

==================================================================================================================================================================

SELECT
    po.documentno AS purchase_order,
    bp.name AS Supplier,
    TO_CHAR(po.dateordered, 'DD-MM-YYYY') AS Order_Date,
    wh.name AS Warehouse_Name,
    po.description,
    pr.name AS Product_Name,
    pol.qtyordered AS po_qty_ordered,
    CASE
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NULL THEN false
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NOT NULL THEN true 
    END AS status
FROM adempiere.c_order po
JOIN adempiere.c_orderline pol ON po.c_order_id = pol.c_order_id
LEFT JOIN adempiere.m_inout mr ON po.c_order_id = mr.c_order_id
JOIN adempiere.c_bpartner bp ON po.c_bpartner_id = bp.c_bpartner_id 
JOIN adempiere.m_warehouse wh ON po.m_warehouse_id = wh.m_warehouse_id
JOIN adempiere.m_product pr ON pr.m_product_id = pol.m_product_id
WHERE pol.qtyordered > (
        SELECT COALESCE(SUM(iol.qtyentered), 0)
        FROM adempiere.m_inoutline iol
        WHERE iol.c_orderline_id = pol.c_orderline_id
    ) and po.ad_client_id = 1000002 and po.docstatus = 'CO'; 

==================================================================================================================================================================
No test:-
SELECT
    po.documentno AS purchase_order,
    pol.line AS po_line,
    pol.qtyordered AS po_qty_ordered,
    CASE
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NULL THEN 'Completed, No Material Receipt'
        WHEN pol.qtyordered > COALESCE(SUM(iol.qty), 0) THEN 'PO Line Quantity > Inbound Shipment Quantity'
        ELSE 'Not Matched'
    END AS status,
    pol.qtyordered - COALESCE(SUM(iol.qty), 0) AS qty_difference
FROM
    c_order po
JOIN
    c_orderline pol
ON
    po.c_order_id = pol.c_order_id
LEFT JOIN
    m_inout mr
ON
    po.c_order_id = mr.c_order_id
LEFT JOIN
    m_inoutline iol
ON
    pol.c_orderline_id = iol.c_orderline_id
WHERE
    po.docstatus = 'CO'
GROUP BY
    po.documentno, pol.line, pol.qtyordered;






==================================================================================================================================================================
Current Data record find query:-
SELECT * FROM adempiere.m_storageonhand WHERE DATE(created) = CURRENT_DATE;

==================================================================================================================================================================
