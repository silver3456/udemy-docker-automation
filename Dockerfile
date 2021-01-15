FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

#Workspace
WORKDIR /usr/share/udemy/

#Add .jar under target from host into this image
ADD target/selenium-docker.jar          selenium-docker.jar
ADD target/selenium-docker-tests.jar    selenium-docker-tests.jar
ADD target/libs							libs

#In case of any other dependencies .csv / .json
#Add them as well

#Add suite files
ADD book-flight-module.xml  			book-flight-module.xml
ADD search-module.xml					search-module.xml

#Add health check script
ADD  healthcheck.sh                     healthcheck.sh

ENTRYPOINT  sh healthcheck.sh

#java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* -DBROWSER=$BROWSER -DHUB_HOST=$HUB_HOST org.testng.TestNG $MODULE
