#!bin/bash

echo "Введите полный путь до скрипта load.sh ( Пример /root/load.sh )"

read loadpath

echo "*  *  *  *  * root bash $loadpath" >> /etc/crontab

echo "Скрипт добавлен в планировщик сron!"
echo "При смене пути к load.sh необходимо так же заменить путь в /etc/crontab "
echo "Путь по умолчанию для логов /root/load.log. Для смены прочтите README"

