#!/bin/bash

LOGPATH="/root/load.log"  # Путь хранения логов


for ((i=1; i < 13; i++)); do

D=$(date  +%Y-%m-%d)
T=$(date +%H:%M:%S)

echo "Нагрузка на $D $T: CPU `LC_ALL=C top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'`% RAM `free -m | awk '/Mem:/ { printf("%3.1f%%", $3/$2*100) }'` HDD `df -h / | awk '/\// {print $(NF-1)}'`" >> $LOGPATH

cpu=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
ram=$(free -m | awk 'NR==2{printf "%.0f\n", $3*100/$2 }')
hdd=$(df -h / | awk '/\// {print $(NF-1)}' | sed 's/%//')



if ip link show | grep -q "eth1"; then
    hostlan=$(ifconfig eth1 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
else
    hostlan="Отсутствует"
fi


hostwan=$(ifconfig eth0 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')

cpu=$(printf '%.0f\n' $cpu)
# cpu
if [[ $cpu -ge 80 ]]; then
        curl -s "https://api.telegram.org/bot5288344688:AAHpriSlv36Sa09rWO6DwXip9WZYMo5ryHI/sendMessage?chat_id=-1001697894922&text=Хост: $hostwan . Внутренний: $hostlan.  Нагрузка CPU составила $cpu %"
fi
# ram
if [[ $ram -ge 80 ]]; then
        curl -s "https://api.telegram.org/bot5288344688:AAHpriSlv36Sa09rWO6DwXip9WZYMo5ryHI/sendMessage?chat_id=-1001697894922&text=Хост: $hostwan . Внутренний: $hostlan.  Нагрузка RAM составила $ram %"
fi
# hdd
if [[ $hdd -ge 80 ]]; then
        curl -s "https://api.telegram.org/bot5288344688:AAHpriSlv36Sa09rWO6DwXip9WZYMo5ryHI/sendMessage?chat_id=-1001697894922&text=Хост: $hostwan . Внутренний: $hostlan.  Заполненность HDD составила $hdd %"
fi

sleep 4;
done

