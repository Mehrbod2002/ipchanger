#!/bin/bash
printf '\033[0;36mWrote by Mehrbod Akhlaghpour ...\n'
read -p $'Enter Time for Reload ip by sencond : ' timereload
read -p $'How many times do you want to change your ip : ' timetoreload
f(){
service tor start
for ((i=1;i<$timetoreload;i++));do
sleep $timereload
service tor restart
printf '\033[0;32m<<<your ip changed>>>'
printf '\n'
done;
}
f

