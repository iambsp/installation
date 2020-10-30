#!/bin/sh

sudo su
sudo yum update -y
sudo yum install java-1.8.0-openjdk -y
echo "export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.265.b01-1.amzn2.0.1.x86_64/"
export PATH=$JAVA_HOME/bin:$PATH" >> /etc/profile
source /etc/profile


#sudo su

#echo "##############JAVA_HOME##############"
#echo $JAVA_HOME && echo  ""
#echo "##############JAVA_VERSION##############"
#`java -version`# >> ~/.bashrc
#alias c='clear'
