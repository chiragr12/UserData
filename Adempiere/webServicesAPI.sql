If you pull the code from the git and pull code class through error means some dependency or jar file not complete coming in your project,
This problem solving two method:-
	1 cd idempiereNewChangesUI/wms/idempiere-release-10 
		and type the code 
		mvn verify (all dependency add your project but this method take show much time)

	2 cd idempiereNewChangesUI/wms/idempiere-release-10/org.idempiere.webservices (plug in name, means pulling the code changes plug in name)
	  scomp -javasource 11 -out lib/idempiere-xmlbeans.jar WEB-INF/xsd/idempiere-schema.xsd (webservices mai already existing .xsd file ko hi 
	  code ke through .jar mai convert karte hai)
	  all error gone.


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
Create a new API interface

	@POST (generally post using because post is secure)
	@Path("/role_configure")   (api last path link generally using call the api)
	public RoleConfigureResponce loginApi(RoleConfigureRequest req);  
	(start using public then provide login responce and provide method which show your postman or soapUI and last is give some request method)

	This RoleConfigureResponce and RoleConfigureRequest method create in idempiere_schema.xsd file
	like examples:-
	{
		<xsd:complexType name="RoleConfigureRequest">
  		<xsd:sequence>
  			<xsd:element name="serviceType" type="xsd:string" />
  			<xsd:element name="roleID" type="xsd:int" />
  			<xsd:element name="clientID" type="xsd:int" />
  		</xsd:sequence>
  	</xsd:complexType>
  	
  	
  	<xsd:complexType name="RoleConfigureResponce">
  		<xsd:sequence>
			<xsd:element name="Error" type="xsd:string" minOccurs="0" />
		<xsd:element name="Roles" type="tns:Role" minOccurs="0" maxOccurs="unbounded"></xsd:element>  			
  		</xsd:sequence>
 			<xsd:attribute name="IsError" type="xsd:boolean" /> 		
  	</xsd:complexType>
  		
 	<xsd:complexType name="Roles">
 	<xsd:sequence>
 		<xsd:element name="roles" type="xsd:string" />
 		<xsd:element name="roleAccessList" type="tns:Role" minOccurs="0" maxOccurs="unbounded"/>
 	</xsd:sequence>	
 	</xsd:complexType>  


 	replace mahendra sir

	<xsd:complexType name="RoleConfigureResponse">
  		<xsd:sequence>
			<xsd:element name="Error" type="xsd:string" minOccurs="0" />
		<xsd:element name="appAcess" type="tns:RoleAppAcess" minOccurs="0" maxOccurs="unbounded"></xsd:element>  			
  		</xsd:sequence>
 			<xsd:attribute name="IsError" type="xsd:boolean" /> 		
  	</xsd:complexType>
  		
 	<xsd:complexType name="RoleAppAcess">
 	<xsd:sequence>
 		<xsd:element name="appName" type="xsd:string" />
 		<xsd:element name="appAcess" type="xsd:boolean"/>
 	</xsd:sequence>	
 	</xsd:complexType> 
 	
	}

	and first completed create this 2 method then remove inside jar file in lib folder then go to terminal and run the command
	cd idempiereNewChangesUI/wms/idempiere-relese-10/org.idempiere.webservices 
	scomp -javasource 11 -out lib/idempiere-xmlbeans.jar WEB-INF/xsd/idempiere-schema.xsd (webservices mai already existing .xsd file ko hi 
	  code ke through .jar mai convert karte hai)
	  all error gone.

	This method complete then interface page mai both method add in import 
	import org.idempiere.adInterface.x10.RoleConfigureRequest;
	import org.idempiere.adInterface.x10.RoleConfigureResponce; 

	this interface class all method is done then go to implement your interface 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
Create a new API implement method

	First implement put the api name and show error blub click and unimplement method execute then all error has gone



