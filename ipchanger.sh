#!/bin/bash
f(){
read -p $'Enter Time for Reload ip by sencond : ' timereload
read -p $'How many times do you want to change your ip : ' timetoreload
service tor start
for ((i=1;i<$timetoreload;i++));do
sleep $timereload
service tor restart
printf '\033[0;32m<<<your ip changed>>>'
printf '\n'
done;
}
f1(){
read -p $'Enter Time for Reload mac by sencond : ' timereload
read -p $'How many times do you want to change your mac : ' timetoreload
read -p $'Choose Your Interface (pass it to use eth0 interface ): ' interface
if [[ $interface=0 ]];then
interface1=eth0
else
interface1=$interface
fi
a=$(($RANDOM % 89+10))
b=$(($RANDOM % 89+10))
c=$(($RANDOM % 89+10))
d=$(($RANDOM % 89+10))
e=$(($RANDOM % 89+10))
f=$(($RANDOM % 89+10))
if [[ $timereload < 0 ]];then
clear
printf "IT IS IMPOSSIBLE TO CHANGE MAC UNDER 0 SEC:)))))"
f1
else
if [[ $timetoreload < 0 ]];then
clear
printf "IT IS IMPOSSIBLE TO CHANGE MAC FOR NEG NUMBER:)))))"
f1
else
for ((i=1;i<=$timetoreload;i++));do
ifconfig $interface1 down
macchanger --mac $a:$b:$c:$d:$e:$f $interface1
ifconfig $interface1 up
sleep $timereload
printf '<<<YOUR MAC CHANGED>>>'
printf '\n'
done;
fi;
fi;
}
banner(){
printf $'\033[0;36mWrote by Mehrbod Akhlaghpour ...:) \n'
printf $'\033[0;34m1-IP changer \n'
printf $'\033[0;34m2-MAC changer \n'
read -p $'Choose an option : ' option
if [[ $option -eq 1 ]];then
clear
f
elif [[ $option -eq 2 ]];then
clear
f1
else
clear
printf $'Choose an corret option please ....:)'
banner
f1
fi
}
clear
banner
