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
select a.documentno,
TO_CHAR(a.movementdate, 'DD-MM-YYYY') AS Date,
b.name,
c.name,
a.description
from adempiere.m_inventory a
join adempiere.m_warehouse b on a.m_warehouse_id = b.m_warehouse_id
join adempiere.ad_org c on a.ad_org_id = c.ad_org_id
where a.ad_client_id = 1000002 and a.docstatus = 'DR'


==================================================================================================================================================================
po data multiple same product but not minus repeat time :-

SELECT (a.qtyordered - COALESCE(SUM(c.qtyentered), 0)) AS outstanding_qty, e.m_product_id as productId, a.c_order_id, a.c_uom_id, a.c_orderline_id, e.name AS product_name
FROM adempiere.c_orderline a 
JOIN adempiere.c_order d ON d.c_order_id = a.c_order_id 
LEFT JOIN adempiere.m_inout b ON a.c_order_id = b.c_order_id 
LEFT JOIN adempiere.m_inoutline c ON c.m_inout_id = b.m_inout_id AND c.c_orderline_id = a.c_orderline_id
JOIN adempiere.m_product e ON e.m_product_id = a.m_product_id 
WHERE d.documentno = '800022' AND d.ad_client_id = '11' AND a.c_order_id = (
  SELECT c_order_id FROM adempiere.c_order WHERE documentno = '800022' AND ad_client_id = '11'
)
GROUP BY e.m_product_id, e.name, a.qtyordered, a.c_orderline_id, a.c_uom_id, a.c_order_id;


==================================================================================================================================================================
ALL List API DESC Format:-
PO List:-

SELECT DISTINCT
    po.documentno AS purchase_order,
    bp.name AS Supplier,
    TO_CHAR(po.dateordered, 'DD/MM/YYYY') AS Order_Date,
    wh.name AS Warehouse_Name,
    po.description,
    CASE
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NULL THEN false
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NOT NULL THEN true 
    END AS status
FROM adempiere.c_order po
JOIN adempiere.c_orderline pol ON po.c_order_id = pol.c_order_id
LEFT JOIN adempiere.m_inout mr ON po.c_order_id = mr.c_order_id
JOIN adempiere.c_bpartner bp ON po.c_bpartner_id = bp.c_bpartner_id 
JOIN adempiere.m_warehouse wh ON po.m_warehouse_id = wh.m_warehouse_id
WHERE pol.qtyordered > (
        SELECT COALESCE(SUM(iol.qtyentered), 0)
        FROM adempiere.m_inoutline iol
        WHERE iol.c_orderline_id = pol.c_orderline_id
    ) AND po.ad_client_id = 1000002 AND po.docstatus = 'CO' AND po.issotrx = 'N'
    ORDER BY po.documentno DESC; 
    
-------------------------------------------------------------------------------------------------------------------------------------------------------------    
 MR List:-

SELECT
    DISTINCT(po.documentno) AS documentNo,
    bp.name AS Supplier,
    TO_CHAR(po.dateordered, 'DD/MM/YYYY') AS Order_Date,
    wh.name AS Warehouse_Name,
    po.description,
    co.documentno as orderDocumentno
FROM
    adempiere.m_inout po
JOIN
    adempiere.c_bpartner bp ON po.c_bpartner_id = bp.c_bpartner_id 
JOIN
    adempiere.c_order co ON co.c_order_id = po.c_order_id
JOIN
    adempiere.m_warehouse wh ON po.m_warehouse_id = wh.m_warehouse_id
WHERE
    po.ad_client_id = 1000002
    AND po.docstatus = 'DR'
    AND po.ad_orgtrx_id IS NULL
    ORDER BY po.documentno DESC;
-------------------------------------------------------------------------------------------------------------------------------------------------------------    
PI List:-

SELECT
    a.m_inventory_id,
    TO_CHAR(a.movementdate, 'DD/MM/YYYY') AS Date,
    b.name AS Warehouse_Name,
    c.name AS Org_Name,
    a.description
FROM
    adempiere.m_inventory a
JOIN
    adempiere.m_warehouse b ON a.m_warehouse_id = b.m_warehouse_id
JOIN
    adempiere.ad_org c ON a.ad_org_id = c.ad_org_id
WHERE
    a.ad_client_id = 1000002
    AND a.docstatus = 'DR'
    ORDER BY a.m_inventory_id DESC;

-------------------------------------------------------------------------------------------------------------------------------------------------------------    
 SO List:-

SELECT DISTINCT
    so.documentno as Sales_Order,
    TO_CHAR(so.dateordered, 'DD/MM/YYYY') AS Order_Date,
    wh.name AS Warehouse_Name,
    bp.name AS Customer,
    so.description,
    CASE
        WHEN so.docstatus = 'CO' AND mr.m_inout_id IS NULL THEN false
        WHEN so.docstatus = 'CO' AND mr.m_inout_id IS NOT NULL THEN true 
    END AS status
FROM
    adempiere.c_order so
JOIN
    adempiere.c_orderline sol ON so.c_order_id = sol.c_order_id
JOIN
    adempiere.c_bpartner bp ON so.c_bpartner_id = bp.c_bpartner_id 
JOIN
    adempiere.m_warehouse wh ON so.m_warehouse_id = wh.m_warehouse_id
LEFT JOIN
    adempiere.m_inout mr ON so.c_order_id = mr.c_order_id
WHERE
    sol.qtyordered > (
        SELECT COALESCE(SUM(iol.qtyentered), 0)
        FROM adempiere.m_inoutline iol
        WHERE iol.c_orderline_id = sol.c_orderline_id
    )
AND
    so.ad_client_id = 1000002
AND
    so.issotrx = 'Y'
AND
    so.docstatus = 'CO'
    ORDER BY so.documentno DESC;


==================================================================================================================================================================
If m_inventoryline is null then m_inventory list also not show:-

SELECT DISTINCT(mi.m_inventory_id),TO_CHAR(mi.movementdate, 'DD-MM-YYYY') AS Date,b.name AS Warehouse_Name,
    o.name AS Org_Name,mi.description FROM adempiere.m_inventory mi
JOIN adempiere.m_inventoryline il ON il.m_inventory_id = mi.m_inventory_id
JOIN adempiere.m_warehouse b ON mi.m_warehouse_id = b.m_warehouse_id
JOIN adempiere.ad_org o ON mi.ad_org_id = o.ad_org_id
WHERE mi.ad_client_id = 11 AND il.m_inventory_id is not null AND mi.docStatus = 'DR' ORDER BY mi.m_inventory_id DESC;


==================================================================================================================================================================
Sales Order Details API currection enter document no only see required field not all field:-

SELECT
    TO_CHAR(po.dateordered, 'DD-MM-YYYY') AS Order_Date,
    bp.name AS Supplier,
    wh.name AS Warehouse_Name,
    po.description,
    ml.m_locator_id,
    CASE
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NULL THEN false
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NOT NULL THEN true
    END AS status
FROM
    adempiere.c_order po
JOIN
    adempiere.c_bpartner bp ON po.c_bpartner_id = bp.c_bpartner_id
LEFT JOIN
    adempiere.m_inout mr ON po.c_order_id = mr.c_order_id
JOIN
    adempiere.m_warehouse wh ON po.m_warehouse_id = wh.m_warehouse_id
JOIN
    adempiere.m_locator ml ON ml.m_warehouse_id = wh.m_warehouse_id
WHERE
    po.documentno = '50010'
    AND isDefault = 'Y' AND po.issotrx = 'Y';


==================================================================================================================================================================
Search Query for Receiving:-

SELECT DISTINCT
    po.documentno AS purchase_order,
    bp.name AS Supplier,
    TO_CHAR(po.dateordered, 'DD/MM/YYYY') AS Order_Date,
    wh.name AS Warehouse_Name,
    po.description,
    CASE
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NULL THEN false
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NOT NULL THEN true
    END AS status
FROM adempiere.c_order po
JOIN adempiere.c_orderline pol ON po.c_order_id = pol.c_order_id
LEFT JOIN adempiere.m_inout mr ON po.c_order_id = mr.c_order_id
JOIN adempiere.c_bpartner bp ON po.c_bpartner_id = bp.c_bpartner_id
JOIN adempiere.m_warehouse wh ON po.m_warehouse_id = wh.m_warehouse_id
WHERE pol.qtyordered > (
    SELECT COALESCE(SUM(iol.qtyentered), 0)
    FROM adempiere.m_inoutline iol
    WHERE iol.c_orderline_id = pol.c_orderline_id
)
AND po.ad_client_id = 1000002
AND po.docstatus = 'CO'
AND po.issotrx = 'N'
AND (
    po.documentno ILIKE '%' || COALESCE(?, po.documentno) || '%'
    OR bp.name ILIKE '%' || COALESCE(?, bp.name) || '%'
    OR wh.name ILIKE '%' || COALESCE(?, wh.name) || '%'
    OR po.description ILIKE '%' || COALESCE(?, po.description) || '%'
)
ORDER BY po.documentno DESC;

==================================================================================================================================================================
SELECT b.name AS Product_Name, a.expirydate as Date, e.qtyonhand AS Expiry_QTY, att.lot AS Lot_No, wh.value AS Warehouse_Name, ll.value AS Locator_Name 
FROM c_orderline a
JOIN m_product b ON a.m_product_id = b.m_product_id 
JOIN m_inoutline mil ON mil.c_orderline_id = a.c_orderline_id
JOIN m_storageonhand e ON mil.m_attributesetinstance_id = e.m_attributesetinstance_id
JOIN m_attributesetinstance att ON att.m_attributesetinstance_id = e.m_attributesetinstance_id
JOIN c_order f ON f.c_order_id = a.c_order_id
JOIN m_warehouse wh ON wh.m_warehouse_id = f.m_warehouse_id
JOIN m_locator ll ON ll.m_locator_id = e.m_locator_id
WHERE a.ad_client_id = 1000002 AND f.issotrx = 'N' AND a.expirydate < CURRENT_DATE


==================================================================================================================================================================
SELECT b.name AS Product_Name, a.expirydate as Date, e.qtyonhand AS ExpiryQTY, att.lot AS Lot_No, wh.value AS Warehouse_Name, ll.value AS Locator_Name 
FROM c_orderline a
JOIN m_product b ON a.m_product_id = b.m_product_id 
JOIN m_inoutline mil ON mil.c_orderline_id = a.c_orderline_id
JOIN m_storageonhand e ON mil.m_attributesetinstance_id = e.m_attributesetinstance_id
JOIN m_attributesetinstance att ON att.m_attributesetinstance_id = e.m_attributesetinstance_id
JOIN c_order f ON f.c_order_id = a.c_order_id
JOIN m_warehouse wh ON wh.m_warehouse_id = f.m_warehouse_id
JOIN m_locator ll ON ll.m_locator_id = e.m_locator_id
WHERE a.ad_client_id = 1000002 AND f.issotrx = 'N' AND a.expirydate >= CURRENT_DATE AND a.expirydate <= (CURRENT_DATE + MAKE_INTERVAL(months => 1))


==================================================================================================================================================================
PO List with search key:-
SELECT DISTINCT
    po.documentno AS purchase_order,
    bp.name AS Supplier,
    TO_CHAR(po.dateordered, 'DD/MM/YYYY') AS Order_Date,
    wh.name AS Warehouse_Name,
    po.description,
    CASE
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NULL THEN false
        WHEN po.docstatus = 'CO' AND mr.m_inout_id IS NOT NULL THEN true
    END AS status
FROM adempiere.c_order po
JOIN adempiere.c_orderline pol ON po.c_order_id = pol.c_order_id
LEFT JOIN adempiere.m_inout mr ON po.c_order_id = mr.c_order_id
JOIN adempiere.c_bpartner bp ON po.c_bpartner_id = bp.c_bpartner_id 
JOIN adempiere.m_warehouse wh ON po.m_warehouse_id = wh.m_warehouse_id
WHERE pol.qtyordered > (
    SELECT COALESCE(SUM(iol.qtyentered), 0)
    FROM adempiere.m_inoutline iol
    WHERE iol.c_orderline_id = pol.c_orderline_id
) AND po.ad_client_id = '"+ clientID +"'
AND po.docstatus = 'CO'
AND po.issotrx = 'N'
AND (
    po.documentno ILIKE '%' || COALESCE(?, po.documentno) || '%'
    OR bp.name ILIKE '%' || COALESCE(?, bp.name) || '%'
    OR wh.name ILIKE '%' || COALESCE(?, wh.name) || '%'
    OR po.description ILIKE '%' || COALESCE(?, po.description) || '%'
)
ORDER BY po.documentno DESC;
-------------------------------------------------------------------------------------------------------------------------------
MR List with search key:-
SELECT DISTINCT
    po.documentno AS documentNo,
    bp.name AS Supplier,
    TO_CHAR(po.dateordered, 'DD-MM-YYYY') AS Order_Date,
    wh.name AS Warehouse_Name,
    po.description,
    co.documentno AS orderDocumentno
FROM
    adempiere.m_inout po
JOIN
    adempiere.c_bpartner bp ON po.c_bpartner_id = bp.c_bpartner_id
JOIN
    adempiere.c_order co ON co.c_order_id = po.c_order_id
JOIN
    adempiere.m_warehouse wh ON po.m_warehouse_id = wh.m_warehouse_id
WHERE
    po.ad_client_id = '"+ clientID +"'
    AND po.docstatus = 'DR'
    AND po.ad_orgtrx_id IS NULL
    AND (
        po.documentno ILIKE '%' || COALESCE(?, po.documentno) || '%'
        OR bp.name ILIKE '%' || COALESCE(?, bp.name) || '%'
        OR wh.name ILIKE '%' || COALESCE(?, wh.name) || '%'
        OR po.description ILIKE '%' || COALESCE(?, po.description) || '%'
        OR co.documentno ILIKE '%' || COALESCE(?, co.documentno) || '%'
    )
ORDER BY po.documentno DESC;
-------------------------------------------------------------------------------------------------------------------------------
PI List with search key:-
SELECT
    a.m_inventory_id AS mrId,
    TO_CHAR(a.movementdate, 'DD-MM-YYYY') AS Date,
    b.name AS Warehouse_Name,
    c.name AS Org_Name,
    a.description
FROM
    adempiere.m_inventory a
JOIN
    adempiere.m_warehouse b ON a.m_warehouse_id = b.m_warehouse_id
JOIN
    adempiere.ad_org c ON a.ad_org_id = c.ad_org_id
WHERE
    a.ad_client_id = '"+ clientID +"'
    AND a.docstatus = 'DR'
    AND (
        a.m_inventory_id::VARCHAR ILIKE '%' || COALESCE(?, a.m_inventory_id::VARCHAR) || '%'
        OR c.name ILIKE '%' || COALESCE(?, c.name) || '%'
        OR b.name ILIKE '%' || COALESCE(?, b.name) || '%'
        OR a.description ILIKE '%' || COALESCE(?, a.description) || '%'
    )
ORDER BY a.m_inventory_id DESC;
------------------------------------------------------------------------------------------------------------------------------
SO List with search key:-
SELECT DISTINCT
    so.documentno AS Sales_Order,
    TO_CHAR(so.dateordered, 'DD/MM/YYYY') AS Order_Date,
    wh.name AS Warehouse_Name,
    bp.name AS Customer,
    so.description,
    CASE
        WHEN so.docstatus = 'CO' AND mr.m_inout_id IS NULL THEN false
        WHEN so.docstatus = 'CO' AND mr.m_inout_id IS NOT NULL THEN true
    END AS status
FROM
    adempiere.c_order so
JOIN
    adempiere.c_orderline sol ON so.c_order_id = sol.c_order_id
JOIN
    adempiere.c_bpartner bp ON so.c_bpartner_id = bp.c_bpartner_id
JOIN
    adempiere.m_warehouse wh ON so.m_warehouse_id = wh.m_warehouse_id
LEFT JOIN
    adempiere.m_inout mr ON so.c_order_id = mr.c_order_id
WHERE
    sol.qtyordered > (
        SELECT COALESCE(SUM(iol.qtyentered), 0)
        FROM adempiere.m_inoutline iol
        WHERE iol.c_orderline_id = sol.c_orderline_id
    )
    AND so.ad_client_id = '"+ clientID +"'
    AND so.issotrx = 'Y'
    AND so.docstatus = 'CO'
    AND (
        so.documentno ILIKE '%' || COALESCE(?, so.documentno) || '%'
        OR bp.name ILIKE '%' || COALESCE(?, bp.name) || '%'
        OR wh.name ILIKE '%' || COALESCE(?, wh.name) || '%'
        OR so.description ILIKE '%' || COALESCE(?, so.description) || '%'
    )
ORDER BY so.documentno DESC;


==================================================================================================================================================================
Business partner wise payment records:-
if bill generate and bill not paid then list show business party wise 

SELECT c_invoice_id,grandtotal,TO_CHAR(dateinvoiced, 'DD/MM/YYYY') AS invoice_Date
FROM adempiere.c_invoice WHERE ad_client_id = 1000002 AND c_bpartner_id = 1000026 AND ispaid = 'N' 

==================================================================================================================================================================
After 42 days Customer List show based on Invoiced:-

SELECT bp.name AS Customer_Name,TO_CHAR(inv.created, 'DD/MM/YYYY') AS Invoice_Date,inv.grandtotal AS Amonut 
FROM adempiere.c_invoice inv 
JOIN adempiere.c_bpartner bp ON bp.c_bpartner_id = inv.c_bpartner_id
WHERE inv.ad_client_id = 1000002 AND inv.issotrx = 'Y' 
AND EXTRACT(DAY FROM (CURRENT_DATE - inv.dateinvoiced)) > 42


==================================================================================================================================================================
Create a new View:-
CREATE VIEW adempiere.chirag_test AS SELECT bp.name AS Customer_Name,inv.grandtotal AS Amonut 
FROM adempiere.c_invoice inv 
JOIN adempiere.c_bpartner bp ON bp.c_bpartner_id = inv.c_bpartner_id
WHERE inv.ad_client_id = 1000002 AND inv.issotrx = 'Y'
==================================================================================================================================================================
Create a new View:;-

CREATE VIEW adempiere.chirag_test AS SELECT * FROM adempiere.c_invoice (if you are not enter adempiere then create Public not a adempiere)
 

==================================================================================================================================================================
Create View some restriction Parameter:- like product,bpartnerand period 

 SELECT il.ad_client_id,
    il.ad_org_id,
    il.c_bpartner_id,
    il.m_product_id,
    adempiere.firstof(il.dateinvoiced::timestamp with time zone, 'MM'::character varying) AS dateinvoiced,
    sum(il.linenetamt) AS linenetamt,
    sum(il.linelistamt) AS linelistamt,
    sum(il.linelimitamt) AS linelimitamt,
    sum(il.linediscountamt) AS linediscountamt,
        CASE
            WHEN sum(il.linelistamt) = 0::numeric THEN 0::numeric
            ELSE adempiere.currencyround((sum(il.linelistamt) - sum(il.linenetamt)) / sum(il.linelistamt) * 100::numeric, i.c_currency_id, 'N'::character varying)
        END AS linediscount,
    sum(il.lineoverlimitamt) AS lineoverlimitamt,
        CASE
            WHEN sum(il.linenetamt) = 0::numeric THEN 0::numeric
            ELSE 100::numeric - adempiere.currencyround((sum(il.linenetamt) - sum(il.lineoverlimitamt)) / sum(il.linenetamt) * 100::numeric, i.c_currency_id, 'N'::character varying)
        END AS lineoverlimit,
    sum(il.qtyinvoiced) AS qtyinvoiced,
    il.issotrx
   FROM adempiere.rv_c_invoiceline il
     JOIN adempiere.c_invoice i ON i.c_invoice_id = il.c_invoice_id
  GROUP BY il.ad_client_id, il.ad_org_id, il.m_product_id, il.c_bpartner_id, (adempiere.firstof(il.dateinvoiced::timestamp with time zone, 'MM'::character varying)), il.issotrx, i.c_currency_id;

==================================================================================================================================================================
How to trace Locator available size:-

SELECT
  l.m_locator_id,
  l.value AS locator_name,
  l.maxquantity,
  COALESCE(l.maxquantity - COALESCE(SUM(m.qtybook), 0), l.maxquantity) AS available_size
FROM
  adempiere.m_locator l
LEFT JOIN
  adempiere.m_inventoryline m ON l.m_locator_id = m.m_locator_id
GROUP BY
  l.m_locator_id, l.value, l.maxquantity;

==================================================================================================================================================================
Purchase record deleted in terminal:-

Deleted Orderline:-

DELETE FROM adempiere.c_orderline
WHERE c_orderline_id = 1000302;

Deleted Order :-

DELETE FROM adempiere.c_order
WHERE c_order_id = 1000261;


==================================================================================================================================================================
Alter Table adempiere.c_bpartner
add column m_locator_id numeric(10,0);

==================================================================================================================================================================
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'm_inoutline' AND column_name = 'm_locator_id';

==================================================================================================================================================================

SELECT * FROM adempiere.m_warehouse WHERE m_reservelocator_id = 1000386;
UPDATE adempiere.m_warehouse SET m_reservelocator_id = null WHERE m_reservelocator_id = 1000386;
DELETE FROM adempiere.m_locator WHERE m_locator_id = 1000386;
DELETE FROM adempiere.m_warehouse WHERE m_warehouse_id = 1000019;


==================================================================================================================================================================
ALTER TABLE adempiere.m_inout ADD COLUMN pickStatus VARCHAR(255);
ALTER TABLE adempiere.c_order ADD COLUMN putStatus VARCHAR(255);

==================================================================================================================================================================
select i.c_bpartner_id,il.m_product_id,i.c_invoice_id,il.pricelist,il.qtyinvoiced,il.linenetamt from adempiere.c_invoice i
join adempiere.c_invoiceline il on i.c_invoice_id = il.c_invoice_id
where i.ad_client_id = 1000002 and i.issotrx = 'Y' 

==================================================================================================================================================================
sum and without sum product:-

SELECT
    c_bpartner_id,
    clientName,
    BPartnerName,
    c_invoice_id,
    date,
    ProductName,
    m_product_id,
    pricelist,
    qtyinvoiced AS IndividualQuantity,
    linenetamt AS IndividualNetAmount,
    SUM(qtyinvoiced) OVER(PARTITION BY c_bpartner_id, m_product_id) AS TotalQuantity,
    SUM(linenetamt) OVER(PARTITION BY c_bpartner_id, m_product_id) AS TotalNetAmount
FROM (
    SELECT
        i.c_bpartner_id,
        bp.name AS BPartnerName,
    cl.name as clientName,
        i.c_invoice_id,
        DATE(i.dateinvoiced) AS date,
        pr.name AS ProductName,
        il.m_product_id,
        il.pricelist,
        il.qtyinvoiced,
        il.linenetamt
    FROM
        adempiere.c_invoice i
    JOIN
        adempiere.c_invoiceline il ON i.c_invoice_id = il.c_invoice_id
    JOIN
        adempiere.c_bpartner bp ON bp.c_bpartner_id = i.c_bpartner_id
    JOIN
        adempiere.m_product pr ON pr.m_product_id = il.m_product_id
    join adempiere.ad_client cl on cl.ad_client_id = i.ad_client_id
    WHERE
        i.ad_client_id = 1000002
        AND i.issotrx = 'Y'
        AND i.dateinvoiced > '2023/12/24'
        AND i.dateinvoiced < '2023/12/31'
) AS subquery
ORDER BY
    c_bpartner_id,
    m_product_id


==================================================================================================================================================================
Delete Warehouse id if locator is empty:-
DELETE FROM adempiere.M_Warehouse WHERE M_Warehouse_ID = 1000027;


==================================================================================================================================================================
SHOW PRODUCT LIST SALES AND AVAILABLE QTY:-

WITH InvoiceLineTotals AS (
SELECT il.m_product_id,SUM(il.qtyinvoiced) AS TotalQty,
SUM(il.linenetamt) AS TotalNetAmount FROM adempiere.c_invoice i
JOIN adempiere.c_invoiceline il ON i.c_invoice_id = il.c_invoice_id
WHERE i.ad_client_id =  1000002  AND i.issotrx = 'Y' ANd i.dateinvoiced > '01/11/2023' AND
i.dateinvoiced < '05/12/2023' GROUP BY il.m_product_id),
StorageOnHandTotals AS (
SELECT m_product_id,SUM(qtyonhand) AS AvailableQty
FROM adempiere.m_storageonhand WHERE Date(datematerialpolicy) < '04/12/2023' GROUP BY m_product_id),
BasePrice AS (
SELECT ol.m_product_id, MAX(ol.pricelimit) AS MaxPriceLimit
FROM adempiere.c_orderline ol
JOIN adempiere.c_order o ON o.c_order_id = ol.c_order_id
WHERE ol.ad_client_id =  1000002  AND o.issotrx = 'N'
GROUP BY m_product_id)
SELECT pr.name AS ProductName,COALESCE(i.TotalQty, 0) AS TotalQty,
ROUND(COALESCE(i.TotalNetAmount, 0),2) AS TotalNetAmount,
Round(COALESCE(s.AvailableQty, 0),0) AS AQty,cl.name As ClientName,
ROUND(COALESCE(b.MaxPriceLimit * s.AvailableQty, 0), 2) AS AValue
FROM adempiere.m_product pr
LEFT JOIN InvoiceLineTotals i ON pr.m_product_id = i.m_product_id
LEFT JOIN StorageOnHandTotals s ON pr.m_product_id = s.m_product_id
LEFT JOIN BasePrice b ON pr.m_product_id = b.m_product_id
join adempiere.ad_client cl on cl.ad_client_id = pr.ad_client_id
WHERE pr.ad_client_id =  1000002 ORDER BY pr.name

==================================================================================================================================================================
SALES $ STOCK ANALYSIS:-

WITH InvoiceLineTotals AS (
    SELECT
        il.m_product_id,
        SUM(il.qtyinvoiced) AS TotalQty,
        SUM(il.linenetamt) AS TotalNetAmount
    FROM
        adempiere.c_invoice i
        JOIN adempiere.c_invoiceline il ON i.c_invoice_id = il.c_invoice_id
    WHERE
        i.ad_client_id = 1000002
        AND i.issotrx = 'Y'
        AND i.dateinvoiced >  $P{FromDate} 
        AND i.dateinvoiced <  $P{ToDate} 
    GROUP BY
        il.m_product_id
),
StorageOnHandTotals AS (
    SELECT
        m_product_id,
        SUM(qtyonhand) AS AvailableQty
    FROM
        adempiere.m_storageonhand
    WHERE
        DATE(datematerialpolicy) <  $P{ToDate} 
    GROUP BY
        m_product_id
),
BasePrice AS (
    SELECT
        ol.m_product_id,
        MAX(ol.pricelimit) AS MaxPriceLimit
    FROM
        adempiere.c_orderline ol
        JOIN adempiere.c_order o ON o.c_order_id = ol.c_order_id
    WHERE
        ol.ad_client_id = 1000002
        AND o.issotrx = 'N'
    GROUP BY
        m_product_id
),
PreviousMonth AS (
    SELECT
        il.m_product_id,
        SUM(il.qtyinvoiced) AS TotalPQty
    FROM
        adempiere.c_invoice i
        JOIN adempiere.c_invoiceline il ON i.c_invoice_id = il.c_invoice_id
    WHERE
        i.ad_client_id = 1000002
        AND i.issotrx = 'Y'
        AND i.dateinvoiced >  $P{FromDate} ::DATE  -  INTERVAL '30 days'
        AND i.dateinvoiced <  $P{ToDate} ::DATE -  INTERVAL '30 days'
    GROUP BY
        il.m_product_id
)
SELECT
    pr.name AS ProductName,
    COALESCE(i.TotalQty, 0) AS TotalQty,
    ROUND(COALESCE(i.TotalNetAmount, 0), 2) AS TotalNetAmount,
    ROUND(COALESCE(s.AvailableQty, 0), 0) AS AQty,
    cl.name AS ClientName,
    ROUND(COALESCE(b.MaxPriceLimit * s.AvailableQty, 0), 2) AS AValue,
    ROUND(COALESCE(pp.TotalPQty, 0), 0) AS PQty
FROM
    adempiere.m_product pr
    LEFT JOIN InvoiceLineTotals i ON pr.m_product_id = i.m_product_id
    LEFT JOIN StorageOnHandTotals s ON pr.m_product_id = s.m_product_id
    LEFT JOIN BasePrice b ON pr.m_product_id = b.m_product_id
    LEFT JOIN PreviousMonth pp ON pr.m_product_id = pp.m_product_id
    JOIN adempiere.ad_client cl ON cl.ad_client_id = pr.ad_client_id
WHERE
    pr.ad_client_id = 1000002
ORDER BY
    pr.name

==================================================================================================================================================================
Current Date in Web Application :- @#Date@
Createing Date in Web Application for any table :- @SQL=SELECT created FROM adempiere.c_invoice WHERE issotrx='Y' AND AD_CLIENT_ID =@#AD_Client_ID@ limit 1

==================================================================================================================================================================
JasperReport view for bPartner wise sales Reports:-

select i.dateinvoiced, uo.name,i.c_invoice_id,i.c_bpartner_id,ac.name as clientName,i.c_invoice_id As InvoiceId,bp.name AS BPartnerName,pr.name AS ProductName,il.m_product_id,il.pricelist,il.qtyinvoiced,il.linenetamt from adempiere.c_invoice i
join adempiere.c_invoiceline il on i.c_invoice_id = il.c_invoice_id
join adempiere.c_bpartner bp on bp.c_bpartner_id = i.c_bpartner_id
join adempiere.m_product pr on pr.m_product_id = il.m_product_id 
join adempiere.ad_client ac on ac.ad_client_id = i.ad_client_id
join adempiere.c_uom uo on uo.c_uom_id = il.c_uom_id
where i.ad_client_id =  $P{AD_CLIENT_ID}  and i.dateinvoiced >  $P{FromDate} and i.dateinvoiced <   $P{ToDate} and i.issotrx = 'Y' order by c_bpartner_id, m_product_id

==================================================================================================================================================================
Baprtner wise sales Reports with date and invoices:-

SELECT
    c_bpartner_id,
    clientName,
    BPartnerName,
    c_invoice_id,
    date,
    ProductName,
    m_product_id,
    pricelist,
    qtyinvoiced AS IndividualQuantity,
    linenetamt AS IndividualNetAmount,
    SUM(qtyinvoiced) OVER(PARTITION BY c_bpartner_id, m_product_id) AS TotalQuantity,
    SUM(linenetamt) OVER(PARTITION BY c_bpartner_id, m_product_id) AS TotalNetAmount
FROM (
    SELECT
        i.c_bpartner_id,
        bp.name AS BPartnerName,
    cl.name as clientName,
        i.c_invoice_id,
        DATE(i.dateinvoiced) AS date,
        pr.name AS ProductName,
        il.m_product_id,
        il.pricelist,
        il.qtyinvoiced,
        il.linenetamt
    FROM
        adempiere.c_invoice i
    JOIN
        adempiere.c_invoiceline il ON i.c_invoice_id = il.c_invoice_id
    JOIN
        adempiere.c_bpartner bp ON bp.c_bpartner_id = i.c_bpartner_id
    JOIN
        adempiere.m_product pr ON pr.m_product_id = il.m_product_id
    join adempiere.ad_client cl on cl.ad_client_id = i.ad_client_id
    WHERE
        i.ad_client_id =    $P{AD_CLIENT_ID} 
        AND i.issotrx = 'Y'
        AND i.dateinvoiced >   $P{FromDate}    
        AND i.dateinvoiced <   $P{ToDate} 
         AND (
        $P{BPartnerId} IS NULL OR
        i.c_bpartner_id = $P{BPartnerId}
    )   
) AS subquery
ORDER BY
    c_bpartner_id,
    m_product_id

==================================================================================================================================================================
Sales Representative wise Sales report but this query is working not salesRepid parameter wise show every time all records:-

SELECT 
    i.documentno AS invoice_number,
    bp.name AS Customer,
    br.ad_user_id,
    i.c_bpartner_id,
    i.salesrep_id,
    il.m_product_id,
    ad.name AS clientName,
    p.name AS productName,
    il.qtyinvoiced AS quantity,
    il.linenetamt AS netAmt,
    br.name AS SalesRep,
    i.dateinvoiced 
FROM 
    adempiere.c_invoice i
JOIN 
    adempiere.c_invoiceline il ON i.c_invoice_id = il.c_invoice_id
JOIN 
    adempiere.m_product p ON il.m_product_id = p.m_product_id
JOIN 
    adempiere.ad_user br ON i.salesrep_id = br.ad_user_id 
JOIN 
    adempiere.c_bpartner bp ON i.c_bpartner_id = bp.c_bpartner_id
JOIN 
    adempiere.ad_client ad ON ad.ad_client_id = i.ad_client_id
WHERE 
    i.issotrx = 'Y'  
    AND p.ad_client_id = $P{AD_CLIENT_ID}  
    AND i.dateinvoiced > $P{FromDate}     
    AND i.dateinvoiced < $P{ToDate}  
    AND (
        $P{SalesRepId} IS NULL OR br.ad_user_id = $P{SalesRepId}
    )
ORDER BY 
    i.salesrep_id, i.c_bpartner_id

==================================================================================================================================================================
Slaes & Stock Analysis with PreviousMonth sales qty details:-

WITH InvoiceLineTotals AS (
    SELECT
        il.m_product_id,
        SUM(il.qtyinvoiced) AS TotalQty,
        SUM(il.linenetamt) AS TotalNetAmount
    FROM
        adempiere.c_invoice i
        JOIN adempiere.c_invoiceline il ON i.c_invoice_id = il.c_invoice_id
    WHERE
        i.ad_client_id =  $P{AD_CLIENT_ID} 
        AND i.issotrx = 'Y'
        AND i.dateinvoiced >  $P{FromDate} 
        AND i.dateinvoiced <  $P{ToDate} 
    GROUP BY
        il.m_product_id
),
StorageOnHandTotals AS (
    SELECT
        m_product_id,
        SUM(qtyonhand) AS AvailableQty
    FROM
        adempiere.m_storageonhand
    WHERE
        DATE(datematerialpolicy) <  $P{ToDate} 
    GROUP BY
        m_product_id
),
BasePrice AS (
    SELECT
        ol.m_product_id,
        MAX(ol.pricelimit) AS MaxPriceLimit
    FROM
        adempiere.c_orderline ol
        JOIN adempiere.c_order o ON o.c_order_id = ol.c_order_id
    WHERE
        ol.ad_client_id =  $P{AD_CLIENT_ID} 
        AND o.issotrx = 'N'
    GROUP BY
        m_product_id
),
PreviousMonth AS (
    SELECT
        il.m_product_id,
        SUM(il.qtyinvoiced) AS TotalPQty
    FROM
        adempiere.c_invoice i
        JOIN adempiere.c_invoiceline il ON i.c_invoice_id = il.c_invoice_id
    WHERE
        i.ad_client_id =  $P{AD_CLIENT_ID} 
        AND i.issotrx = 'Y'
        AND i.dateinvoiced >  $P{FromDate} ::DATE  -  INTERVAL '30 days'
        AND i.dateinvoiced <  $P{ToDate} ::DATE -  INTERVAL '30 days'
    GROUP BY
        il.m_product_id
)
SELECT
    pr.name AS ProductName,pr.m_product_id,
    COALESCE(i.TotalQty, 0) AS TotalQty,
    ROUND(COALESCE(i.TotalNetAmount, 0), 2) AS TotalNetAmount,
    ROUND(COALESCE(s.AvailableQty, 0), 0) AS AQty,
    cl.name AS ClientName,
    ROUND(COALESCE(b.MaxPriceLimit * s.AvailableQty, 0), 2) AS AValue,
    ROUND(COALESCE(pp.TotalPQty, 0), 0) AS PQty
FROM
    adempiere.m_product pr
    LEFT JOIN InvoiceLineTotals i ON pr.m_product_id = i.m_product_id
    LEFT JOIN StorageOnHandTotals s ON pr.m_product_id = s.m_product_id
    LEFT JOIN BasePrice b ON pr.m_product_id = b.m_product_id
    LEFT JOIN PreviousMonth pp ON pr.m_product_id = pp.m_product_id
    JOIN adempiere.ad_client cl ON cl.ad_client_id = pr.ad_client_id
WHERE
    pr.ad_client_id =  $P{AD_CLIENT_ID} 
    AND ($P{ProductId} IS NULL OR
 pr.m_product_id = $P{ProductId})
ORDER BY
    pr.name


==================================================================================================================================================================
Transaction dashboard:-

sql = "SELECT COUNT(DISTINCT mi) AS inoutCount,\n"
                        + "(SELECT COUNT(a) FROM adempiere.m_inout a WHERE a.movementtype = 'V+' AND DATE(a.created) = DATE(NOW())) AS inCount,\n"
                        + "(SELECT COUNT(b) FROM adempiere.m_inout b WHERE b.movementtype = 'C-' AND DATE(b.created) = DATE(NOW())) AS outCount,\n"
                        + "(SELECT COUNT(DISTINCT c) FROM adempiere.m_movement c WHERE DATE(c.created) = DATE(NOW()) AND c.m_warehouse_id = c.m_warehouseto_id) AS internalMoveCount, \n"
                        + "(SELECT COUNT(d) FROM adempiere.m_inoutlineconfirm d WHERE qcfailedqty != 0.00 AND DATE(d.created) = DATE(NOW())) AS qc\n"
                        + "FROM adempiere.m_inout mi WHERE DATE(mi.created) = DATE(NOW()) AND mi.ad_client_id = "+ clientId +";";
            } else if (wareHouseId != 0 && productId == 0) {
                sql = "SELECT COUNT(DISTINCT mi) AS inoutCount,\n"
                        + "(SELECT COUNT(a) FROM adempiere.m_inout a WHERE a.movementtype = 'V+' AND a.m_warehouse_id = "+ wareHouseId +" AND DATE(a.created) = DATE(NOW())) AS inCount,\n"
                        + "(SELECT COUNT(b) FROM adempiere.m_inout b WHERE b.movementtype = 'C-' AND b.m_warehouse_id = "+ wareHouseId +" AND DATE(b.created) = DATE(NOW())) AS outCount,\n"
                        + "(SELECT COUNT(DISTINCT c) FROM adempiere.m_movement c WHERE DATE(c.created) = DATE(NOW()) AND c.m_warehouse_id = "+ wareHouseId +") AS internalMoveCount, \n"
                        + "(SELECT COUNT(d) FROM adempiere.m_inoutlineconfirm d JOIN adempiere.m_inoutline ili ON ili.m_inoutline_id = c.m_inoutline_id JOIN adempiere.m_inout ii ON ii.m_inout_id = ili.m_inout_id\n"
                        + "JOIN adempiere.m_warehouse whh ON whh.m_warehouse_id = ii.m_warehouse_id WHERE qcfailedqty != 0.00 AND whh.m_warehouse_id = "+ wareHouseId +" AND DATE(d.created) = DATE(NOW())) AS qc\n"
                        + "FROM adempiere.m_inout mi WHERE DATE(mi.created) = DATE(NOW()) AND mi.m_warehouse_id = "+ wareHouseId +" AND mi.ad_client_id = "+ clientId +";";
            } else if (wareHouseId == 0 && productId != 0) {
                sql = "SELECT COUNT(DISTINCT mi) as inoutCount,\n"
                        + "(SELECT COUNT(a) FROM m_inout a JOIN m_inoutline aa ON aa.m_inout_id = a.m_inout_id WHERE a.movementtype = 'V+' AND aa.M_product_id = "+productId+" AND DATE(a.created) = DATE(NOW())) as inCount,\n"
                        + "(SELECT COUNT(a) FROM m_inout a JOIN m_inoutline aa ON aa.m_inout_id = a.m_inout_id WHERE a.movementtype = 'C-' AND aa.m_product_id = "+productId+" AND DATE(a.created) = DATE(NOW())) as outCount,\n"
                        + "(SELECT COUNT(DISTINCT c) FROM m_movement c JOIN m_movementline cc ON cc.m_movement_id = c.m_movement_id WHERE DATE(c.created) = DATE(NOW()) AND cc.m_product_id = "+productId+") as internalMoveCount,\n"
                        + "(SELECT COUNT(d) FROM adempiere.m_inoutlineconfirm d JOIN adempiere.m_inoutline ili ON ili.m_inoutline_id = c.m_inoutline_id JOIN adempiere.m_inout ii ON ii.m_inout_id = ili.m_inout_id\n"
                        + "JOIN adempiere.m_product wh ON wh.m_product_id = ili.m_product_id WHERE qcfailedqty != 0.00 AND wh.m_product_id = "+productId+" AND DATE(d.created) = DATE(NOW())) AS qc\n"
                        + "FROM m_inout mi JOIN m_inoutline mil ON mil.m_inout_id = mi.m_inout_id WHERE DATE(mi.created) = DATE(NOW()) AND mi.ad_client_id = "+clientId+" AND mil.m_product_id = "+productId+";";
            }
            pstmt = DB.prepareStatement(sql.toString(), null);
            RS = pstmt.executeQuery();
            while (RS.next()) {
                inoutCount = RS.getString("inoutCount");
                inCount = RS.getString("inCount");
                outCount = RS.getString("outCount");
                internalMoveCount = RS.getString("internalMoveCount");
                qaRejections = RS.getString("qc");
            }

==================================================================================================================================================================
ReturnQty and allQty query:-

SELECT SUM(movementqty) AS AllQty,(SELECT SUM(movementqty) AS returnQty FROM adempiere.m_inout i JOIN adempiere.m_inoutline li ON li.m_inout_id = i.m_inout_id WHERE i.ad_client_id = 1000002 AND i.movementtype = 'C+')
FROM adempiere.m_inout i JOIN adempiere.m_inoutline li ON li.m_inout_id = i.m_inout_id WHERE i.ad_client_id = 1000002 AND i.movementtype = 'C-'

==================================================================================================================================================================
Return dashboard:-

String sql = null;
            String returnPendingSql = null;
            if (wareHouseId == 0 && productId == 0) {
                sql = "SELECT SUM(DISTINCT(movementqty))AS salesQty,SUM(DISTINCT(qtydelivered)) AS returnQty FROM adempiere.m_rma rm\n"
                        + "JOIN adempiere.m_inout ii ON ii.m_inout_id = rm.inout_id\n"
                        + "JOIN adempiere.m_inoutline ili ON ili.m_inout_id = rm.inout_id\n"
                        + "JOIN adempiere.m_rmaline rmli ON rmli.m_rma_id = rm.m_rma_id\n"
                        + "WHERE rm.ad_client_id = " + clientId + ";";
                
                returnPendingSql = "SELECT count(docStatus) from m_inout mi \n"
                        + "join c_docType cd on cd.c_docType_Id = mi.c_docType_Id\n"
                        + "where cd.name = 'MM Customer Return' and mi.docstatus = 'DR' and mi.ad_client_id=" + clientId
                        + ";";
            } else if (wareHouseId != 0 && productId == 0) {
                sql = "SELECT SUM(DISTINCT(movementqty))AS salesQty,SUM(DISTINCT(qtydelivered)) AS returnQty FROM adempiere.m_rma rm\n"
                        + "JOIN adempiere.m_inout ii ON ii.m_inout_id = rm.inout_id\n"
                        + "JOIN adempiere.m_inoutline ili ON ili.m_inout_id = rm.inout_id\n"
                        + "JOIN adempiere.m_rmaline rmli ON rmli.m_rma_id = rm.m_rma_id\n"
                        + "JOIN adempiere.m_warehouse wh ON wh.m_warehouse_id = ii.m_warehouse_id\n"
                        + "WHERE ii.m_warehouse_id = "+ wareHouseId +" AND rm.ad_client_id = "+ clientId +";";

                returnPendingSql = "SELECT count(docStatus) from m_inout mi \n"
                        + "join c_docType cd on cd.c_docType_Id = mi.c_docType_Id\n"
                        + "where cd.name = 'MM Customer Return' and mi.docstatus = 'DR' and mi.ad_client_id=" + clientId
                        + " and mi.m_warehouse_id =" + wareHouseId + ";";
            } else if (wareHouseId == 0 && productId != 0) {
                sql = "SELECT SUM(DISTINCT(movementqty))AS salesQty,SUM(DISTINCT rmli.qtydelivered) AS returnQty FROM adempiere.m_rma rm\n"
                        + "JOIN adempiere.m_inout ii ON ii.m_inout_id = rm.inout_id\n"
                        + "JOIN adempiere.m_inoutline ili ON ili.m_inout_id = rm.inout_id\n"
                        + "JOIN adempiere.m_rmaline rmli ON rmli.m_rma_id = rm.m_rma_id\n"
                        + "JOIN adempiere.m_product pd ON pd.m_product_id = rmli.m_product_id\n"
                        + "WHERE rm.ad_client_id = "+ clientId +" and rmli.m_product_id = "+ productId +"";

                returnPendingSql = "SELECT count(docStatus) from m_inout mi \n"
                        + "join c_docType cd on cd.c_docType_Id = mi.c_docType_Id\n"
                        + "join m_inoutline ml on ml.m_inout_id = mi.m_inout_id\n"
                        + "where cd.name = 'MM Customer Return' and mi.docstatus = 'DR' and mi.ad_client_id=" + clientId
                        + " and ml.m_product_id =" + productId + ";";
            }

==================================================================================================================================================================

CREATE VIEW adempiere.salesinvoicess AS
SELECT
    iv.c_order_id,
    iv.documentno AS Order_No,
    TO_CHAR(iv.DateOrdered, 'DD-Mon-YYYY') AS Date_Ordered,
    org.name AS OrgName,
    org_loc.address AS org_address,
    org_loc.city AS org_city,
    org_loc.regionname AS org_regionname,
    org_loc.countryname AS org_countryname,
    org_loc.postal AS org_postal,
    bp_loc.address AS bp_address,
    bp_loc.city AS bp_city,
    bp_loc.regionname AS bp_regionname,
    bp_loc.countryname AS bp_countryname,
    bp_loc.postal AS bp_postal,
    CASE
        WHEN ivl.m_product_id > 0 THEN mp.name
        ELSE cha.name
    END AS item,
    iv.totallines AS SubTotal,
    iv.grandtotal AS Total_Amount,
    (iv.grandtotal - iv.totallines) AS Tax_Amount,
    ivl.line AS Product_SNo,
    mp.name AS Product_Name,
    ivl.qtyordered AS Product_Qty_Invoiced,
    ROUND(ivl.priceentered, 2) AS Product_Price_Entered,
    cr.iso_code AS Product_Currency_Name,
    tax.name AS Product_Tax_Name,
    tax.rate AS Product_Tax_Rate,
    CASE
        WHEN tax.rate = 0.00 THEN 0.00
        ELSE (ivl.linenetamt * tax.rate / 100)
    END AS Product_Tax_Amount,
    mp.hsncode AS Product_HSN,
    ivl.linenetamt AS Product_Line_Amount,
    bp.name AS customer_name,
    adempiere.fnNumberToWords(iv.grandtotal::BIGINT) AS AmountInWord,
    cr.description AS currency_name,
    orginfo.phone,
    cli.gstno AS client_gstno,
    cli.panno AS client_panno,
    bp.gstno AS bp_gstno,
    bp.panno AS bp_panno,
    cr.cursymbol,
    cli.Name AS CompanyName
FROM adempiere.c_order iv
INNER JOIN adempiere.c_orderline ivl ON (iv.c_order_id = ivl.c_order_id)
LEFT JOIN adempiere.ad_image img ON (ivl.image_id = img.ad_image_id)
INNER JOIN adempiere.c_bpartner bp ON (bp.c_bpartner_id = iv.c_bpartner_id)
INNER JOIN adempiere.ad_client cli ON (cli.ad_client_id = iv.ad_client_id)
INNER JOIN adempiere.ad_org org ON (org.AD_Org_ID = iv.AD_Org_ID)
INNER JOIN adempiere.ad_orginfo orginfo ON (orginfo.AD_Org_ID = iv.AD_Org_ID)
LEFT JOIN adempiere.ad_image org_img ON (orginfo.Logo_ID = org_img.ad_image_id)
INNER JOIN adempiere.location_details org_loc ON (org_loc.c_location_id = orginfo.c_location_id)
INNER JOIN adempiere.c_bpartner_location bpl ON (bpl.c_bpartner_location_id = iv.c_bpartner_location_id)
INNER JOIN adempiere.m_warehouse wh ON (wh.m_warehouse_id = iv.m_warehouse_id)
INNER JOIN adempiere.location_details ware_loc ON (ware_loc.c_location_id = wh.c_location_id)
INNER JOIN adempiere.location_details bp_loc ON (bp_loc.c_location_id = bpl.c_location_id)
LEFT JOIN adempiere.m_product mp ON (mp.m_product_id = ivl.m_product_id)
LEFT JOIN adempiere.c_charge cha ON (cha.c_charge_id = ivl.c_charge_id)
INNER JOIN adempiere.c_uom uom ON (uom.c_uom_id = ivl.c_uom_id)
INNER JOIN adempiere.c_tax tax ON (tax.c_tax_id = ivl.c_tax_id)
INNER JOIN adempiere.c_currency cr ON (cr.c_currency_id = iv.c_currency_id)
ORDER BY ivl.line;




==================================================================================================================================================================
Jasper Report for if condtion:-
$F{city}==null ? '-' : $F{city} 



==================================================================================================================================================================
Material receipt Reports:-

SELECT i.documentno, i.movementdate, b.name as bpname, b.value as bpvalue, loc.address1,loc.address2, loc.postal, loc.city, c.name as country,ili.qcfailedqty,ili.line,orginfo.phone, orginfo.fax, orginfo.email, orgloc.address1 as orgaddress, orgloc.city as orgcity, orgloc.postal as orgpostal, org.name as orgname, img.binarydata as orglogo,cor.documentno AS SalesOrderNo,wh.name AS warehouseName from adempiere.m_inout i 
join adempiere.c_bpartner b on b.c_bpartner_id=i.c_bpartner_id
join adempiere.c_bpartner_location bploc on bploc.c_bpartner_location_id=i.c_bpartner_location_id
join adempiere.c_location loc on loc.c_location_id=bploc.c_location_id
join adempiere.c_country c on c.c_country_id=loc.c_country_id
join adempiere.ad_orginfo orginfo on orginfo.ad_org_id=i.ad_org_id
join adempiere.c_location orgloc on orgloc.c_location_id=orginfo.c_location_id
join adempiere.ad_org org on org.ad_org_id=i.ad_org_id
left join adempiere.ad_image img on img.ad_image_id =orginfo.logo_id
join adempiere.c_order cor ON cor.c_order_id = i.c_order_id 
join adempiere.m_warehouse wh ON wh.m_warehouse_id = i.m_warehouse_id
join adempiere.m_inoutline ili ON ili.m_inout_id = i.m_inout_id
where i.m_inout_id=1000280


select ili.line as pos, ili.movementqty,ili.qcfailedqty,pr.name as product from adempiere.m_inoutline ili
join adempiere.m_product pr on pr.m_product_id = ili.m_product_id
where ili.m_inout_id= 1000280
ORDER BY ili.line

select * from adempiere.m_inoutline

SELECT i.documentno, i.movementdate, b.name as bpname, b.value as bpvalue, loc.address1,loc.address2, loc.postal, loc.city, c.name as country,ili.qcfailedqty,ili.line,orginfo.phone, orginfo.fax, orginfo.email, orgloc.address1 as orgaddress, orgloc.city as orgcity, orgloc.postal as orgpostal, org.name as orgname, img.binarydata as orglogo,cor.documentno AS SalesOrderNo,wh.name AS warehouseName from adempiere.m_inout i 
join adempiere.c_bpartner b on b.c_bpartner_id=i.c_bpartner_id
join adempiere.c_bpartner_location bploc on bploc.c_bpartner_location_id=i.c_bpartner_location_id
join adempiere.c_location loc on loc.c_location_id=bploc.c_location_id
join adempiere.c_country c on c.c_country_id=loc.c_country_id
join adempiere.ad_orginfo orginfo on orginfo.ad_org_id=i.ad_org_id
join adempiere.c_location orgloc on orgloc.c_location_id=orginfo.c_location_id
join adempiere.ad_org org on org.ad_org_id=i.ad_org_id
left join adempiere.ad_image img on img.ad_image_id =orginfo.logo_id
join adempiere.c_order cor ON cor.c_order_id = i.c_order_id 
join adempiere.m_warehouse wh ON wh.m_warehouse_id = i.m_warehouse_id
join adempiere.m_inoutline ili ON ili.m_inout_id = i.m_inout_id
where i.m_inout_id=1000280


==================================================================================================================================================================
update all doc action in material receipt windows:-
UPDATE adempiere.m_inout
SET DocStatus = 'CO'
WHERE DocStatus = 'DR' and ad_client_id = 1000002 and issotrx = 'N';

==================================================================================================================================================================
Material Receipt remove records:-

select * from adempiere.m_inout where documentno ='1000551' and ad_client_id = 1000002

DELETE FROM adempiere.m_inout WHERE documentno = '1000551' and ad_client_id = 1000002;

select * from adempiere.m_inoutline where m_inoutline_id = 1002577 and ad_client_id = 1000002;

delete from adempiere.m_inoutline where m_inoutline_id = 1002577 and ad_client_id = 1000002;

delete from adempiere.m_transaction where m_inoutline_id = 1002577 and ad_client_id = 1000002;

delete from adempiere.m_matchpo where m_inoutline_id = 1002577 and ad_client_id = 1000002;

select * from adempiere.m_matchpo where m_inoutline_id = 1002577 and ad_client_id = 1000002;

select * from adempiere.m_transaction where m_inoutline_id = 1002577 and ad_client_id = 1000002;

==================================================================================================================================================================
Near Expiry Product list not randomly product show:-

CREATE OR REPLACE VIEW adempiere.NearExpiryProductLists AS
SELECT 
    b.name AS product_name,
    a.expirydate AS expiry_date,
    e.qtyonhand AS quantity,
    att.lot AS lot_no,
    wh.value AS warehouse_name,
    ll.value AS locator_name,
    f.ad_client_id,
    f.ad_org_id
FROM 
    adempiere.c_orderline a
JOIN 
    adempiere.m_product b ON a.m_product_id = b.m_product_id
JOIN 
    adempiere.m_inoutline mil ON mil.c_orderline_id = a.c_orderline_id
JOIN 
    adempiere.m_storageonhand e ON mil.m_attributesetinstance_id = e.m_attributesetinstance_id
JOIN 
    adempiere.m_attributesetinstance att ON att.m_attributesetinstance_id = e.m_attributesetinstance_id
JOIN 
    adempiere.c_order f ON f.c_order_id = a.c_order_id
JOIN 
    adempiere.m_warehouse wh ON wh.m_warehouse_id = f.m_warehouse_id
JOIN 
    adempiere.m_locator ll ON ll.m_locator_id = e.m_locator_id
WHERE 
    f.issotrx = 'N' 
    AND a.expirydate >= CURRENT_DATE 
    AND a.expirydate IS NOT NULL      
    AND att.lot IS NOT NULL AND e.qtyonhand > 0;


==================================================================================================================================================================
Expiry Product List:-

CREATE OR REPLACE VIEW adempiere.ExpiryProductDetails AS
   SELECT b.name AS product_name,
    a.expirydate AS expiry_date,
    e.qtyonhand AS quantity,
    att.lot AS lot_no,
    wh.value AS warehouse_name,
    ll.value AS locator_name,
    f.ad_client_id,
    f.ad_org_id
   FROM adempiere.c_orderline a
     JOIN adempiere.m_product b ON a.m_product_id = b.m_product_id
     JOIN adempiere.m_inoutline mil ON mil.c_orderline_id = a.c_orderline_id
     JOIN adempiere.m_storageonhand e ON mil.m_attributesetinstance_id = e.m_attributesetinstance_id
     JOIN adempiere.m_attributesetinstance att ON att.m_attributesetinstance_id = e.m_attributesetinstance_id
     JOIN adempiere.c_order f ON f.c_order_id = a.c_order_id
     JOIN adempiere.m_warehouse wh ON wh.m_warehouse_id = f.m_warehouse_id
     JOIN adempiere.m_locator ll ON ll.m_locator_id = e.m_locator_id
  WHERE f.issotrx = 'N' AND a.expirydate < CURRENT_DATE AND a.expirydate IS NOT NULL      
    AND att.lot IS NOT NULL AND e.qtyonhand > 0;


==================================================================================================================================================================
Customer list with overdue days:-

 SELECT inv.c_invoice_id AS invoice_id,
    bp.name AS customer_name,
    to_char(inv.dateinvoiced, 'DD/MM/YYYY'::text) AS invoice_date,
    inv.grandtotal AS total_amount,
    inv.ad_client_id,
    inv.ad_org_id,
    (CURRENT_DATE - 42)::timestamp without time zone - inv.dateinvoiced AS overduedays
   FROM adempiere.c_invoice inv
     JOIN adempiere.c_bpartner bp ON bp.c_bpartner_id = inv.c_bpartner_id
  WHERE inv.ispaid = 'N' AND inv.issotrx = 'Y' AND inv.dateinvoiced <= (CURRENT_DATE - 42) and inv.ad_client_id = 1000002;

==================================================================================================================================================================
Added Favourite in dashboard:-

INSERT INTO adempiere.ad_tree_favorite_node(ad_client_id,ad_menu_id,ad_org_id,ad_tree_favorite_id, ad_tree_favorite_node_id,
seqno,createdby,updatedby,isfavourite) Values(1000002,205,1000004,1000012,1000012,1111100,1000002,1000002,'Y');


==================================================================================================================================================================
Added 5 records:-

INSERT INTO adempiere.ad_tree_favorite_node(ad_client_id,ad_menu_id,ad_org_id,ad_tree_favorite_id, ad_tree_favorite_node_id,
seqno,createdby,updatedby,isfavourite) Values(1000002,205,1000004,1000012,1000012,1111100,1000002,1000002,'Y'),
(1000002,204,1000004,1000012,1000012,1111100,1000002,1000002,'Y'),(1000002,129,1000004,1000012,1000012,1111100,1000002,1000002,'Y'),
(1000002,180,1000004,1000012,1000012,1111100,1000002,1000002,'Y'),(1000002,178,1000004,1000012,1000012,1111100,1000002,1000002,'Y');




==================================================================================================================================================================
qcfailedqty check:-

select m.m_inout_id,mli.m_product_id,mli.movementqty,mli.qcfailedqty,(mli.movementqty - mli.qcfailedqty) AS substralQty from adempiere.m_inout m
JOIN adempiere.m_inoutline mli ON mli.m_inout_id = m.m_inout_id
where m.ad_client_id = 1000002 and m.issotrx = 'N' and DATE(m.created) = DATE(NOW())


==================================================================================================================================================================
Warehouse list Query:-

SELECT w.m_warehouse_id AS warehouseID,w.name AS warehouseName,ml.m_locator_id AS locatorID,ml.value AS locatorValue,
ml.isdefault,CASE WHEN COALESCE(ms.TotalQty, 0) = 0 THEN 'false' ELSE 'true' END AS booleanValue,
COALESCE(ms.TotalQty, 0) AS TotalQty,((SELECT COUNT(*)FROM adempiere.M_Locator
WHERE m_warehouse_id = w.m_warehouse_id) - (SELECT COUNT(*)FROM adempiere.M_Locator l
LEFT JOIN (SELECT M_Locator_ID, COALESCE(SUM(QtyOnHand), 0) AS TotalQty FROM adempiere.M_StorageOnHand
GROUP BY M_Locator_ID) ms ON l.M_Locator_ID = ms.M_Locator_ID WHERE l.m_warehouse_id = w.m_warehouse_id
AND COALESCE(ms.TotalQty, 0) = 0)) * 100 / (SELECT COUNT(*)FROM adempiere.M_Locator
WHERE m_warehouse_id = w.m_warehouse_id) AS occupancy_percentage,lt.name AS locator_type
FROM adempiere.m_warehouse w JOIN adempiere.m_locator ml ON ml.m_warehouse_id = w.m_warehouse_id
JOIN adempiere.m_locatortype lt ON ml.m_locatortype_id = lt.m_locatortype_id
LEFT JOIN (SELECT M_Locator_ID, COALESCE(SUM(QtyOnHand), 0) AS TotalQty FROM adempiere.M_StorageOnHand
GROUP BY M_Locator_ID) ms ON ml.m_locator_id = ms.M_Locator_ID
WHERE ml.ad_client_id = 1000002
group by w.m_warehouse_id, w.name,ml.m_locator_id, lt.name, ml.value,ms.TotalQty, ml.isdefault;

==================================================================================================================================================================


==================================================================================================================================================================
"SELECT \n" + "    w.m_warehouse_id as warehouseID,\n" + "    w.name as warehouseName,\n"
          + " ml.isdefault,\n" + "    (SELECT COUNT(*) FROM adempiere.M_Locator l\n" + "     LEFT JOIN (\n"
          + "         SELECT M_Locator_ID, COALESCE(SUM(QtyOnHand), 0) AS TotalQty\n"
          + "         FROM adempiere.M_StorageOnHand\n" + "         GROUP BY M_Locator_ID\n"
          + "     ) ms ON l.M_Locator_ID = ms.M_Locator_ID\n"
          + "     WHERE l.m_warehouse_id = w.m_warehouse_id\n"
          + "     AND COALESCE(ms.TotalQty, 0) = 0) AS emptyCount,\n"
          + "    (SELECT COUNT(*) FROM adempiere.m_locator WHERE m_warehouse_id = w.m_warehouse_id) AS total_count,\n"
          + "    lt.name AS locator_type,\n" + "    ml.value AS location_values,\n"
          + "    ((SELECT COUNT(*) FROM adempiere.m_locator WHERE m_warehouse_id = w.m_warehouse_id) - \n"
          + "     (SELECT COUNT(*) FROM adempiere.M_Locator l\n" + "      LEFT JOIN (\n"
          + "          SELECT M_Locator_ID, COALESCE(SUM(QtyOnHand), 0) AS TotalQty\n"
          + "          FROM adempiere.M_StorageOnHand\n" + "          GROUP BY M_Locator_ID\n"
          + "      ) ms ON l.M_Locator_ID = ms.M_Locator_ID\n"
          + "      WHERE l.m_warehouse_id = w.m_warehouse_id\n" + "      AND COALESCE(ms.TotalQty, 0) = 0) \n"
          + "    ) * 100 / (SELECT COUNT(*) FROM adempiere.m_locator WHERE m_warehouse_id = w.m_warehouse_id) AS occupancy_percentage\n"
          + "FROM \n" + "    adempiere.m_warehouse w\n" + "JOIN \n"
          + "    adempiere.m_locator ml ON ml.m_warehouse_id = w.m_warehouse_id\n" + "JOIN \n"
          + "    adempiere.m_locatortype lt ON ml.m_locatortype_id = lt.m_locatortype_id\n" + "WHERE \n"
          + "    ml.ad_client_id = " + ad_client_id + "\n" + "GROUP BY \n"
          + "    w.m_warehouse_id, w.name, lt.name,ml.value,ml.isdefault;"

==================================================================================================================================================================
-- Create pi_qrRelations table in PostgreSQL
CREATE TABLE adempiere.pi_qrRelations (
    pi_qrRelations_id SERIAL PRIMARY KEY,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    isShippedOut NUMERIC(10,0),
    pstatus text,
    quantity NUMERIC,
    isInLocator NUMERIC(10,0),
    productId NUMERIC(10,0),
    locatorId NUMERIC(10,0),
    cOrderlineId NUMERIC(10,0),
    mInoutlineId NUMERIC(10,0),
    palletUUId varchar(255),
    FOREIGN KEY (ad_client_id) REFERENCES adempiere.ad_client(ad_client_id),
    FOREIGN KEY (ad_org_id) REFERENCES adempiere.ad_org(ad_org_id),
    FOREIGN KEY (createdby) REFERENCES adempiere.ad_user(ad_user_id),
    FOREIGN KEY (updatedby) REFERENCES adempiere.ad_user(ad_user_id),
    FOREIGN KEY (productId) REFERENCES adempiere.m_product(m_product_id),
    FOREIGN KEY (cOrderlineId) REFERENCES adempiere.c_orderline(c_orderline_id),
    FOREIGN KEY (mInoutlineId) REFERENCES adempiere.m_inoutline(m_inoutline_id)
);

==================================================================================================================================================================
Working Table:-
CREATE TABLE adempiere.c_farmer (
    c_farmer_id numeric(10,0) NOT NULL PRIMARY KEY,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    FarmerName VARCHAR(25) NOT NULL,
    Created TIMESTAMP without time zone DEFAULT now() not null,
    Createdby numeric(10,0) not null,
    Updated TIMESTAMP without time zone DEFAULT now() not null,
    Updatedby NUMERIC(10,0) not null,
    Description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,  
    Address VARCHAR(255),
    Landmark VARCHAR(100),
    SurveyNumber VARCHAR(10),
    VillageName VARCHAR(50),
    MobileNo NUMERIC(10));


==================================================================================================================================================================
One Table relation two another table:-

CREATE TABLE adempiere.c_kishan (
    c_kishan_id numeric(10,0) NOT NULL PRIMARY KEY,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    KishanName VARCHAR(25) NOT NULL,
    Created TIMESTAMP without time zone DEFAULT now() not null,
    Createdby numeric(10,0) not null,
    Updated TIMESTAMP without time zone DEFAULT now() not null,
    Updatedby NUMERIC(10,0) not null,
    Description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,  
    isdefault character(1) NOT NULL DEFAULT 'N'::bpchar);
  short table to added specific records like (name,id,etc)

CREATE TABLE adempiere.c_farmlist (
    c_farmlist_id numeric(10,0) NOT NULL PRIMARY KEY,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    FarmerName VARCHAR(25) NOT NULL,
    Created TIMESTAMP without time zone DEFAULT now() not null,
    Createdby numeric(10,0) not null,
    Updated TIMESTAMP without time zone DEFAULT now() not null,
    Updatedby NUMERIC(10,0) not null,
    Description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    isdefault character(1) NOT NULL DEFAULT 'N'::bpchar,
    c_kishan_id numeric(10,0),
    FOREIGN KEY (c_kishan_id) REFERENCES adempiere.c_kishan(c_kishan_id));
this table a main table and this table multiple child like show list last two line added this methods

both two table created Table & Column, Window,Tab and Field Window 

above line done then created Reference window(this records important otherwise not show list view in other table)

Mandotory fields:-
Name(show in Reference_key),EntiryType = UserMaintain,Validaion = Table Validation and save 

bottom see Table Validation tab create a new records
Mandotory Field:-
Table - Name of Table like c_kishan
Key_Column - c_kishan_id
Display Column - KishanName (Your Requirement what are you Display in list)
sql where - c_kishan.c_kishan_id<>0 


==================================================================================================================================================================


CREATE TABLE adempiere.c_variety (
    c_variety_id numeric(10,0) NOT NULL PRIMARY KEY,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    VarietyName VARCHAR(25) NOT NULL,
    CodeNo NUMERIC(10, 0) NOT NULL,
    Created TIMESTAMP without time zone DEFAULT now() not null,
    Createdby numeric(10,0) not null,
    Updated TIMESTAMP without time zone DEFAULT now() not null,
    Updatedby NUMERIC(10,0) not null,
    Description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,  
    isdefault character(1) NOT NULL DEFAULT 'N'::bpchar);
    
    
    CREATE TABLE adempiere.c_species (
    c_species_id numeric(10,0) NOT NULL PRIMARY KEY,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    PlantSpeciesName VARCHAR(25) NOT NULL,
    CodeNo NUMERIC(10, 0) NOT NULL, 
    Created TIMESTAMP without time zone DEFAULT now() not null,
    Createdby numeric(10,0) not null,
    Updated TIMESTAMP without time zone DEFAULT now() not null,
    Updatedby NUMERIC(10,0) not null,
    Description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    isdefault character(1) NOT NULL DEFAULT 'N'::bpchar,
    c_variety_id numeric(10,0),
    FOREIGN KEY (c_variety_id) REFERENCES adempiere.c_variety(c_variety_id));
    
    CREATE TABLE adempiere.c_plant (
    c_plant_id numeric(10,0) NOT NULL PRIMARY KEY,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    PlantName VARCHAR(25) NOT NULL,
    Created TIMESTAMP without time zone DEFAULT now() not null,
    Createdby numeric(10,0) not null,
    Updated TIMESTAMP without time zone DEFAULT now() not null,
    Updatedby NUMERIC(10,0) not null,
    Description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    isdefault character(1) NOT NULL DEFAULT 'N'::bpchar,
    c_species_id numeric(10,0),
    c_species_ids numeric(10,0),
    FOREIGN KEY (c_species_id) REFERENCES adempiere.c_species(c_species_id),
    FOREIGN KEY (c_species_ids) REFERENCES adempiere.c_species(c_species_id));

CREATE TABLE adempiere.pi_productLabelss (
    pi_productLabelss_ID SERIAL PRIMARY KEY,
    ad_client_ID NUMERIC(10, 0) NOT NULL,
    ad_org_ID NUMERIC(10, 0) NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    qcPassed varchar(1),
    quantity NUMERIC,
    m_product_ID NUMERIC(10,0),
    m_locator_ID NUMERIC(10,0),
    c_orderline_ID NUMERIC(10,0) NULL,
    m_inoutline_ID NUMERIC(10,0) NULL,
    issotrx varchar(1),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    labelUUId varchar(255),
    FOREIGN KEY (ad_client_iD) REFERENCES adempiere.ad_client(ad_client_id),
    FOREIGN KEY (ad_org_iD) REFERENCES adempiere.ad_org(ad_org_id),
    FOREIGN KEY (createdby) REFERENCES adempiere.ad_user(ad_user_id),
    FOREIGN KEY (updatedby) REFERENCES adempiere.ad_user(ad_user_id),
    FOREIGN KEY (m_product_ID) REFERENCES adempiere.m_product(m_product_id),
    FOREIGN KEY (m_locator_ID) REFERENCES adempiere.m_locator(m_locator_ID),
    FOREIGN KEY (c_orderline_ID) REFERENCES adempiere.c_orderline(c_orderline_id),
    FOREIGN KEY (m_inoutline_ID) REFERENCES adempiere.m_inoutline(m_inoutline_id)
);
// If not use in isactive field window is not proper working


==================================================================================================================================================================
Stock checked:-

SELECT EXTRACT(DAY FROM CURRENT_DATE - i.created) AS stockCheckDays
FROM adempiere.m_inventory i 
JOIN adempiere.m_inventoryline li ON i.m_inventory_id = li.m_inventory_id
WHERE i.ad_client_id = 1000002
ORDER BY i.created DESC
LIMIT 1;


==================================================================================================================================================================
CREATE TABLE adempiere.pi_productLabel (
    pi_productLabel_ID SERIAL PRIMARY KEY,
    ad_client_ID NUMERIC(10, 0) NOT NULL,
    ad_org_ID NUMERIC(10, 0) NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    isShippedOut NUMERIC(10,0),
    pstatus text,
    quantity NUMERIC,
    isInLocator NUMERIC(10,0),
    m_product_ID NUMERIC(10,0),
    locatorId NUMERIC(10,0),
    c_orderline_Id NUMERIC(10,0),
    m_inoutline_Id NUMERIC(10,0),
    labelUUId varchar(255),
    FOREIGN KEY (ad_client_id) REFERENCES adempiere.ad_client(ad_client_id),
    FOREIGN KEY (ad_org_id) REFERENCES adempiere.ad_org(ad_org_id),
    FOREIGN KEY (createdby) REFERENCES adempiere.ad_user(ad_user_id),
    FOREIGN KEY (updatedby) REFERENCES adempiere.ad_user(ad_user_id),
    FOREIGN KEY (m_product_ID) REFERENCES adempiere.m_product(m_product_id),
    FOREIGN KEY (c_orderline_Id) REFERENCES adempiere.c_orderline(c_orderline_id),
    FOREIGN KEY (m_inoutline_Id) REFERENCES adempiere.m_inoutline(m_inoutline_id)
);


==================================================================================================================================================================
locator wise product list:-

SELECT ly.name AS locatorTypeName,SUM(sh.qtyonhand) AS Qty FROM adempiere.m_locatortype ly 
JOIN adempiere.m_locator lo ON lo.m_locatortype_id = ly.m_locatortype_id
JOIN adempiere.m_storageonhand sh ON sh.m_locator_id = lo.m_locator_id
WHERE ly.ad_client_id = 1000002 GROUP BY ly.name

==================================================================================================================================================================
warehouse wise product list:-

SELECT wh.name AS warehouseName,SUM(sh.qtyonhand) AS Qty FROM adempiere.m_warehouse wh
JOIN adempiere.m_locator lo ON lo.m_warehouse_id = wh.m_warehouse_id
JOIN adempiere.m_storageonhand sh ON sh.m_locator_id = lo.m_locator_id
WHERE wh.ad_client_id = 1000002 GROUP BY wh.name



-------------------

SELECT 
    wh.name AS warehouseName,wh.m_warehouse_id ,
    COALESCE(SUM(sh.qtyonhand), 0) AS Qty 
FROM 
    adempiere.m_warehouse wh
LEFT JOIN 
    adempiere.m_locator lo ON lo.m_warehouse_id = wh.m_warehouse_id
LEFT JOIN 
    adempiere.m_storageonhand sh ON sh.m_locator_id = lo.m_locator_id
WHERE 
    wh.ad_client_id = 1000002 AND sh.m_product_id = 1000041 
GROUP BY 
    wh.name,wh.m_warehouse_id;


==================================================================================================================================================================
Merge of two or more  table:-
SELECT name,value,created,description FROM adempiere.m_product
UNION
SELECT name,value,created,description FROM adempiere.c_bpartner
UNION
SELECT name,value,created,description FROM adempiere.ad_user
where ad_client_id = 1000002 order by created desc;

==================================================================================================================================================================
Label Report View:-

CREATE VIEW adempiere.pi_productlabelviews AS
SELECT p.m_product_id,lo.m_warehouse_id,p.m_locator_id,p.m_inoutline_id,p.c_orderline_id,o.c_order_id,
p.labeluuid AS LabelUUID ,p.quantity AS Quantity,p.qcpassed,p.issotrx,p.created,p.ad_client_id,p.ad_org_id FROM adempiere.pi_productLabel p
JOIN adempiere.m_locator lo ON lo.m_locator_id = p.m_locator_id 
JOIN adempiere.m_warehouse wh ON wh.m_warehouse_id = lo.m_warehouse_id
JOIN adempiere.c_orderline li ON li.c_orderline_id = p.c_orderline_id
JOIN adempiere.c_order o ON o.c_order_id = li.c_order_id;


==================================================================================================================================================================



==================================================================================================================================================================



==================================================================================================================================================================


==================================================================================================================================================================



==================================================================================================================================================================


==================================================================================================================================================================



==================================================================================================================================================================


==================================================================================================================================================================


==================================================================================================================================================================


==================================================================================================================================================================
@Override
    public WarehouseLocatorListResponseDocument wareList(
            WarehouseLocatorListRequestDocument warehouseLocatorListRequestDocument) {
        WarehouseLocatorListResponseDocument warehouseLocatorListResponseDocument = WarehouseLocatorListResponseDocument.Factory
                .newInstance();
        WarehouseLocatorListResponse warehouseLocatorListResponse = warehouseLocatorListResponseDocument
                .addNewWarehouseLocatorListResponse();
        WarehouseLocatorListRequest warehouseLocatorListRequest = warehouseLocatorListRequestDocument
                .getWarehouseLocatorListRequest();
        ADLoginRequest loginReq = warehouseLocatorListRequest.getADLoginRequest();
        int ad_client_id = loginReq.getClientID();
        String serviceType = warehouseLocatorListRequest.getServiceType();
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            String err = login(loginReq, webServiceName, "wareList", serviceType);
            if (err != null && err.length() > 0) {
                warehouseLocatorListResponse.setError(err);
                warehouseLocatorListResponse.setIsError(true);
                return warehouseLocatorListResponseDocument;
            }
            if (!serviceType.equalsIgnoreCase("wareList")) {
                warehouseLocatorListResponse.setIsError(true);
                warehouseLocatorListResponse.setError("Service type " + serviceType + " not configured");
                return warehouseLocatorListResponseDocument;
            }

            String sql = "SELECT \n" + "    w.m_warehouse_id as warehouseID,\n" + "    w.name as warehouseName,\n"
                    + " ml.isdefault,\n" + "    (SELECT COUNT(*) FROM adempiere.M_Locator l\n" + "     LEFT JOIN (\n"
                    + "         SELECT M_Locator_ID, COALESCE(SUM(QtyOnHand), 0) AS TotalQty\n"
                    + "         FROM adempiere.M_StorageOnHand\n" + "         GROUP BY M_Locator_ID\n"
                    + "     ) ms ON l.M_Locator_ID = ms.M_Locator_ID\n"
                    + "     WHERE l.m_warehouse_id = w.m_warehouse_id\n"
                    + "     AND COALESCE(ms.TotalQty, 0) = 0) AS emptyCount,\n"
                    + "    (SELECT COUNT(*) FROM adempiere.m_locator WHERE m_warehouse_id = w.m_warehouse_id) AS total_count,\n"
                    + "    lt.name AS locator_type,\n" + "    ml.value AS location_values,\n"
                    + "    ((SELECT COUNT(*) FROM adempiere.m_locator WHERE m_warehouse_id = w.m_warehouse_id) - \n"
                    + "     (SELECT COUNT(*) FROM adempiere.M_Locator l\n" + "      LEFT JOIN (\n"
                    + "          SELECT M_Locator_ID, COALESCE(SUM(QtyOnHand), 0) AS TotalQty\n"
                    + "          FROM adempiere.M_StorageOnHand\n" + "          GROUP BY M_Locator_ID\n"
                    + "      ) ms ON l.M_Locator_ID = ms.M_Locator_ID\n"
                    + "      WHERE l.m_warehouse_id = w.m_warehouse_id\n" + "      AND COALESCE(ms.TotalQty, 0) = 0) \n"
                    + "    ) * 100 / (SELECT COUNT(*) FROM adempiere.m_locator WHERE m_warehouse_id = w.m_warehouse_id) AS occupancy_percentage\n"
                    + "FROM \n" + "    adempiere.m_warehouse w\n" + "JOIN \n"
                    + "    adempiere.m_locator ml ON ml.m_warehouse_id = w.m_warehouse_id\n" + "JOIN \n"
                    + "    adempiere.m_locatortype lt ON ml.m_locatortype_id = lt.m_locatortype_id\n" + "WHERE \n"
                    + "    ml.ad_client_id = " + ad_client_id + "\n" + "GROUP BY \n"
                    + "    w.m_warehouse_id, w.name, lt.name,ml.value,ml.isdefault;";
            pstm = DB.prepareStatement(sql.toString(), null);
            rs = pstm.executeQuery();

            List<Integer> warehouseIds = new ArrayList<>();

            while (rs.next()) {
                int warehouseId = rs.getInt("warehouseID");
                String warehouseName = rs.getString("warehouseName");
                int occupancyPercents = rs.getInt("occupancy_percentage");
                String locatorType = rs.getString("locator_type");
                String locatorName = rs.getString("location_values");

                if (!warehouseIds.contains(warehouseId)) {
                    WarehouseListAccess warehouseListAccess = warehouseLocatorListResponse.addNewWarehouseListAccess();
                    warehouseListAccess.setWarehouseId(warehouseId);
                    warehouseListAccess.setWarehouseName(warehouseName);
                    warehouseListAccess.setOccupancyPercentage(occupancyPercents);

                    LocationType locationType = warehouseListAccess.addNewLocations();
                    locationType.setLocatorTypeName(locatorType);

                    Locators locators = locationType.addNewLocators();
                    locators.setLocatorName(locatorName);
                    locators.setIsOccupied(false);
                    warehouseIds.add(warehouseId);
                } else {
                    WarehouseListAccess[] warehouseListAccessArray = warehouseLocatorListResponse
                            .getWarehouseListAccessArray();
                    for (WarehouseListAccess wLAcess : warehouseListAccessArray) {
                        if (wLAcess.getWarehouseId() == warehouseId) {
                            boolean flag = false;
                            LocationType[] LocationsArray = wLAcess.getLocationsArray();
                            for (LocationType lType : LocationsArray) {
                                if (lType.getLocatorTypeName().equals(locatorType)) {
                                    Locators locators = lType.addNewLocators();
                                    locators.setLocatorName(locatorName);
                                    locators.setIsOccupied(true);
                                    flag = true;
                                    break;
                                }
                            }
                            if (flag == false) {
                                LocationType locationType = wLAcess.addNewLocations();
                                locationType.setLocatorTypeName(locatorType);
                                Locators locators = locationType.addNewLocators();
                                locators.setLocatorName(locatorName);
                                locators.setIsOccupied(false);
                            }
                            break;
                        }
                    }
                }
            }

        } catch (Exception e) {
            warehouseLocatorListResponse.setError(e.getLocalizedMessage());
            warehouseLocatorListResponse.setIsError(true);
            return warehouseLocatorListResponseDocument;
        } finally {
            closeDbCon(pstm, rs);
            getCompiereService().disconnect();
        }
        return warehouseLocatorListResponseDocument;
    }



    ================================================    

    String sql = "SELECT \n" + "    w.m_warehouse_id as warehouseID,\n" + "    w.name as warehouseName,\n"
                    + " ml.isdefault,\n" + "    (SELECT COUNT(*) FROM adempiere.M_Locator l\n" + "     LEFT JOIN (\n"
                    + "         SELECT M_Locator_ID, COALESCE(SUM(QtyOnHand), 0) AS TotalQty\n"
                    + "         FROM adempiere.M_StorageOnHand\n" + "         GROUP BY M_Locator_ID\n"
                    + "     ) ms ON l.M_Locator_ID = ms.M_Locator_ID\n"
                    + "     WHERE l.m_warehouse_id = w.m_warehouse_id\n"
                    + "     AND COALESCE(ms.TotalQty, 0) = 0) AS emptyCount,\n"
                    + "    (SELECT COUNT(*) FROM adempiere.m_locator WHERE m_warehouse_id = w.m_warehouse_id) AS total_count,\n"
                    + "    lt.name AS locator_type,\n" + "    ml.value AS location_values,\n"
                    + "    ((SELECT COUNT(*) FROM adempiere.m_locator WHERE m_warehouse_id = w.m_warehouse_id) - \n"
                    + "     (SELECT COUNT(*) FROM adempiere.M_Locator l\n" + "      LEFT JOIN (\n"
                    + "          SELECT M_Locator_ID, COALESCE(SUM(QtyOnHand), 0) AS TotalQty\n"
                    + "          FROM adempiere.M_StorageOnHand\n" + "          GROUP BY M_Locator_ID\n"
                    + "      ) ms ON l.M_Locator_ID = ms.M_Locator_ID\n"
                    + "      WHERE l.m_warehouse_id = w.m_warehouse_id\n" + "      AND COALESCE(ms.TotalQty, 0) = 0) \n"
                    + "    ) * 100 / (SELECT COUNT(*) FROM adempiere.m_locator WHERE m_warehouse_id = w.m_warehouse_id) AS occupancy_percentage\n"
                    + "FROM \n" + "    adempiere.m_warehouse w\n" + "JOIN \n"
                    + "    adempiere.m_locator ml ON ml.m_warehouse_id = w.m_warehouse_id\n" + "JOIN \n"
                    + "    adempiere.m_locatortype lt ON ml.m_locatortype_id = lt.m_locatortype_id\n" + "WHERE \n"
                    + "    ml.ad_client_id = " + ad_client_id + "\n" + "GROUP BY \n"
                    + "    w.m_warehouse_id, w.name, lt.name,ml.value,ml.isdefault;";


     ==================================================================================================
                    