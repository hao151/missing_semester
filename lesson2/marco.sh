#!/usr/bin/bash
marco()
{
    now_path=$(pwd)
    echo $now_path > ~/missing_semester/lesson2/marco_history.log
    echo "your current path——${now_path} has been saved"
}

polo()
{
    cd $(cat ~/missing_semester/lesson2/marco_history.log)
    echo "your current path is $(pwd)"
}


