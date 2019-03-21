#!/bin/bash -ex

pip install --upgrade pip

centos(){
  yum install python-setuptools && easy_install pip
  pip install shadowsocks
  yum install m2crypto
}

ubuntu(){
  apt-get install python-setuptools && easy_install pip
  pip install shadowsocks
  apt-get install m2crypto
}

if [ -f "/etc/redhat-release" ]; then
		centos
	else
		# /etc/lsb-release
		ubuntu
	fi	



sleep 1
bash -x ./shadowsocks.sh
