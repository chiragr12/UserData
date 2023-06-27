CREATE TABLE chi_main (
chi_main_id numeric(10,0) not null,
chi_main_uu character varying(36) default null::character varying,
ad_client_id numeric(10,0) not null,
ad_org_id numeric(10,0) not null,
isactive character(1) not null default 'Y'::bpchar,
created timestamp without time zone default now() not null,
createdby numeric(10,0) not null,
updated timestamp without time zone default now() not null,
updatedby numeric(10,0) not null,	
value character varying(40) not null,
name character varying(255) not null,
description character varying(255),
m_product_id numeric(10,0),
constraint chi_main_pkey primary key (chi_main_id)
)
WITH (OIDS=FALSE);
ALTER TABLE chi_main OWNER TO adempiere;
CREATE UNIQUE INDEX chi_main_uu_idx ON chi_main
