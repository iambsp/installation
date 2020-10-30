#!/bin/sh

sudo su
########################
#JAVA INSTALLATION
########################

echo `java -version`
sudo apt install default-jre
echo `java -version`
sudo apt install default-jdk
echo `javac -version`
sudo update-alternatives --config java #find /usr/lib/jvm/java-1.x.x-openjdk,vim /etc/profile, export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.265.b01-1.amzn2.0.1.x86_64/", export PATH=$JAVA_HOME/bin:$PATH,source /etc/profile
sudo nano /etc/environment
source /etc/environment

########################
#JENKINS INSTALLATION
########################

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
systemctl status jenkins
systemctl stop jenkins
sudo ufw allow 8080
sudo ufw status
sudo ufw allow OpenSSH
sudo ufw enable
sudo vi /etc/default/jenkins
sudo vi /var/lib/jenkins/config.xml #Reset Password

devops
Devops!123

########################
#TOMCAT9 INSTALLATION
########################

sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat #Add TOMCAT user
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.38/bin/apache-tomcat-9.0.38.tar.gz -P /tmp
sudo tar xf /tmp/apache-tomcat-9*.tar.gz -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-9.0.36 /opt/tomcat/latest
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
sudo nano /etc/systemd/system/tomcat.service
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl status tomcat
sudo systemctl enable tomcat
sudo ufw allow 8080/tcp
sudo nano /opt/tomcat/latest/conf/tomcat-users.xml #   <role rolename="admin-gui"/> #<role rolename="manager-gui"/>#<user username="admin" password="admin_password" roles="admin-gui,manager-gui"/>
sudo nano /opt/tomcat/latest/webapps/manager/META-INF/context.xml
sudo nano /opt/tomcat/latest/webapps/host-manager/META-INF/context.xml #<!--<Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />-->
sudo systemctl restart tomcat


########################
#GIT INSTALLATION
########################

sudo apt update
sudo apt install make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip
cd /usr/src/
sudo wget https://github.com/git/git/archive/v2.28.0.tar.gz -O git.tar.gz
sudo tar -xf git.tar.gz
cd git-*
sudo make prefix=/usr/local all
sudo make prefix=/usr/local install
git --version
git config --global user.name "iambsp"
git config --global user.email "imbhabanipati@gmail.com"
git config --list
vi ~/.gitconfig
git init
git add .
git commit -m "Pushing 1st"
git remote add origin https://github.com/iambsp/Motley.git
git push -u origin master

########################
#ANSIBLE INSTALLATION
########################

sudo apt-get update
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get install ansible
ansible --version
ssh-keygen -t rsa -b 4096 -C “ubuntu@ip-172-31-34-248”
sudo nano /etc/ansible/hosts
hostname -I
sudo usermod -L ubuntu #Disable password
sudo usermod -U ansible #Enable Password
sudo visudo #echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
ansible all -m ping 
[servers]
172.31.34.248 ansible_ssh_user=root ansible_ssh_pass=.

########################
#MAVEN INSTALLATION
########################

sudo apt update
wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -P /tmp
sudo tar xf /tmp/apache-maven-*.tar.gz -C /opt
sudo ln -s /opt/apache-maven-3.6.3 /opt/maven
sudo nano /etc/profile.d/maven.sh #export JAVA_HOME=/usr/lib/jvm/default-java #export M2_HOME=/opt/maven #export MAVEN_HOME=/opt/maven #export PATH=${M2_HOME}/bin:${PATH}
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh


########################
#OTHERS INSTALLATION
########################

lsb_release -a

#Download File from GDRIVE
#!/bin/bash
fileid="FILEIDENTIFIER"
filename="FILENAME"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}


########################
#EC2 USERDATA
########################

#!/bin/sh

sudo su
apt update -y
apt install default-jre -y
apt install default-jdk -y
apt install openjdk-8-jdk -y
apt install apache2 -y
systemctl start apache2
systemctl enable apache2
echo "Hello BSP from $(hostname -f)" > /var/www/html/index.html

#!/bin/sh
sudo su


#sudo lsof -i -P -n | grep LISTEN

#netstat -tulpn | grep LISTEN

# curl https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py -O
# python ./awslogs-agent-setup.py --region ap-south-1
# systemctl start awslogs
# chkconfig awslogs on

# sudo yum install awslogs
# sudo service awslogsd start
# sudo systemctl  enable awslogsd



 /$$$$$$$   /$$$$$$  /$$$$$$$ 
| $$__  $$ /$$__  $$| $$__  $$
| $$  \ $$| $$  \__/| $$  \ $$
| $$$$$$$ |  $$$$$$ | $$$$$$$/
| $$__  $$ \____  $$| $$____/ 
| $$  \ $$ /$$  \ $$| $$      
| $$$$$$$/|  $$$$$$/| $$      
|_______/  \______/ |__/    