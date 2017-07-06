#!/usr/bin/env bash
# sudo apt-get upgrade -y
sudo apt-get update
sudo apt-get install -y apache2
echo "Apache2 Installed"
sudo apt-get install -y openssh-server openssh-client
echo "Open SSH Installed"
sudo apt-get install -y git
echo "Git Installed"

# java install
echo "Installing Java 8"
yes | sudo add-apt-repository ppa:webupd8team/java
sudo apt update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt install -y oracle-java8-installer
sudo apt install oracle-java8-set-default
echo "JAVA Installed"

# SBT install

# echo "SBT Installing"
# echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
# sudo apt-get update
# sudo apt-get install sbt
# echo "SBT Installed"

# Installing JIRA make sure the jira.bin is inside the folder below
echo "JIRA Installing"
sudo mv /vagrant_data/jira.bin /opt  
cd /opt
sudo chmod a+x jira.bin
sudo printf 'o\n2\n\n\n2\n8082\n8007\ny\n' | ./jira.bin
echo "JIRA Installed"

# Setting up Nexus
sudo mv /vagrant_data/nexus-3.0.2-02-unix.tar.gz /opt  
cd /opt/
sudo tar zxvf nexus-3.0.2-02-unix.tar.gz
sudo mv nexus-3.0.2-02 nexus
cd nexus/bin
sudo RUN_AS_USER=root ./nexus start

# Setting up Jenkins
sudo wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins
sudo chmod -R 755 /var/lib/jenkins/secrets

sudo su jenkins -s /bin/bash
echo "/vargrant_data/superSecret\n\n\n" | ssh-keygen
sudo service jenkins start
echo "vagrant" | su vagrant


 sudo apt-get -y autoremove
 
 # All code done now checking if software is installed
 echo "Displaying software versions..."
 apache2 -vS
 git --version
 ps -ef | grep JIRA
 sbt sbtVersion
 java -version
 javac -version
 sudo service jenkins status
 ifconfig eth0
 echo "password for initialAdminPassword is: "
sudo cat "/var/lib/jenkins/secrets/initialAdminPassword" 
 echo "Finished script"
