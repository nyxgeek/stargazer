#!/bin/bash

outputfile="/var/www/html/scoreboard.txt"
currentdate=`date +"%Y.%m.%d %T"`
github_user="username"
github_key="secret_key"

# update this with your list of github usernames to track
array=(nyxgeek api0cradle darkoperator)


echo "             ________________________________________________________" | tee $outputfile
echo "            |              GITHUB STARGAZER LEADERBOARD              |" | tee -a $outputfile
echo "            |                 $currentdate UTC                |" | tee -a $outputfile
echo "            |                                                        |" | tee -a $outputfile
echo "            |                  nyxgeek - @trustedsec                 |" | tee -a $outputfile
echo "            |________________________________________________________|" | tee -a $outputfile
echo "" | tee -a $outputfile


for item in "${array[@]}"; do
starcount_raw=`count=0; curl -s -u ${github_user}:${github_key} "https://api.github.com/users/$item/repos?page=1&per_page=1000" | jq '.[].stargazers_count' | while read line; do echo $line; ((count+=$line)); echo $count; done | tail -n 1`
printf -v starcount_buffered "%05d" $starcount_raw > /dev/null
marker_count=$((starcount_raw / 100))
marker_line=""
for ((i = 0; i < $marker_count; i++ )); do marker_line+="X"; done

if [[ ${#marker_line} -gt 100 ]]; then
marker_line="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX SHORTENED FOR BREVITY TO 100 CHAR FROM $marker_count XXXXXXXXXXXXXXXXXXXXXXXXX"

fi

tab_line="\t"
tmp_line="$starcount_buffered:$item"
if [[ ${#tmp_line} -le 15 ]]; then tab_line="\t\t"; fi


echo -e "$starcount_buffered:$item$tab_line$marker_line"
done | sort -nr | tee -a $outputfile

echo "" | tee -a $outputfile
echo "Tracking total Github stars across all projects." | tee -a $outputfile
