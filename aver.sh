#!/bin/bash
:>temp
 rando=$(head -200 /dev/urandom | tr -dc '+\-0-9 \t'| sed -e 's/\([-+]\)[-+]\+/\1/g; s/[+-][ \t$]//g; s/\([+-]\)/ \1/g;') 
    echo "$rando" >> rand
sed "s/-[0-9.]*//g; s/^ //" rand > temp
rm rand

sum=$(sed 's/+//g' temp | xargs  | sed -e 's/\ /+/g' | bc)
n=$(wc -w < temp)
echo Сумма=$sum
echo Кол-во элементов=$n
ser=$(bc<<<"scale=3;$sum/$n")
echo Среднее арифметическое=$ser
rm temp
