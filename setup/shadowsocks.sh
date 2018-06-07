#!/bin/bash -e

echo "The old thread of Shadowsocks will be destroy."

sudo ssserver -c ./shadowsocks.json -d stop

echo "The new thread of Shadowsocks will be begening..."


logs="logs"

if [ ! -d $logs ];then
  sudo mkdir $logs
fi

sudo ssserver -c ./shadowsocks.json --log-file $logs/shadowsocks.log -d start