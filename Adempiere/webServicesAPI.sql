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
	@Path("/login_api")   (api last path link generally using call the api)
	public LoginApiResponse loginApi(LoginApiRequest req);  
	(start using public then provide login responce and provide method which show your postman or soapUI and last is give some request method)

