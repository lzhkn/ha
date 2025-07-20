#!/bin/bash

# Файл конфигурации
MYSQL_CONF="/etc/mysql/mysql.conf.d/mysqld.cnf"
BACKUP_FILE="${MYSQL_CONF}.bak.$(date +%F_%H-%M-%S)"

# Бэкап
sudo cp "$MYSQL_CONF" "$BACKUP_FILE"
echo "✅ Резервная копия создана: $BACKUP_FILE"

# Перезапись конфигурации
sudo tee "$MYSQL_CONF" > /dev/null <<EOF
[mysqld]
server-id = 1
log-bin = mysql-bin
binlog_format = row
gtid-mode=ON
enforce-gtid-consistency
log-replica-updates
EOF

echo "✅ Файл $MYSQL_CONF обновлён"
