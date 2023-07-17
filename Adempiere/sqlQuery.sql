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