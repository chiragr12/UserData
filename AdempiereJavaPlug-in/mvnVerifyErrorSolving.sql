mvn verify (idempiere-release-10) and throw below error

[ERROR] Failed to resolve target definition file:/home/chirag/newPipra/wms/idempiere-release-10/org.idempiere.p2.targetplatform/org.idempiere.p2.targetplatform.target:
 MavenDependency GroupId = org.eclipse.jetty, ArtifactId = jetty-servlets, Version = 10.0.9, ArtifactType = jar, IncludeDependencyScope =  of 
 location MavenDependencyRoots = [GroupId = org.eclipse.jetty, ArtifactId = jetty-servlets, Version = 10.0.9, ArtifactType = jar, IncludeDependencyScope = ], 
 IncludeDependencyScope = [compile], MissingManifestStrategy = GENERATE, IncludeSource = true could not be resolved: resolving 
 org.eclipse.jetty:jetty-servlets:jar:10.0.9 failed! [org.apache.maven.artifact.resolver.ArtifactResolutionException: Unable to get dependency information for 
 org.eclipse.jetty.tests:jetty-http-tools:jar:10.0.9: Failed to retrieve POM for org.eclipse.jetty.tests:jetty-http-tools:jar:10.0.9: Could not transfer artifact
  org.eclipse.jetty.tests:jetty-http-tools:pom:10.0.9 from/to OpenNMS (https://repo.opennms.org/maven2): Transfer failed for
  {This above loine throw error means provide a location and remame pom file}
   https://repo.opennms.org/maven2/org/eclipse/jetty/tests/jetty-http-tools/10.0.9/jetty-http-tools-10.0.9.pom
[ERROR]   org.eclipse.jetty.tests:jetty-http-tools:jar:10.0.9
[ERROR] 
[ERROR] from the specified remote repositories:
[ERROR]   Central (https://repo1.maven.org/maven2, releases=true, snapshots=true),
[ERROR]   Redhat-GA (https://maven.repository.redhat.com/ga, releases=true, snapshots=true),
[ERROR]   OpenNMS (https://repo.opennms.org/maven2, releases=true, snapshots=true),
[ERROR]   jr-ce-releases (https://jaspersoft.jfrog.io/jaspersoft/jr-ce-releases, releases=true, snapshots=true),
[ERROR]   jp-third-party-ce (https://jaspersoft.jfrog.io/jaspersoft/third-party-ce-artifacts, releases=true, snapshots=true),
[ERROR]   Clojars (https://clojars.org/repo, releases=true, snapshots=true),
[ERROR]   atlassian-3rdparty (https://maven.atlassian.com/3rdparty, releases=true, snapshots=true),
[ERROR]   idempiere-zkoss (https://idempiere.github.io/binary.file/maven.zk/, releases=true, snapshots=true),
[ERROR]   zkoss (https://mavensync.zkoss.org/maven2, releases=true, snapshots=true),
[ERROR]   jenkins (https://repo.jenkins-ci.org/releases, releases=true, snapshots=true),
[ERROR]   central (https://repo.maven.apache.org/maven2, releases=true, snapshots=false)
[ERROR] Path to dependency: 
[ERROR] 	1) org.eclipse.jetty:jetty-servlets:jar:10.0.9
[ERROR] 
[ERROR] ]
[ERROR] -> [Help 1]
[ERROR] 
[ERROR] To see the full stack trace of the errors, re-run Maven with the -e switch.
[ERROR] Re-run Maven using the -X switch to enable full debug logging.
[ERROR] 
[ERROR] For more information about the errors and possible solutions, please read the following articles:
[ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MavenExecutionException


Solution:- go to file manager
go to Home and press ctrl + h and go to .m2 file 

.m2/repository/org/eclipse/jetty/tests/jetty/jetty-http-tools/10.0.9/
rename file name if file name extention not show .pom 


=============================================================================================================================================================
Ques. If mvn clean install command is not working 

Solution :- If that command is not working then you use mvn verify command in whole maven file like you run this command in idempiere-release-10 and 
Its working properly and you show your jar file inside your maven file go to target and show your jar file, If any confusion check your jar file properties. 