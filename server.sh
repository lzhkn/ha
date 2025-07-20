#!/bin/bash

# Настройки
OLD_IP="192.168.1.162"
NEW_IP="192.168.1.163"
CONF_FILE="/etc/zabbix/zabbix_server.conf"

# Замена IP
sudo sed -i "s/^DBHost=${OLD_IP}/DBHost=${NEW_IP}/" "$CONF_FILE"

# Проверка успешности
if grep -q "^DBHost=${NEW_IP}" "$CONF_FILE"; then
    echo "✅ DBHost успешно изменён на $NEW_IP"
else
    echo "❌ Ошибка при изменении DBHost"
    exit 1
fi

# Перезапуск сервиса Zabbix
sudo systemctl restart zabbix-server && echo "✅ Zabbix-сервер перезапущен"
