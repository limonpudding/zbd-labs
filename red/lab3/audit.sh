#!/bin/bash

# удаление старых сессий
for session_id in $(rdbtracemgr -se service_mgr -list | grep "Session ID:" | awk {'print $3'}); do
	rdbtracemgr -se service_mgr -stop -id $session_id
done

# запуск новой сессии и запись в новый файл
rdbtracemgr -se service_mgr -user sysdba -password masterkey -start -name "reddb_lab trace "$(date | awk {'print $1 $2  $3 $4'}) -config "/opt/RedDatabase/fbtrace.conf" > "/home/kepouch/Documents/psu/zbd/audit-"$(date | awk {'print $1 $2  $3 $4'})".log"