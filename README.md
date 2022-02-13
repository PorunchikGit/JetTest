# JetTest

Aver.sh  -  находит среднее арифметическое ПОЛОЖИТЕЛЬНЫХ элементов линейного массива. Генерация urandom : head -200 /dev/urandom | tr -dc '+\-0-9 \t'| sed -e 's/\([-+]\)[-+]\+/\1/g; s/[+-][ \t$]//g; s/\([+-]\)/ \1/g;'

load.sh - Скрипт мониторинга

CPUtest.sh - Стресс тест CPU

deploy.sh - Развертывания load.sh в cron


# ИНСТРУКЦИЯ

Канал telegram : https://t.me/AlarmJetBot

Скрипт каждые 5 сек. логирует нагрузку CPU/RAM/HDD . При нагрузке >= 80 отправляет alarm в чат.

Путь можно указать в load.sh , 3 сторока LOGPATH="<ПУТЬ>" ( По умолчанию /root/load.log )

Для развертывания:
1. Клонируем репозиторий в удобное место 

git clone https://github.com/PorunchikGit/JetTest.git

2. Добавить права доступа load.sh

chmod a+x load.sh

3. Запустить скрипт deploy.sh и следовать указаниям ( Или настроить cron самостоятельно для выполнения load.sh каждую минуту)

bash deploy.sh

Для отключения удалите задачу в /etc/crontab
