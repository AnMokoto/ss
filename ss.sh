#!/bin/bash -e

# check permission
if [ `id -u` -ne 0 ]; then
	echo "----------------Please use root to excute.----------------"
	exit 1
fi

centos(){
 yum install git
}


ubuntu(){
 apt-get install git
}

# check git package
if ! [ -x "$(command -v git)" ]; then
	if [ -f "/etc/redhat-release" ]; then
		centos
	else
		# /etc/lsb-release
		ubuntu
	fi	
fi

# install ss

if ! [ -d "ss" ];then
	ss="https://github.com/AnMokoto/ss.git"
	echo "----------------clone the ss----------------"
	echo `git clone -b master $ss ss --progress`
	echo "----------------install shadowsocks----------------"
	echo `bash -e ss/setup/setup.sh`
fi


echo "----------------start shadowsocks----------------"
cd ss/setup
echo `bash -e ./shadowsocks.sh`
echo "------------------------------------------------"
echo "----------------Enjoy shadowsocks---------------"
echo "------------------------------------------------"


