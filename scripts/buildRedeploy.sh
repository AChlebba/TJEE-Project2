#!/bin/sh

echo "************ UNDEPLOYING *******************"
/home/student/glassfish3/glassfish/bin/asadmin undeploy jeedemo
echo "************ BUILDING **********************"
mvn package
echo "************ DEPLOYING *********************"
/home/student/glassfish3/glassfish/bin/asadmin deploy target/jeedemo.war
