#!/usr/bin/env bash
PROJECT_HOME=/home/admin/app/
JAR_DIR=${PROJECT_HOME}target
JAR_NAME=${PROJECT_NAME}.jar
cd ${PROJECT_HOME}
ls
mvn clean install -Dmaven.test.skip&& mvn package -Dmaven.test.skip
cd ${JAR_DIR}
EUREKA_PID=`ps -ef | grep "lenoc" | grep -v grep | awk '{print $2}'`
echo "Lenoc PID= $EUREKA_PID"
#kill -9 MOYU_PID
java -jar ${JAR_NAME} --spring.profiles.active=${SPRING_PROFILES_ACTIVE}
echo "========Build successful======="