#!/usr/bin/env bash
cnt=0
echo > record.log
while true
do
	./maybe_wrong.sh >> ./record.log
    if [[ $? -ne 0 ]]; then
    cat record.log
    echo "The script has been ran $cnt times successfully"
    break
 fi
(( cnt++))
done
