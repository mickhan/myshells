#!/usr/bin/bash
#获取系统IP
OS=$(uname)

if [ $OS == "Darwin" ]; then
    IP=$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}')
else
    IP=$(ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | awk '{print $2}' | awk -F: '{print $2}')
fi

echo $IP
