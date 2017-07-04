# !/usr/bin/env bash
# Install Java, maven and git
sudo apt-get update

sudo apt-get install -y apache2
sudo apt-get install -y git
sudo mv /vagrant_data/java.tar.gz /opt/java.tar.gz 
cd /opt
sudo tar zxvf java.tar.gz
sudo update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_45/bin/java 100
sudo update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_45/bin/javac 100
sudo update-alternatives --config java

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


