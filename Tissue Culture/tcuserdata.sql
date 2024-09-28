WITH RECURSIVE cte AS (
  -- Anchor query
  SELECT l.parentuuid, l.tc_in_id, l.tc_out_id, l.c_uuid, lo.value AS location, l.created, l.cycleno, ps.name AS cropType, cs.name AS stage, v.name AS variety,
         l.personal_code, ts.temperature AS temp, ts.humidity AS humidity, 1 AS level
  FROM adempiere.tc_culturelabel l
  JOIN adempiere.tc_out o ON o.tc_out_id = l.tc_out_id
  JOIN adempiere.m_locator lo ON lo.m_locator_id = o.m_locator_id
  JOIN adempiere.tc_plantspecies ps ON ps.tc_plantspecies_id = l.tc_species_id
  JOIN adempiere.tc_culturestage cs ON cs.tc_culturestage_id = l.tc_culturestage_id
  JOIN adempiere.tc_variety v ON v.tc_variety_id = l.tc_species_ids
  JOIN adempiere.m_locatortype lt ON lt.m_locatortype_id = lo.m_locatortype_id
  JOIN (SELECT ts.m_locatortype_id, MAX(ts.created) AS max_created
       FROM adempiere.tc_temperaturestatus ts
       GROUP BY ts.m_locatortype_id) max_ts ON max_ts.m_locatortype_id = lo.m_locatortype_id
  JOIN adempiere.tc_temperaturestatus ts ON ts.m_locatortype_id = lo.m_locatortype_id AND ts.created = max_ts.max_created
  WHERE l.c_uuid =   $P{CultureLabelUUId} AND l.ad_client_id =  $P{AD_CLIENT_ID} 

  UNION ALL

  -- Recursive query
  SELECT t2.parentuuid, t2.tc_in_id, t2.tc_out_id, t2.c_uuid, lo.value AS location, t2.created, t2.cycleno, ps.name AS cropType, cs.name AS stage, v.name AS variety,
         t2.personal_code, ts.temperature AS temp, ts.humidity AS humidity, 2 AS level
  FROM cte t1
  JOIN adempiere.tc_culturelabel t2 ON t1.parentuuid = t2.c_uuid
  JOIN adempiere.tc_out o ON o.tc_out_id = t2.tc_out_id
  JOIN adempiere.m_locator lo ON lo.m_locator_id = o.m_locator_id
  JOIN adempiere.tc_plantspecies ps ON ps.tc_plantspecies_id = t2.tc_species_id
  JOIN adempiere.tc_culturestage cs ON cs.tc_culturestage_id = t2.tc_culturestage_id
  JOIN adempiere.tc_variety v ON v.tc_variety_id = t2.tc_species_ids
  JOIN adempiere.m_locatortype lt ON lt.m_locatortype_id = lo.m_locatortype_id
  JOIN (SELECT ts.m_locatortype_id, MAX(ts.created) AS max_created
       FROM adempiere.tc_temperaturestatus ts
       GROUP BY ts.m_locatortype_id) max_ts ON max_ts.m_locatortype_id = lo.m_locatortype_id
  JOIN adempiere.tc_temperaturestatus ts ON ts.m_locatortype_id = lo.m_locatortype_id AND ts.created = max_ts.max_created
)
SELECT * FROM cte;

List of user Data:-
List<PO> list = new Query(ctx, MElementValue.Table_Name, "name=? AND ad_client_id=?", trxName)
            .setParameters("Product asset", loginReq.getClientID())
            .setOrderBy(MElementValue.COLUMNNAME_C_ElementValue_ID).list();


Show all count:-
SELECT 
((SELECT count(*) FROM adempiere.tc_culturelabel WHERE ad_client_id = 1000000 AND DATE(created) = CURRENT_DATE) +
(SELECT count(*) FROM adempiere.tc_explantlabel WHERE ad_client_id = 1000000 AND DATE(created) = CURRENT_DATE) +
(SELECT count(*) FROM adempiere.tc_primaryhardeninglabel WHERE ad_client_id = 1000000 AND DATE(created) = CURRENT_DATE) +
(SELECT count(*) FROM adempiere.tc_secondaryhardeninglabel WHERE ad_client_id = 1000000 AND DATE(created) = CURRENT_DATE)) AS total_count;

WITH subquery AS(SELECT i.tc_in_id as id,i.m_product_id As productId,(SELECT COUNT(*) FROM adempiere.tc_out o WHERE o.tc_in_id = i.tc_in_id LIMIT 1)As query_column FROM adempiere.tc_in i
   WHERE ad_client_id = 1000000)
select count(*) FROM subquery
WHERE subquery.productId = 1000052 AND query_column = 0

WITH subquery AS (
    SELECT DISTINCT i.tc_in_id as id, i.m_product_id AS productId,
    (SELECT COUNT(*) FROM adempiere.tc_out o WHERE o.tc_in_id = i.tc_in_id LIMIT 1) AS query_column
    FROM adempiere.tc_in i
    JOIN adempiere.tc_plantdetails pd ON pd.planttaguuid = i.parentuuid
    JOIN adempiere.tc_collectionjoinplant cp ON cp.tc_plantdetails_id = pd.tc_plantdetails_id
    WHERE i.ad_client_id = 1000000
)
SELECT id, productId, query_column 
FROM subquery
WHERE subquery.productId = 1000052 AND query_column = 0;

WITH subquery AS (
SELECT DISTINCT i.tc_in_id as id, i.m_product_id AS productId,pr.name As productName,
(SELECT COUNT(*) FROM adempiere.tc_out o WHERE o.tc_in_id = i.tc_in_id LIMIT 1) AS query_column
FROM adempiere.tc_in i JOIN adempiere.tc_plantdetails pd ON pd.planttaguuid = i.parentuuid
JOIN adempiere.tc_collectionjoinplant cp ON cp.tc_plantdetails_id = pd.tc_plantdetails_id
JOIN adempiere.m_product pr ON pr.m_product_id = i.m_product_id WHERE i.ad_client_id = 1000000)
SELECT COUNT(*) FROM subquery WHERE subquery.productName = 'Plant Tag' AND query_column = 0;

WITH subquery AS(SELECT i.tc_in_id as id,i.m_product_id As productId,pr.description As productName,(SELECT COUNT(*) FROM adempiere.tc_out o WHERE o.tc_in_id = i.tc_in_id LIMIT 1)As query_column FROM adempiere.tc_in i
JOIN adempiere.m_product pr ON pr.m_product_id = i.m_product_id
WHERE i.ad_client_id = 1000000)
select id,productId,productName,query_column FROM subquery
WHERE subquery.productName ='Rooting' AND query_column = 0  

WITH subquery AS (
SELECT DISTINCT i.tc_in_id as id, i.m_product_id AS productId,pr.name As productName,i.quantity as qty,ps.codeno as croptype,v.codeno as variety,
Date(cp.created) as date,i.parentuuid as plantuuid,l.x As room,l.y as rack,l.z as column,'Explant Label' as label,(SELECT COUNT(*) FROM adempiere.tc_out o WHERE o.tc_in_id = i.tc_in_id LIMIT 1) AS query_column
FROM adempiere.tc_in i JOIN adempiere.tc_plantdetails pd ON pd.planttaguuid = i.parentuuid
JOIN adempiere.tc_collectionjoinplant cp ON cp.tc_plantdetails_id = pd.tc_plantdetails_id
JOIN adempiere.tc_plantspecies ps ON ps.tc_plantspecies_id = pd.tc_species_id
JOIN adempiere.tc_variety v ON v.tc_variety_id = pd.tc_species_ids
JOIN adempiere.m_locator l ON i.m_locator_id = l.m_locator_id  
JOIN adempiere.m_product pr ON pr.m_product_id = i.m_product_id WHERE i.ad_client_id = 1000000)
SELECT subquery.croptype || ' ' || subquery.variety || ' ' || subquery.date AS labelCode,subquery.productName AS stage,subquery.date As manufacturingDate,
subquery.room,subquery.rack,subquery.column,subquery.qty as count,subquery.id as tcId,subquery.label 
FROM subquery WHERE subquery.productName = 'Plant Tag' AND query_column = 0;


///working culture details query:-
WITH subquery AS (
    SELECT 
        ps.codeno || ' ' || v.codeno || ' ' || cl.parentcultureline || ' ' || TO_CHAR(cl.culturedate, 'DD-MM-YY') || ' ' || ns.codeno AS cultureCode,
        cs.name || ' - ' || cl.cycleno AS cycle,
        DATE(cl.created) AS manufacturingDate,
        DATE(cl.created + (cs.period::int * INTERVAL '1 day')) AS expiryDate,
        l.x AS room,
        l.y AS rack,
        l.z AS columns,
        cs.period AS period,
        (SELECT COUNT(*) FROM adempiere.tc_culturelabel cll WHERE cll.parentuuid = cl.c_uuid LIMIT 1) AS subquery_column,
        (SELECT i.tc_in_id FROM adempiere.tc_in i WHERE i.parentuuid = o.c_uuid LIMIT 1) AS tcId
    FROM 
        adempiere.tc_culturelabel cl
    JOIN 
        adempiere.tc_plantspecies ps ON ps.tc_plantspecies_id = cl.tc_species_id
    JOIN 
        adempiere.tc_variety v ON v.tc_variety_id = cl.tc_species_ids
    JOIN 
        adempiere.tc_naturesample ns ON ns.tc_naturesample_id = cl.tc_naturesample_id
    JOIN 
        adempiere.tc_in i ON i.tc_in_id = cl.tc_in_id
    JOIN 
        adempiere.tc_out o ON o.tc_out_id = cl.tc_out_id
    JOIN 
        adempiere.m_locator l ON l.m_locator_id = o.m_locator_id
    JOIN 
        adempiere.tc_culturestage cs ON cs.tc_culturestage_id = cl.tc_culturestage_id
    WHERE 
        cl.ad_client_id = 1000000
        AND cl.isdiscarded = 'N' 
        AND cl.tosubculturecheck = 'Y'
        AND cl.c_uuid IS NOT NULL 
        AND cl.parentuuid IS NOT NULL
)
SELECT 
    cultureCode,
    cycle,
    manufacturingDate,
    expiryDate,
    room,
    rack,
    columns,
    COUNT(*) AS count,
    period,
    tcId
FROM 
    subquery 
WHERE 
    subquery_column = 0 
    AND expiryDate <= current_date
GROUP BY 
    cycle, room, rack, columns, cultureCode, manufacturingDate, expiryDate, period, tcId
ORDER BY 
    expiryDate, cycle, room, rack, columns;

WITH subquery1 AS (
SELECT DISTINCT ps.codeno || ' ' || v.codeno || ' ' || Date(cp.created) AS labelCode,pr.name AS productName,Date(cp.created) AS manufacturingDate,
null::Date AS expiryDate,l.x AS room,l.y AS rack,l.z AS columns,i.quantity AS count,i.tc_in_id AS inId,
'Explant Label' AS label,(SELECT COUNT(*) FROM adempiere.tc_out o WHERE o.tc_in_id = i.tc_in_id LIMIT 1) AS query_column
FROM adempiere.tc_in i JOIN adempiere.tc_plantdetails pd ON pd.planttaguuid = i.parentuuid
JOIN adempiere.tc_collectionjoinplant cp ON cp.tc_plantdetails_id = pd.tc_plantdetails_id JOIN adempiere.tc_plantspecies ps ON ps.tc_plantspecies_id = pd.tc_species_id
JOIN adempiere.tc_variety v ON v.tc_variety_id = pd.tc_species_ids JOIN adempiere.m_locator l ON i.m_locator_id = l.m_locator_id 
JOIN adempiere.m_product pr ON pr.m_product_id = i.m_product_id WHERE i.ad_client_id = 1000000),
subquery2 AS (
SELECT ps.codeno || ' ' || v.codeno || ' ' || cl.parentcultureline || ' ' || Date(cl.created) AS labelCode,
cl.cycleno || ' ' || pr.description AS stage,Date(cl.created) AS manufacturingDate,Date(cl.created) AS expiryDate,
l.x AS room,l.y AS rack,l.z AS columns,i.quantity AS count,i.tc_in_id AS inId,'Culture Label' AS label,
(SELECT COUNT(*) FROM adempiere.tc_out o WHERE o.tc_in_id = i.tc_in_id LIMIT 1) AS query_column FROM adempiere.tc_in i
JOIN adempiere.tc_out o ON o.c_uuid = i.parentuuid JOIN adempiere.tc_culturelabel cl ON cl.tc_out_id = o.tc_out_id
JOIN adempiere.tc_plantspecies ps ON ps.tc_plantspecies_id = cl.tc_species_id JOIN adempiere.tc_variety v ON v.tc_variety_id = cl.tc_species_ids
JOIN adempiere.m_locator l ON i.m_locator_id = l.m_locator_id JOIN adempiere.m_product pr ON pr.m_product_id = i.m_product_id 
WHERE i.ad_client_id = 1000000 AND cl.isdiscarded = 'N' AND cl.tosubculturecheck = 'Y'),
subquery3 AS (
SELECT ps.codeno || ' ' || v.codeno || ' ' || cl.parentcultureline || ' ' || Date(cl.created) AS labelCode,
pr.name AS stage,Date(cl.created) AS manufacturingDate,null::Date AS expiryDate,
l.x AS room,l.y AS rack,l.z AS columns,i.quantity AS count,i.tc_in_id AS inId,'Primary Hardening Label' AS label,
(SELECT COUNT(*) FROM adempiere.tc_out o WHERE o.tc_in_id = i.tc_in_id LIMIT 1) AS query_column FROM adempiere.tc_in i
JOIN adempiere.tc_out o ON o.c_uuid = i.parentuuid JOIN adempiere.tc_primaryhardeninglabel cl ON cl.tc_out_id = o.tc_out_id
JOIN adempiere.tc_plantspecies ps ON ps.tc_plantspecies_id = cl.tc_species_id JOIN adempiere.tc_variety v ON v.tc_variety_id = cl.tc_species_ids
JOIN adempiere.m_locator l ON i.m_locator_id = l.m_locator_id JOIN adempiere.m_product pr ON pr.m_product_id = i.m_product_id WHERE i.ad_client_id = 1000000),
subquery4 AS (
SELECT ps.codeno || ' ' || v.codeno || ' ' || cl.parentcultureline || ' ' || Date(cl.culturedate) || ' ' || ns.codeno AS labelCode,cs.name || ' - ' || cl.cycleno AS stage,
DATE(cl.created) AS manufacturingDate,DATE(cl.created + (cs.period::int * INTERVAL '1 day')) AS expiryDate,l.x AS room,l.y AS rack,l.z AS columns,
COUNT(*) AS count,(SELECT i.tc_in_id FROM adempiere.tc_in i WHERE i.parentuuid = o.c_uuid LIMIT 1) AS inId,
'Culture Label' AS label,(SELECT COUNT(*) FROM adempiere.tc_culturelabel cll WHERE cll.parentuuid = cl.c_uuid LIMIT 1) AS subquery_column
FROM adempiere.tc_culturelabel cl JOIN adempiere.tc_plantspecies ps ON ps.tc_plantspecies_id = cl.tc_species_id
JOIN adempiere.tc_variety v ON v.tc_variety_id = cl.tc_species_ids JOIN adempiere.tc_naturesample ns ON ns.tc_naturesample_id = cl.tc_naturesample_id
JOIN adempiere.tc_in i ON i.tc_in_id = cl.tc_in_id JOIN adempiere.tc_out o ON o.tc_out_id = cl.tc_out_id
JOIN adempiere.m_locator l ON l.m_locator_id = o.m_locator_id JOIN adempiere.tc_culturestage cs ON cs.tc_culturestage_id = cl.tc_culturestage_id
WHERE cl.ad_client_id = 1000000 AND cl.isdiscarded = 'N' AND cl.tosubculturecheck = 'Y' AND cl.c_uuid IS NOT NULL AND cl.parentuuid IS NOT NULL
GROUP BY ps.codeno, v.codeno, cl.parentcultureline, cl.culturedate, ns.codeno, cs.name, cl.cycleno,cl.c_uuid, cl.created, l.x, l.y, l.z, o.c_uuid,cs.period)
SELECT * FROM subquery1 WHERE subquery1.productName = 'Plant Tag' AND query_column = 0
UNION ALL
SELECT * FROM subquery4 WHERE subquery_column = 0 AND expiryDate <= current_date
UNION ALL
SELECT * FROM subquery2 WHERE subquery2.stage = 'Rooting' AND query_column = 0
UNION ALL
SELECT * FROM subquery3 WHERE subquery3.stage = 'H01' AND query_column = 0;          

