# !/usr/bin/env bash
# Install Java, maven and git
sudo apt-get update

sudo apt-get install -y apache2
#sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y git
#sudo apt-get install -y oracle-java8-installer
#sudo apt-get install -y oracle-java8-set-default
sudo apt-get -y autoremove
echo "Java Installed"

# Create dedicated bamboo user
 #sudo /usr/sbin/useradd --create-home --home-dir /usr/local/bamboo --shell /bin/bash bamboo
# Download Bamboo Server
# mkdir /opt/bamboo
# cd /opt/bamboo
# wget http://aaronmulholland.co.uk/atlassian-bamboo-5.10.1.1.tar.gz
# tar zxvf atlassian-bamboo-5.10.1.1.tar.gz
# Create home directory
# mkdir /home/vagrant/bamboo/bamboo-home
java -version
echo "All complete"
# tar zxvf 


