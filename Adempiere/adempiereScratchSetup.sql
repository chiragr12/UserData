
New adempiere setup :-

1. First git clone
#	git clone https://github.com/idempiere/idempiere.git

2. cd idempiere
#   git checkout release-10  //this command is using release 10 version

3. mvn verify

4. open an Eclipse project and import idempiere project

5. go to window -> preference -> search enter Tyco and jre and check two configure java-11 choose or not if not choose please select java-11 and apply and close

6. org.idempiere.p2.targetplatform (this folder is base folder of all project )

	org.idempiere.p2.targetplatform.target click and reload target plateform  and select all folder and dependency install

7. all error is remove 

8. go to run configuration and install app 
	fill up all details 

9. go to server.product and show runing

10. idempiere new version mai all plugin ko add karna important hai is liye wms ko git karke use plugin ko old file mai send karte hai

11. com.idempiere.customization this file copy to idempiere folder

12. this customization file ko import karna hai

13. file -> import -> general -> existing project into workspace -> next -> select root directory and enter idempier actual path all checkbox deslected 
	and choose customization file and press finish.	

14. run configuration -> server.product -> select plug-ins and choose customization file and increse file lavel like 1 and auto start select true and press run



Postgresql Data Setup:-

Install Postgresql database:-

sudo apt update 
sudo apt install postgresql postgresql-contrib -y 
sudo systemctl start postgresql.service
sudo systemctl status postgresql
sudo -i -u postgres  
psql
ALTER USER postgres WITH PASSWORD 'postgres';

Adempiere Setep:-

1. Create adempiere user :-
	psql -U postgres -c "CREATE ROLE adempiere SUPERUSER LOGIN PASSWORD 'adempiere'"

2. Create adempiere database setup:-
	createdb  --template=template0 -E UNICODE -O adempiere -U adempiere idempiere
	psql -d idempiere -U adempiere -c "ALTER ROLE adempiere SET search_path TO adempiere, pg_catalog"
	enter password :- adempiere

3. Restore database :-
	cd 
	psql -U adempiere -d idempiere < /home/chirag/Downloads/ExpDat.dmp (requirement according change file path)
	(if any requirement give file executing permission)



==============================================================================================================================================================
Old Scratch Setup Throw Error :-

-- 1. First cloning the adempiere project from Git

-- 2. Second install a maven and go to adempiere folder with terminal

-- 3. type a command :-  mvn verify

-- 4. open a project with Eclipse

-- 5. org.idempiere.p2.targetplatform (this folder is base folder of all project )

-- 6. show any maven or java error quick fix ignore this error

-- 7. and go to terminal and go to 
-- 	cd idempiere/org.adempiere.server-feature/utils.unix/
-- 	sudo chmod +x setVar.sh
-- 	sudo chmod +x getVar.sh

-- 	and run this script in terminal
-- 	./getVar.sh
-- 	./setVar.sh

-- 	and go to Eclipse and select all folder and press refress (F5)

-- 8. go to file idempiereEnv.properties and add only one line
-- 	  ADEMPIERE_KEYSTOREPASS=

-- 	and save file 
-- 	and go to Eclipse and select all folder and press refress (F5)

-- 9. Eclipse go to run -> run configuration -> install.app (Proper running)
--     and fill up the path and requiredment details

-- 10. Eclipse go to run -> run configuration -> server.product (if put hardcoded password then working otherwise throw Fatal password error)
-- 	DB_PostgreSQL.java file add hardcoded password

-- 	if (!poolProperties.containsKey("password")) { //line no 756
--     			poolProperties.put("password", "adempiere");(this line password added)
--     		}	
