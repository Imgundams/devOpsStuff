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
echo "SBT Installing"
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt
echo "SBT Installed"

# Installing JIRA make sure the jira.bin is inside the folder below
echo "JIRA Installing"
sudo chmod a+x /vagrant_data/Documents/jira.bin
sudo printf 'o\n2\n\n\n2\n8081\n8006\ny\n' | ./vagrant_data/Documents/jira.bin
echo "JIRA Installed"

# Setting up Jenkins
sudo wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins
sudo chmod 755 /var/lib/jenkins/secrets
echo "password for initialAdminPassword is: "
sudo cat "/var/lib/jenkins/secrets/initialAdminPassword" 
sudo su jenkins -s /bin/bash
ssh-keygen
printf"/vargrant_data/Documents/superSecret"
sudo service jenkins start

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
 echo "Finished script"