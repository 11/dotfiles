#!/bin/bash


#install GIMP
sudo apt-get install -y GIMP

#install tmux
sudo apt-get update
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y tmux=2.0-1~ppa1~t

#install atom text editor
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install -y atom

#install skype
sudo dpkg --add-architecture i386
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

#detects personal computer architecture and installs proper version of chrome
if [[ $(getconf LONG_BIT) = "64" ]]then
	echo "64bit Detected" &&
	echo "Installing Google Chrome" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
	sudo dpkg -i google-chrome-stable_current_amd64.deb &&
	rm -f google-chrome-stable_current_amd64.deb
else
	echo "32bit Detected" &&
	echo "Installing Google Chrome" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb &&
	sudo dpkg -i google-chrome-stable_current_i386.deb &&
	rm -f google-chrome-stable_current_i386.deb
fi

#install mysql 
#NOTE: 	- YOU WILL BE ASKED TO MANUALLY ENTER A PASSWORD FOR MYSQL, 
#		- you must be present or the rest of the script will not finish
sudo apt-get update
sudo apt-get install -y mysql-server

#install git
sudo apt-get install -y git-all

#install java 1.8
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer
export JAVA_HOME=/usr/lib/jvm/java-8-oracle



