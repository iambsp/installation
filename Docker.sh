#!/bin/sh
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
sudo apt install docker-ce -y

sudo docker pull splunk/splunk
#docker images #docker run -i -t f994713b61cb #ps -eAf|grep -i splunk #docker inspect splunk | grep IPAddress
sudo docker run -d -p 8000:8000 -p 8088:8088 -e "SPLUNK_START_ARGS=--accept-license" -e "SPLUNK_PASSWORD=Marichika@1" --name splunk splunk/splunk:latest


# iptables -I DOCKER-USER -i ext_if ! -s 0.0.0.0 -j DROP
# docker run -p 8088:8088 -e FORCE_HOSTNAME=0.0.0.0:8088 -t splunk
# curl -k https://3.249.77.26:8089/services/auth/login -d username=admin -d password=Marichika@1
# docker run -d -e "SPLUNKSTARTARGS=--accept-license" -e "SPLUNK_USER=root" -p "8000:8000" -p "8088:8088" splunk/splunk
# docker exec -it <container name> /bin/bash
# docker pull sonarqube
# docker run -d --name sonarqube -p 9000:9000 sonarqube:7.5-community
