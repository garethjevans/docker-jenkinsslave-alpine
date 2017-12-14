#!/bin/sh

echo "Connecting to master ${JENKINS_MASTER}"

java -jar /usr/share/jenkins/swarm-client.jar \
    -disableSslVerification \
    -deleteExistingClients \
    -fsroot /home/jenkins \
    -master ${JENKINS_MASTER:?"Need to set JENKINS_MASTER"} \
    -username ${JENKINS_USERNAME:?"Need to set JENKINS_USERNAME"} \
    -password ${JENKINS_PASSWORD:?"Need to set JENKINS_PASSWORD"} \
    -executors ${JENKINS_EXECUTORS:-8} \
    -tunnel :${JENKINS_PORT:-50000} \
	-name "${JENKINS_NAME:-"Slave"}" \
    -description "${JENKINS_DESCRIPTION:-"Swarm Slave"}" \
    -labels "${JENKINS_LABELS:-"swarm"}" \
    -mode "${JENKINS_MODE:-"normal"}"

