#!/bin/sh

host_dir="/tmp/"
proc_name="zabbix_server"
file_name="zabbix_server.restart.log"
pid=0

proc_num()
{
    num=`ps -ef | grep $proc_name | grep -v grep | grep -v $0 | wc -l`
    return $num
}

proc_id()
{
    pid=`ps -ef | grep $proc_name | grep -v grep | awk '{print $2}'`
}

proc_num
number=$?
if [ $number -eq 0 ]
then
    /etc/init.d/$proc_name restart
    proc_id
    echo ${pid}, `date` >> $host_dir$file_name
    curl http://notice.xxx.com/send_mail -d "receiver=111111@qq.com&subject=zabbix_server重启&content=zabbix_server退出，已自动重启"
fi
