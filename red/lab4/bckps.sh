#!/bin/bash
cd /opt/RedDatabase/bin/
./gbak /db/red/reddb_lab1.fdb /home/kepouch/Documents/psu/zbd/red_bckps/reddb_lab1_$(date | awk {'print $1 $2  $3 $4'}).fdk -v -y /home/kepouch/Documents/psu/zbd/red_bckps/reddb_lab1_$(date | awk {'print $1 $2  $3 $4'}).log