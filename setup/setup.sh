#!/bin/bash -ex

yum install python-setuptools && easy_install pip
pip install shadowsocks
yum install m2crypto

sleep 1
bash -x ./shadowsocks.sh