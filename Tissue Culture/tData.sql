    farmer table:-

    CREATE TABLE adempiere.tc_farmer (
    tc_farmer_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_farmer_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),value varchar(25),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar,  
    address VARCHAR(255),
    landmark VARCHAR(100),
    surveyNo VARCHAR(10),
    villageName VARCHAR(50),
    mobileNo VARCHAR(10))
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,;


    ALTER TABLE adempiere.tc_farmer
ALTER COLUMN mobileno TYPE VARCHAR(10);

ALTER TABLE adempiere.tc_visit
ALTER COLUMN mobileno TYPE VARCHAR(10);


First Visit:-
     
     Field Selection Table:-
     
    CREATE TABLE adempiere.tc_fieldselection (
    tc_fieldselection_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_fieldselection_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(25),value varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar);
    
    Soil Type Table:-
 
    CREATE TABLE adempiere.tc_soiltype (
    tc_soiltype_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_soiltype_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(25),value varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar); 
    
    Watering Type Table:-   
     
    CREATE TABLE adempiere.tc_wateringtype (
    tc_wateringtype_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_wateringtype_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(25),value varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar); 
    
    Field Management Table:-
    
    CREATE TABLE adempiere.tc_fieldmanagement (
    tc_fieldmanagement_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_fieldmanagement_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(25),value varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar); 
    
    Visit Type Table:-
    
    CREATE TABLE adempiere.tc_visittype (
    tc_visittype_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_visittype_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(25),value varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar); 
    
    visit detils table:-
    
    CREATE TABLE adempiere.tc_visit (
    tc_visit_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_visit_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(30),value varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
    mobileNo NUMERIC(10,0),
    date DATE,
    tc_farmer_id NUMERIC(10,0),
    tc_visittype_id NUMERIC(10,0),
    tc_status_id NUMERIC(10,0),
    FOREIGN KEY (tc_status_id) REFERENCES adempiere.tc_status(tc_status_id),
    FOREIGN KEY (tc_visittype_id) REFERENCES adempiere.tc_visittype(tc_visittype_id),
    FOREIGN KEY (tc_farmer_id) REFERENCES adempiere.tc_farmer(tc_farmer_id)); 
    
    
    ALTER TABLE adempiere.tc_firstvisit ALTER COLUMN plantNo DROP NOT NULL;
    First Visit Table:-
    
    CREATE TABLE adempiere.tc_firstvisit (
    tc_firstvisit_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_firstvisit_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(30),value varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    plantNo NUMERIC(10, 0) NOT NULL,
    visitDate DATE,
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
    pestHistory VARCHAR(255),
    nextVisitDate DATE,
    tc_visit_id NUMERIC(10,0),
    tc_farmer_id NUMERIC(10,0),
    tc_fieldselection_id NUMERIC(10,0),
    tc_soiltype_id NUMERIC(10,0),
    tc_wateringtype_id NUMERIC(10,0),
    tc_fieldmanagement_id NUMERIC(10,0),
    FOREIGN KEY (tc_visit_id) REFERENCES adempiere.tc_visit(tc_visit_id),
    FOREIGN KEY (tc_farmer_id) REFERENCES adempiere.tc_farmer(tc_farmer_id),
    FOREIGN KEY (tc_fieldselection_id) REFERENCES
     adempiere.tc_fieldselection(tc_fieldselection_id),
    FOREIGN KEY (tc_soiltype_id) REFERENCES adempiere.tc_soiltype(tc_soiltype_id),
    FOREIGN KEY (tc_wateringtype_id) REFERENCES
     adempiere.tc_wateringtype(tc_wateringtype_id),
    FOREIGN KEY (tc_fieldmanagement_id) REFERENCES
     adempiere.tc_fieldmanagement(tc_fieldmanagement_id)); 

 Plant Details Table:-
     
    Plant Variety Table:-
    
    CREATE TABLE adempiere.tc_variety (
    tc_variety_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_variety_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(30),value varchar(25),
    codeNo VARCHAR(10) NOT NULL,
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault character(1) NOT NULL DEFAULT 'N'::bpchar);
    
         
    Plant Species Table:-
    
    CREATE TABLE adempiere.tc_plantspecies (
    tc_plantspecies_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_plantspecies_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(30),value varchar(25),
    codeNo VARCHAR(10) NOT NULL,
    varityCodeNo VARCHAR(10) NOT NULL,
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
    tc_variety_id NUMERIC(10,0),
    FOREIGN KEY (tc_variety_id) REFERENCES
     adempiere.tc_variety(tc_variety_id));
     
    Plant Details Table:-

    Alter table adempiere.tc_plantdetails
    Add column parentCultureLine VARCHAR(255);
    
    CREATE TABLE adempiere.tc_plantdetails (
    tc_plantdetails_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_plantdetails_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),value varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    codeNo VARCHAR(10),
    date DATE,
    parentCultureLine VARCHAR(255),
    tagNo VARCHAR(10),
    diseaseName VARCHAR(25),
    medicineDetails VARCHAR(255),
    description VARCHAR(255),
    height VARCHAR(10),
    stature VARCHAR(10),
    leavesNo NUMERIC(10,0),
    bunceWeight VARCHAR(10),
    weight VARCHAR(10),
    bunchesNo VARCHAR(10),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault character(1) NOT NULL DEFAULT 'N'::bpchar,
    isrejected CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
    tc_species_id NUMERIC(10,0),
    tc_species_ids NUMERIC(10,0),
    tc_farmer_id NUMERIC(10,0),
    FOREIGN KEY (tc_species_id) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_species_ids) REFERENCES
    adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_farmer_id) REFERENCES
     adempiere.tc_farmer(tc_farmer_id)); 

    ALTER TABLE adempiere.tc_plantdetails Add column plantTagUUId VARCHAR(36);
     
     
 Intermediate Visit:-
 
    Decision Table:-                   
     
    CREATE TABLE adempiere.tc_decision (
    tc_decision_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_decision_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),value varchar(25),
    reason VARCHAR(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar); 
    
    
    Intermediate Visit Table:-
    
    CREATE TABLE adempiere.tc_intermediatevisit (
    tc_intermediatevisit_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_intermediatevisit_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),value varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
    reviewDetails VARCHAR(255),
    reasonDetails VARCHAR(255),
    nextVisitDate DATE,
    tc_visit_id NUMERIC(10,0),
    tc_farmer_id NUMERIC(10,0),
    tc_decision_id NUMERIC(10,0),
    tc_firstvisit_id NUMERIC(10,0),
    FOREIGN KEY (tc_visit_id) REFERENCES adempiere.tc_visit(tc_visit_id),
    FOREIGN KEY (tc_farmer_id) REFERENCES adempiere.tc_farmer(tc_farmer_id),
    FOREIGN KEY (tc_firstvisit_id) REFERENCES
     adempiere.tc_firstvisit(tc_firstvisit_id),
    FOREIGN KEY (tc_decision_id) REFERENCES
     adempiere.tc_decision(tc_decision_id));
     
     Collection Details Table:-
     
     CREATE TABLE adempiere.tc_collectiondetails (
    tc_collectiondetails_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_collectiondetails_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),value varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    yieldWeight VARCHAR(255),
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
    tc_visit_id NUMERIC(10,0),
    tc_farmer_id NUMERIC(10,0),
    tc_intermediatevisit_id NUMERIC(10,0),
    tc_firstvisit_id NUMERIC(10,0),
    FOREIGN KEY (tc_visit_id) REFERENCES adempiere.tc_visit(tc_visit_id),
    FOREIGN KEY (tc_farmer_id) REFERENCES adempiere.tc_farmer(tc_farmer_id),
    FOREIGN KEY (tc_firstvisit_id) REFERENCES
     adempiere.tc_firstvisit(tc_firstvisit_id),
    FOREIGN KEY (tc_intermediatevisit_id) REFERENCES
     adempiere.tc_intermediatevisit(tc_intermediatevisit_id));


     //LabDate:-


     nature of sample table
    
    CREATE TABLE adempiere.tc_naturesample (
    tc_naturesample_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_naturesample_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),value varchar(25),
    codeNo VARCHAR(10),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar);
        
   Culture mini tables
        
    CREATE TABLE adempiere.tc_culturestage (
    tc_culturestage_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_culturestage_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),value varchar(25),
    codeNo VARCHAR(10),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar);
        
        CREATE TABLE adempiere.tc_virustesting (
        tc_virustesting_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        tc_virustesting_uu VARCHAR(36) DEFAULT NULL::bpchar,
        ad_client_id NUMERIC(10, 0) NOT NULL,
        ad_org_id NUMERIC(10, 0) NOT NULL,
        name varchar(25),value varchar(25),
        codeNo VARCHAR(10),
        created TIMESTAMP without time zone DEFAULT now() not null,
        createdby NUMERIC(10,0) not null,
        updated TIMESTAMP without time zone DEFAULT now() not null,
        updatedby NUMERIC(10,0) not null,
        description VARCHAR(255),
        isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
        c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
        isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar); 



    Explant table:-


   --  CREATE TABLE adempiere.tc_explantdetails (
   --  tc_explantdetails_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
   --  ad_client_id NUMERIC(10, 0) NOT NULL,
   --  ad_org_id NUMERIC(10, 0) NOT NULL,
   --  name varchar(25) ,value varchar(25),
   --  created TIMESTAMP without time zone DEFAULT now() not null,
   --  createdby NUMERIC(10,0) not null,
   --  updated TIMESTAMP without time zone DEFAULT now() not null,
   --  updatedby NUMERIC(10,0) not null,
   --  description VARCHAR(255),
   --  isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
   --  c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
   --  isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
   --  parentCultureLine VARCHAR(255),
   --  date DATE,
   --  tc_species_id NUMERIC(10,0),
   --  tc_species_ids NUMERIC(10,0),
   --  tc_naturesample_id NUMERIC(10,0),
   --  FOREIGN KEY (tc_species_id) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
   --  FOREIGN KEY (tc_species_ids) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
   --  FOREIGN KEY (tc_naturesample_id) REFERENCES
   --   adempiere.tc_naturesample(tc_naturesample_id)); 


   --  CREATE TABLE adempiere.tc_explantopedetails (
   --      tc_explantopedetails_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
   --      ad_client_id NUMERIC(10, 0) NOT NULL,
   --      ad_org_id NUMERIC(10, 0) NOT NULL,
   --      name varchar(25),value varchar(25),
   --      tcpf VARCHAR(25),
   --      created TIMESTAMP without time zone DEFAULT now() not null,
   --      createdby NUMERIC(10,0) not null,
   --      updated TIMESTAMP without time zone DEFAULT now() not null,
   --      updatedby NUMERIC(10,0) not null,
   --      description VARCHAR(255),
   --      isactive CHAR(1) not null DEFAULT 'Y'::bpchar, 
   --      c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
   --      isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar, 
   --      date DATE,
   --      personalCode VARCHAR(25));


        
   -- Culture Tables:-
        
   --  CREATE TABLE adempiere.tc_culturedetails (
   --  tc_culturedetails_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
   --  ad_client_id NUMERIC(10, 0) NOT NULL,
   --  ad_org_id NUMERIC(10, 0) NOT NULL,
   --  name varchar(25) ,value varchar(25),
   --  created TIMESTAMP without time zone DEFAULT now() not null,
   --  createdby NUMERIC(10,0) not null,
   --  updated TIMESTAMP without time zone DEFAULT now() not null,
   --  updatedby NUMERIC(10,0) not null,
   --  description VARCHAR(255),
   --  isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
   --  c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
   --  isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
   --  parentCultureLine VARCHAR(255),
   --  date DATE,
   --  cycleNo NUMERIC(10,0),
   --  tc_species_id NUMERIC(10,0),
   --  tc_species_ids NUMERIC(10,0),
   --  tc_naturesample_id NUMERIC(10,0),
   --  tc_culturestage_id NUMERIC(10,0),
   --  tc_virustesting_id NUMERIC(10,0),
   --  FOREIGN KEY (tc_species_id) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
   --  FOREIGN KEY (tc_species_ids) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
   --  FOREIGN KEY (tc_naturesample_id) REFERENCES
   --   adempiere.tc_naturesample(tc_naturesample_id),
   --  FOREIGN KEY (tc_culturestage_id) REFERENCES
   --   adempiere.tc_culturestage(tc_culturestage_id),
   --  FOREIGN KEY (tc_virustesting_id) REFERENCES
   --   adempiere.tc_virustesting(tc_virustesting_id)); 
     
   Operational Tabel:-
    
     CREATE TABLE adempiere.tc_machinetype (
        tc_machinetype_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        tc_machinetype_uu VARCHAR(36) DEFAULT NULL::bpchar,
        ad_client_id NUMERIC(10, 0) NOT NULL,
        ad_org_id NUMERIC(10, 0) NOT NULL,
        name varchar(25) NOT NULL,value varchar(25),
        machineCode VARCHAR(25),
        created TIMESTAMP without time zone DEFAULT now() not null,
        createdby NUMERIC(10,0) not null,
        updated TIMESTAMP without time zone DEFAULT now() not null,
        updatedby NUMERIC(10,0) not null,
        description VARCHAR(255),
        isactive CHAR(1) not null DEFAULT 'Y'::bpchar, 
        c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
        isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar);
    
    --     CREATE TABLE adempiere.tc_cultureoperationdetails (
    --     tc_cultureoperationdetails_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    --     ad_client_id NUMERIC(10, 0) NOT NULL,
    --     ad_org_id NUMERIC(10, 0) NOT NULL,
    --     name varchar(25) NOT NULL,value varchar(25),
    --     tcpf VARCHAR(25),
    --     created TIMESTAMP without time zone DEFAULT now() not null,
    --     createdby NUMERIC(10,0) not null,
    --     updated TIMESTAMP without time zone DEFAULT now() not null,
    --     updatedby NUMERIC(10,0) not null,
    --     description VARCHAR(255),
    --     isactive CHAR(1) not null DEFAULT 'Y'::bpchar, 
    --     c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    --     isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar, 
    --     date DATE,
    --     personal_code VARCHAR(25),
    --     tc_machinetype_id NUMERIC(10,0),
    -- FOREIGN KEY (tc_machinetype_id) REFERENCES adempiere.tc_machinetype(tc_machinetype_id));
        
        
        Media Type:-

        CREATE TABLE adempiere.tc_mediatype (
        tc_mediatype_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        tc_mediatype_uu VARCHAR(36) DEFAULT NULL::bpchar,
        ad_client_id NUMERIC(10, 0) NOT NULL,
        ad_org_id NUMERIC(10, 0) NOT NULL,name varchar(25) NOT NULL,value varchar(25),
        created TIMESTAMP without time zone DEFAULT now() not null,
        createdby NUMERIC(10,0) not null,
        updated TIMESTAMP without time zone DEFAULT now() not null,
        updatedby NUMERIC(10,0) not null,
        description VARCHAR(255),
        isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
        c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
        isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar);


   Media Details tabel:-
        
    --     CREATE TABLE adempiere.tc_mediadetails (
    --     tc_mediadetails_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    --     ad_client_id NUMERIC(10, 0) NOT NULL,
    --     ad_org_id NUMERIC(10, 0) NOT NULL,
    --     name varchar(25) NOT NULL,value varchar(25),
    --     created TIMESTAMP without time zone DEFAULT now() not null,
    --     createdby NUMERIC(10,0) not null,
    --     updated TIMESTAMP without time zone DEFAULT now() not null,
    --     updatedby NUMERIC(10,0) not null,
    --     description VARCHAR(255),
    --     isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    --     c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    --     isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar,tc_mediatype_id NUMERIC(10,0),
    -- FOREIGN KEY (tc_mediatype_id) REFERENCES adempiere.tc_mediatype(tc_mediatype_id));
        
        
    Growth Room Table:-
        
        mini table
        
        CREATE TABLE adempiere.tc_roomnumber (
        tc_roomnumber_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        ad_client_id NUMERIC(10, 0) NOT NULL,
        ad_org_id NUMERIC(10, 0) NOT NULL,
        name varchar(25) NOT NULL,value varchar(25),
        roomNo NUMERIC(10, 0) NOT NULL,
        created TIMESTAMP without time zone DEFAULT now() not null,
        createdby NUMERIC(10,0) not null,
        updated TIMESTAMP without time zone DEFAULT now() not null,
        updatedby NUMERIC(10,0) not null,
        description VARCHAR(255),
        isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
        c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
        isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar);

        ALTER TABLE adempiere.tc_roomnumber
      ALTER COLUMN roomNo TYPE VARCHAR(10);

        
    storage details:-

    this table replace with locator table 
        
        -- CREATE TABLE adempiere.tc_storagedetails (
        -- tc_storagedetails_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        -- ad_client_id NUMERIC(10, 0) NOT NULL,
        -- ad_org_id NUMERIC(10, 0) NOT NULL,
        -- name varchar(25) NOT NULL,value varchar(25),
        -- rack_no VARCHAR(25) NOT NULL,
        -- column_no VARCHAR(25) NOT NULL,
        -- created TIMESTAMP without time zone DEFAULT now() not null,
        -- createdby NUMERIC(10,0) not null,
        -- updated TIMESTAMP without time zone DEFAULT now() not null,
        -- updatedby NUMERIC(10,0) not null,
        -- description VARCHAR(255),
        -- isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
        -- isdefault CHAR(1) not null DEFAULT 'N'::bpchar,
        -- tc_roomnumber_id NUMERIC(10,0),
        -- FOREIGN KEY (tc_roomnumber_id) REFERENCES
        -- adempiere.tc_roomnumber(tc_roomnumber_id));
        
        
    Hardening Table:-
        
        mini table
        
        CREATE TABLE adempiere.tc_cycle (
        tc_cycle_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        ad_client_id NUMERIC(10, 0) NOT NULL,
        ad_org_id NUMERIC(10, 0) NOT NULL,
        name varchar(25) NOT NULL,value varchar(25),
        cycleNo VARCHAR(10),
        created TIMESTAMP without time zone DEFAULT now() not null,
        createdby NUMERIC(10,0) not null,
        updated TIMESTAMP without time zone DEFAULT now() not null,
        updatedby NUMERIC(10,0) not null,
        description VARCHAR(255),
        isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
        c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
        isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar);
        
    Hardeneing details:-
        
        -- CREATE TABLE adempiere.tc_hardeningdetail (
        -- tc_hardeningdetail_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        -- ad_client_id NUMERIC(10, 0) NOT NULL,
        -- ad_org_id NUMERIC(10, 0) NOT NULL,
        -- name varchar(25) NOT NULL,value varchar(25),
        -- rackNo VARCHAR(25),
        -- cultureProcessedNo VARCHAR(25),
        -- created TIMESTAMP without time zone DEFAULT now() not null,
        -- createdby NUMERIC(10,0) not null,
        -- updated TIMESTAMP without time zone DEFAULT now() not null,
        -- updatedby NUMERIC(10,0) not null,
        -- description VARCHAR(255),
        -- isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
        -- c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
        -- isdefault CHAR(1) not null DEFAULT 'N'::bpchar,
        -- tc_cycle_id NUMERIC(10,0),
        -- tc_culturedetails_id NUMERIC(10,0),
        -- tc_cultureoperationdetails_id NUMERIC(10,0),
        -- FOREIGN KEY (tc_cycle_id) REFERENCES
        -- adempiere.tc_cycle(tc_cycle_id),
        -- FOREIGN KEY (tc_culturedetails_id) REFERENCES
        -- adempiere.tc_culturedetails(tc_culturedetails_id),
        -- FOREIGN KEY (tc_cultureoperationdetails_id) REFERENCES
        -- adempiere.tc_cultureoperationdetails(tc_cultureoperationdetails_id));

        ALTER TABLE adempiere.tc_cultureLabel
        ADD COLUMN tc_discardtype_id NUMERIC(10,0);

        ALTER TABLE adempiere.tc_cultureLabel
        ADD CONSTRAINT tc_cultureLabel_tc_discardtype_id_fkey
        FOREIGN KEY (tc_discardtype_id)
        REFERENCES adempiere.tc_discardtype(tc_discardtype_id);

        ALTER TABLE adempiere.tc_qualitycheck
ADD COLUMN tc_discardtype_id NUMERIC(10,0);

ALTER TABLE adempiere.tc_qualitycheck
ADD CONSTRAINT tc_qualitycheck_tc_discardtype_id_fkey
FOREIGN KEY (tc_discardtype_id)
REFERENCES adempiere.tc_discardtype(tc_discardtype_id);

        //QAData:-

        create a table for quality check and added discard reason
     
        CREATE TABLE adempiere.tc_qualitycheck (
        tc_qualitycheck_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        tc_qualitycheck_uu VARCHAR(36) DEFAULT NULL::bpchar,
        ad_client_id NUMERIC(10, 0) NOT NULL,
        ad_org_id NUMERIC(10, 0) NOT NULL,
        name varchar(25),value varchar(25),
        discardReason VARCHAR(255),
        created TIMESTAMP without time zone DEFAULT now() not null,
        createdby NUMERIC(10,0) not null,
        updated TIMESTAMP without time zone DEFAULT now() not null,
        updatedby NUMERIC(10,0) not null,
        description VARCHAR(255),
        isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
        c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
        isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
        tcpf VARCHAR(25),
        date DATE,
        personalCode VARCHAR(25));

        ALTER TABLE adempiere.tc_qualitycheck ADD COLUMN CultureLabelUUId VARCHAR(36);

        ALTER TABLE adempiere.tc_mediaLabelQr
        ADD COLUMN discardDate DATE,
        ADD COLUMN tcpf2 VARCHAR(25),
        ADD COLUMN personalCode2 VARCHAR(25);

        ALTER TABLE adempiere.tc_cultureLabel
        ADD COLUMN discardDate DATE,
        ADD COLUMN tcpf2 VARCHAR(25),
        ADD COLUMN personalCode2 VARCHAR(25);



        //MediaData:-

        


        Media Lable Table:-

    --     CREATE TABLE adempiere.tc_medialabel (
    -- tc_medialabel_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    -- ad_client_id NUMERIC(10, 0) NOT NULL,
    -- ad_org_id NUMERIC(10, 0) NOT NULL,
    -- name varchar(25) NOT NULL,value varchar(25),
    -- created TIMESTAMP without time zone DEFAULT now() not null,
    -- createdby NUMERIC(10,0) not null,
    -- updated TIMESTAMP without time zone DEFAULT now() not null,
    -- updatedby NUMERIC(10,0) not null,
    -- description VARCHAR(255),
    -- isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    -- isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
    -- c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    -- tcpf VARCHAR(25),
    -- date DATE,
    -- personalCode VARCHAR(25),     
    -- tc_mediatype_id NUMERIC(10,0),
    -- tc_machinetype_id NUMERIC(10,0),
    -- FOREIGN KEY (tc_machinetype_id) REFERENCES adempiere.tc_machinetype(tc_machinetype_id),
    -- FOREIGN KEY (tc_mediatype_id) REFERENCES adempiere.tc_mediatype(tc_mediatype_id)); 


        Every Table added name and value filed .

        ALTER TABLE adempiere.tc_cycle 
        ADD COLUMN value VARCHAR(40);


        CREATE TABLE adempiere.tc_planttag (
    tc_planttag_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_planttag_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(30),value varchar(25),
    documentNo VARCHAR(25) NOT NULL,
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    tc_planttag_uu VARCHAR(36) NOT NULL);

        CREATE TABLE adempiere.tc_hardeningtraytag (
    tc_hardeningtraytag_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_hardeningtraytag_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(30),value varchar(25),
    documentNo VARCHAR(25) NOT NULL,
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    tc_hardeningtraytag_uu VARCHAR(36) NOT NULL);


###
        CREATE TABLE adempiere.tc_cultureLabel (
    tc_cultureLabel_id SERIAL PRIMARY KEY,
    tc_cultureLabel_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_ID NUMERIC(10, 0) NOT NULL,
    ad_org_ID NUMERIC(10, 0) NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdiscarded CHAR(1) NOT NULL DEFAULT 'N'::bpchar
    parentCultureLine VARCHAR(255),
    cultureDate DATE,
    cycleNo NUMERIC(10,0),
    discardDate DATE,
    tcpf2 VARCHAR(25),
    personalCode2 VARCHAR(25),
    tc_species_id NUMERIC(10,0),
    tc_species_ids NUMERIC(10,0),
    tc_naturesample_id NUMERIC(10,0),
    tc_culturestage_id NUMERIC(10,0),
    tc_virustesting_id NUMERIC(10,0),
    tc_mediatype_id NUMERIC(10,0),
    tcpf VARCHAR(25),
    cultureOperationDate DATE,
    personal_code VARCHAR(25),
    tc_machinetype_id NUMERIC(10,0),
    FOREIGN KEY (tc_machinetype_id) REFERENCES adempiere.tc_machinetype(tc_machinetype_id),
    FOREIGN KEY (tc_mediatype_id) REFERENCES adempiere.tc_mediatype(tc_mediatype_id),
    FOREIGN KEY (tc_species_id) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_species_ids) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_naturesample_id) REFERENCES
     adempiere.tc_naturesample(tc_naturesample_id),
    FOREIGN KEY (tc_culturestage_id) REFERENCES
     adempiere.tc_culturestage(tc_culturestage_id),
    FOREIGN KEY (tc_virustesting_id) REFERENCES
     adempiere.tc_virustesting(tc_virustesting_id)
    );


        ### Hardening Label:-

        CREATE TABLE adempiere.tc_hardeningLabel (
    tc_hardeningLabel_id SERIAL PRIMARY KEY,
    tc_hardeningLabel_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_ID NUMERIC(10, 0) NOT NULL,
    ad_org_ID NUMERIC(10, 0) NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    parentCultureLine VARCHAR(255),
    sourcingDate DATE,
    cycleNo NUMERIC(10,0),
    tc_species_id NUMERIC(10,0),
    tc_species_ids NUMERIC(10,0),
    tc_naturesample_id NUMERIC(10,0),
    tc_culturestage_id NUMERIC(10,0),
    tc_virustesting_id NUMERIC(10,0),
    tcpf VARCHAR(25),
    operationDate DATE,
    personalCode VARCHAR(25),
    FOREIGN KEY (tc_species_id) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_species_ids) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_naturesample_id) REFERENCES
     adempiere.tc_naturesample(tc_naturesample_id),
    FOREIGN KEY (tc_culturestage_id) REFERENCES
     adempiere.tc_culturestage(tc_culturestage_id),
    FOREIGN KEY (tc_virustesting_id) REFERENCES
     adempiere.tc_virustesting(tc_virustesting_id)
    );

        ## Explant LAbel:-

        CREATE TABLE adempiere.tc_explantLabel (
    tc_explantLabel_id SERIAL PRIMARY KEY,
    tc_explantLabel_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_ID NUMERIC(10, 0) NOT NULL,
    ad_org_ID NUMERIC(10, 0) NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    parentCultureLine VARCHAR(255),
    sourcingDate DATE,
    tc_species_id NUMERIC(10,0),
    tc_species_ids NUMERIC(10,0),
    tc_naturesample_id NUMERIC(10,0),
    tcpf VARCHAR(25),
    operationDate DATE,
    personalCode VARCHAR(25),
    FOREIGN KEY (tc_species_id) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_species_ids) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_naturesample_id) REFERENCES
     adempiere.tc_naturesample(tc_naturesample_id)
    );

        ##Media Label

        CREATE TABLE adempiere.tc_mediaLabelQr (
    tc_mediaLabelQr_id SERIAL PRIMARY KEY,
    tc_mediaLabelQr_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_ID NUMERIC(10, 0) NOT NULL,
    ad_org_ID NUMERIC(10, 0) NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    isdiscarded CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
    tcpf VARCHAR(25),
    operationDate DATE,
    personalCode VARCHAR(25),
    discardDate DATE,
    tcpf2 VARCHAR(25),
    personalCode2 VARCHAR(25),
    tc_machinetype_id NUMERIC(10,0),
    tc_mediatype_id NUMERIC(10,0),
    tc_medialine_id NUMERIC(10,0),
    FOREIGN KEY (tc_medialine_id) REFERENCES adempiere.tc_medialine(tc_medialine_id),
    FOREIGN KEY (tc_machinetype_id) REFERENCES adempiere.tc_machinetype(tc_machinetype_id),
    FOREIGN KEY (tc_mediatype_id) REFERENCES adempiere.tc_mediatype(tc_mediatype_id)
    );

        Alter Table adempiere.ad_user Add column personalCode VARCHAR(10);

        Alter Table adempiere.tc_medialabelQr Add column discardReason VARCHAR(50); 

ALTER TABLE adempiere.tc_cultureLabel ADD COLUMN tc_in_id NUMERIC(10,0) ;
ALTER TABLE adempiere.tc_cultureLabel
ADD CONSTRAINT tc_cultureLabel_tc_in_id_fkey
FOREIGN KEY (tc_in_id)
REFERENCES adempiere.tc_in(tc_in_id);

ALTER TABLE adempiere.tc_cultureLabel ADD COLUMN tc_out_id NUMERIC(10,0) ;
ALTER TABLE adempiere.tc_cultureLabel
ADD CONSTRAINT tc_cultureLabel_tc_out_id_fkey
FOREIGN KEY (tc_out_id)
REFERENCES adempiere.tc_out(tc_out_id);

ALTER TABLE adempiere.tc_explantLabel ADD COLUMN tc_in_id NUMERIC(10,0) ;
ALTER TABLE adempiere.tc_explantLabel
ADD CONSTRAINT tc_explantLabel_tc_in_id_fkey
FOREIGN KEY (tc_in_id)
REFERENCES adempiere.tc_in(tc_in_id);

ALTER TABLE adempiere.tc_explantLabel ADD COLUMN tc_out_id NUMERIC(10,0) ;
ALTER TABLE adempiere.tc_explantLabel
ADD CONSTRAINT tc_explantLabel_tc_out_id_fkey
FOREIGN KEY (tc_out_id)
REFERENCES adempiere.tc_out(tc_out_id);


ALTER TABLE adempiere.tc_primaryhardeningLabel add column lotNumber VARCHAR(1);

//PRIMARY Hardening :-
CREATE TABLE adempiere.tc_primaryhardeningLabel (
    tc_primaryhardeningLabel_id SERIAL PRIMARY KEY,
    tc_primaryhardeningLabel_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_ID NUMERIC(10, 0) NOT NULL,
    ad_org_ID NUMERIC(10, 0) NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    cultureProcessedNumber VARCHAR(25),
    yearCode VARCHAR(25),
    parentCultureLine VARCHAR(255),
    sourcingDate DATE,
    plotNumberTray VARCHAR(25),
    tc_species_id NUMERIC(10,0),
    tc_species_ids NUMERIC(10,0),
    tc_culturestage_id NUMERIC(10,0),
    tcpf VARCHAR(25),
    operationDate DATE,
    personalCode VARCHAR(25),
    tc_in_id NUMERIC(10,0),
    tc_out_id NUMERIC(10,0),
    FOREIGN KEY (tc_in_id) REFERENCES adempiere.tc_in(tc_in_id),
    FOREIGN KEY (tc_out_id) REFERENCES adempiere.tc_out(tc_out_id),
    FOREIGN KEY (tc_species_id) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_species_ids) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_culturestage_id) REFERENCES
     adempiere.tc_culturestage(tc_culturestage_id)
    );

ALTER TABLE adempiere.tc_secondaryhardeningLabel add column serialNumber VARCHAR(5);


//Secondery Hardening:-
CREATE TABLE adempiere.tc_secondaryhardeningLabel (
    tc_secondaryhardeningLabel_id SERIAL PRIMARY KEY,
    tc_secondaryhardeningLabel_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_ID NUMERIC(10, 0) NOT NULL,
    ad_org_ID NUMERIC(10, 0) NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT now(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT now(),
    updatedby numeric(10,0) NOT NULL,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    cultureProcessedNumber VARCHAR(25),
    parentCultureLine VARCHAR(255),
    yearCode VARCHAR(25),
    sourcingDate DATE,
    batchNumber VARCHAR(25),
    tc_species_id NUMERIC(10,0),
    tc_species_ids NUMERIC(10,0),
    tc_culturestage_id NUMERIC(10,0),
    tcpf VARCHAR(25),
    operationDate DATE,
    personalCode VARCHAR(25),
    tc_in_id NUMERIC(10,0),
    tc_out_id NUMERIC(10,0),
    FOREIGN KEY (tc_in_id) REFERENCES adempiere.tc_in(tc_in_id),
    FOREIGN KEY (tc_out_id) REFERENCES adempiere.tc_out(tc_out_id),
    FOREIGN KEY (tc_species_id) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_species_ids) REFERENCES adempiere.tc_plantspecies(tc_plantspecies_id),
    FOREIGN KEY (tc_culturestage_id) REFERENCES
     adempiere.tc_culturestage(tc_culturestage_id)
    );


CREATE TABLE adempiere.tc_status (
        tc_status_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        tc_status_uu VARCHAR(36) DEFAULT NULL::bpchar,
        ad_client_id NUMERIC(10, 0) NOT NULL,
        ad_org_id NUMERIC(10, 0) NOT NULL,
        name varchar(25),value varchar(25),
        created TIMESTAMP without time zone DEFAULT now() not null,
        createdby NUMERIC(10,0) not null,
        updated TIMESTAMP without time zone DEFAULT now() not null,
        updatedby NUMERIC(10,0) not null,
        description VARCHAR(255),
        isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
        c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
        isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar);

CREATE TABLE adempiere.tc_temperatureposition (
        tc_temperatureposition_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        tc_temperatureposition_uu VARCHAR(36) DEFAULT NULL::bpchar,
        ad_client_id NUMERIC(10, 0) NOT NULL,
        ad_org_id NUMERIC(10, 0) NOT NULL,
        name varchar(25),
        created TIMESTAMP without time zone DEFAULT now() not null,
        createdby NUMERIC(10,0) not null,
        updated TIMESTAMP without time zone DEFAULT now() not null,
        updatedby NUMERIC(10,0) not null,
        description VARCHAR(255),
        isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
        c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
        isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar);

CREATE TABLE adempiere.tc_sensortype (
    tc_sensortype_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_sensortype_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name VARCHAR(30),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar);

CREATE TABLE adempiere.tc_devicedata (
    tc_devicedata_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_devicedata_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),value varchar(25),
    deviceid varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    m_locatortype_id NUMERIC(10,0),
    tc_temperatureposition_id NUMERIC(10,0),
    FOREIGN KEY (m_locatortype_id) REFERENCES adempiere.m_locatortype(m_locatortype_id),
    FOREIGN KEY (tc_temperatureposition_id) REFERENCES adempiere.tc_temperatureposition(tc_temperatureposition_id)
);

CREATE TABLE adempiere.tc_devicedata (
    tc_devicedata_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_devicedata_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),frequency VARCHAR(30),
    deviceid varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    m_locatortype_id NUMERIC(10,0),
    tc_temperatureposition_id NUMERIC(10,0),
    tc_sensortype_id NUMERIC(10,0),
    FOREIGN KEY (tc_sensortype_id) REFERENCES adempiere.tc_sensortype(tc_sensortype_id),
    FOREIGN KEY (m_locatortype_id) REFERENCES adempiere.m_locatortype(m_locatortype_id),
    FOREIGN KEY (tc_temperatureposition_id) REFERENCES adempiere.tc_temperatureposition(tc_temperatureposition_id)
);

ALTER TABLE adempiere.tc_visit ADD COLUMN tc_status_id NUMERIC(10,0) ;
ALTER TABLE adempiere.tc_visit
ADD CONSTRAINT tc_visit_tc_status_id_fkey
FOREIGN KEY (tc_status_id)
REFERENCES adempiere.tc_status(tc_status_id);

Alter Table adempiere.tc_plantdetails Add column isrejected CHAR(1) NOT NULL DEFAULT 'N'::bpchar
Alter Table adempiere.tc_culturelabel Add column isdiscarded CHAR(1) NOT NULL DEFAULT 'N'::bpchar
Alter Table adempiere.tc_medialabelQr Add column isdiscarded CHAR(1) NOT NULL DEFAULT 'N'::bpchar

CREATE TABLE adempiere.tc_temperature (
    tc_temperature_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_temperature_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),value varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    minTemp varchar(25),
    maxTemp varchar(25),
    minHumidity varchar(25),
    maxHumidity varchar(25),
    m_locatortype_id NUMERIC(10,0),
    FOREIGN KEY (m_locatortype_id) REFERENCES adempiere.m_locatortype(m_locatortype_id)
);

Alter Table adempiere.tc_temperatureStatus Add column deviceid varchar(25);

CREATE TABLE adempiere.tc_temperatureStatus (
    tc_temperatureStatus_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_temperatureStatus_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    Temperature varchar(25),
    Humidity varchar(25),
    m_locatortype_id NUMERIC(10,0),
    tc_tempstatus_id NUMERIC(10,0),
    FOREIGN KEY (m_locatortype_id) REFERENCES adempiere.m_locatortype(m_locatortype_id),
    FOREIGN KEY (tc_tempstatus_id) REFERENCES adempiere.tc_tempstatus(tc_tempstatus_id)
); 

CREATE TABLE adempiere.tc_tempstatus (
    tc_tempstatus_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_tempstatus_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar
);

CREATE TABLE adempiere.tc_light (
    tc_light_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_light_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    islightOnAndOff CHAR(1) not null DEFAULT 'Y'::bpchar
); 

Alter table adempiere.tc_light
add column lightoff VARCHAR(36);

Alter table adempiere.tc_light
add column lighton VARCHAR(36);

Alter table adempiere.tc_culturelabel
add column parentUUid VARCHAR(36) DEFAULT NULL::bpchar;

Alter table adempiere.tc_explantlabel
add column parentUUid VARCHAR(36) DEFAULT NULL::bpchar;

ALTER TABLE adempiere.tc_firstvisit
ADD COLUMN enterDetailsOfInfestation VARCHAR(30);

Alter table adempiere.tc_visit add column reason VARCHAR(36);

Alter table adempiere.tc_plantdetails add column reason VARCHAR(36);

CREATE TABLE adempiere.tc_firstjoinplant (
    tc_firstjoinplant_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_firstjoinplant_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    tc_plantdetails_id NUMERIC(10,0),
    tc_firstvisit_id NUMERIC(10,0),
    tc_plantstatus_id NUMERIC(10,0),
    FOREIGN KEY (tc_plantstatus_id) REFERENCES adempiere.tc_plantstatus(tc_plantstatus_id),
    FOREIGN KEY (tc_plantdetails_id) REFERENCES adempiere.tc_plantdetails(tc_plantdetails_id),
    FOREIGN KEY (tc_firstvisit_id) REFERENCES adempiere.tc_firstvisit(tc_firstvisit_id)
    );


CREATE TABLE adempiere.tc_intermediatejoinplant (
    tc_intermediatejoinplant_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_intermediatejoinplant_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    tc_plantdetails_id NUMERIC(10,0),
    tc_intermediatevisit_id NUMERIC(10,0),
    FOREIGN KEY (tc_plantdetails_id) REFERENCES adempiere.tc_plantdetails(tc_plantdetails_id),
    FOREIGN KEY (tc_intermediatevisit_id) REFERENCES adempiere.tc_intermediatevisit(tc_intermediatevisit_id)
    );

CREATE TABLE adempiere.tc_plantstatus (
        tc_plantstatus_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        tc_plantstatus_uu VARCHAR(36) DEFAULT NULL::bpchar,
        ad_client_id NUMERIC(10, 0) NOT NULL,
        ad_org_id NUMERIC(10, 0) NOT NULL,
        name varchar(25),
        created TIMESTAMP without time zone DEFAULT now() not null,
        createdby NUMERIC(10,0) not null,
        updated TIMESTAMP without time zone DEFAULT now() not null,
        updatedby NUMERIC(10,0) not null,
        description VARCHAR(255),
        isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
        c_uuId VARCHAR(36) DEFAULT NULL::bpchar);

CREATE TABLE adempiere.tc_labelName (
        tc_labelName_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        tc_labelName_uu VARCHAR(36) DEFAULT NULL::bpchar,
        ad_client_id NUMERIC(10, 0) NOT NULL,
        ad_org_id NUMERIC(10, 0) NOT NULL,
        name varchar(25),
        created TIMESTAMP without time zone DEFAULT now() not null,
        createdby NUMERIC(10,0) not null,
        updated TIMESTAMP without time zone DEFAULT now() not null,
        updatedby NUMERIC(10,0) not null,
        description VARCHAR(255),
        isactive CHAR(1) not null DEFAULT 'Y'::bpchar);

ALTER TABLE adempiere.tc_intermediatejoinplant ADD COLUMN tc_plantstatus_id NUMERIC(10,0) ;
ALTER TABLE adempiere.tc_intermediatejoinplant
ADD CONSTRAINT tc_intermediatejoinplant_tc_plantstatus_id_fkey
FOREIGN KEY (tc_plantstatus_id)
REFERENCES adempiere.tc_plantstatus(tc_plantstatus_id);

CREATE TABLE adempiere.tc_collectionjoinplant (
    tc_collectionjoinplant_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_collectionjoinplant_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby NUMERIC(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
    c_uuId VARCHAR(36) DEFAULT NULL::bpchar,
    suckerNo NUMERIC(10,0),
    tc_plantdetails_id NUMERIC(10,0),
    tc_collectiondetails_id NUMERIC(10,0),
    FOREIGN KEY (tc_plantdetails_id) REFERENCES adempiere.tc_plantdetails(tc_plantdetails_id),
    FOREIGN KEY (tc_collectiondetails_id) REFERENCES adempiere.tc_collectiondetails(tc_collectiondetails_id)
    );

ALTER TABLE adempiere.tc_collectionjoinplant ADD COLUMN tc_plantstatus_id NUMERIC(10,0) ;
ALTER TABLE adempiere.tc_collectionjoinplant
ADD CONSTRAINT tc_collectionjoinplant_tc_plantstatus_id_fkey
FOREIGN KEY (tc_plantstatus_id)
REFERENCES adempiere.tc_plantstatus(tc_plantstatus_id);

CREATE TABLE adempiere.tc_columnfield (
        tc_columnfield_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
        tc_columnfield_uu VARCHAR(36) DEFAULT NULL::bpchar,
        ad_client_id NUMERIC(10, 0) NOT NULL,
        ad_org_id NUMERIC(10, 0) NOT NULL,
        name varchar(25),value varchar(25),
        created TIMESTAMP without time zone DEFAULT now() not null,
        createdby NUMERIC(10,0) not null,
        updated TIMESTAMP without time zone DEFAULT now() not null,
        updatedby NUMERIC(10,0) not null,
        description VARCHAR(255),
        isactive CHAR(1) not null DEFAULT 'Y'::bpchar,
        isfarmerfield CHAR(1) not null DEFAULT 'N'::bpchar,
        isvisitfield CHAR(1) NOT NULL DEFAULT 'N'::bpchar,
        isdefault CHAR(1) NOT NULL DEFAULT 'N'::bpchar);

CREATE TABLE adempiere.tc_discardtype (
    tc_discardtype_id NUMERIC(10,0) NOT NULL PRIMARY KEY,
    tc_discardtype_uu VARCHAR(36) DEFAULT NULL::bpchar,
    ad_client_id NUMERIC(10, 0) NOT NULL,
    ad_org_id NUMERIC(10, 0) NOT NULL,
    name varchar(25),
    created TIMESTAMP without time zone DEFAULT now() not null,
    createdby numeric(10,0) not null,
    updated TIMESTAMP without time zone DEFAULT now() not null,
    updatedby NUMERIC(10,0) not null,
    description VARCHAR(255),
    isactive CHAR(1) not null DEFAULT 'Y'::bpchar
);



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

