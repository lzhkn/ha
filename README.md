### ha

repo for otus project

[all_stack]

192.168.1.160 : zabbix-01 node-01 : 
192.168.1.161 : zabbix-02 node-02 : 
192.168.1.165 : zabbix-03 node-03 :
192.168.1.167 : proxy - proxy :

192.168.1.164 : elk : 

----
[bases]

192.168.1.162 : mysql-01 : MAIN  
192.168.1.163 : mysql-02 : Replica

----

backup: everyday 3:00 AM   # replica:./zbxBd

### gunzip lastbackup

when BD crash:

active zabbix server - server.sh

### Меняет ip zabbix-server

replica DB - replica.sh

### делает реплику Mysql - main DB
