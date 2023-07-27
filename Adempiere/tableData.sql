CREATE TABLE adempiere.c_chirag (
c_chirag_id numeric(10,0) not null,
ad_client_id numeric(10,0) not null,
ad_org_id numeric(10,0) not null,
isactive character(1) default 'Y'::bpchar not null,
created timestamp without time zone default now() not null,
createdby numeric(10,0) not null,
updated timestamp without time zone default now() not null,
updatedby numeric(10,0) not null,	
value character varying(30) not null,
name character varying(255) not null,
start_date date not null,
start_time timestamp without time zone not null,
end_time timestamp without time zone not null,
chairperson character varying(80),
participants character varying(4000),
agenda character varying(4000),
discussion_detail character varying(8000));