#!/usr/bin/env bash

FIX_PATH=/mnt/tmp/fix_daily_task
SAVE_LOG_FILE=daily_task_log_items.log
mkdir -p ${FIX_PATH}
cd ${FIX_PATH}

:> ${SAVE_LOG_FILE}

for i in `seq -w 11 23`; do
    FILE=consumer-20190422${i}
    wget --ftp-user=xxx --ftp-password=xxx ftp://xxx@192.168.1.123/yuechang_log/2019/04/22/${FILE}
    grep "EXEC returned an unexpected number of response items" ${FILE} >> ${SAVE_LOG_FILE}
    rm -rf ${FILE}
done

grep -oP '{.+$' ${FIX_PATH}/${SAVE_LOG_FILE} | sed 's/ \[\]$//g' > cleaning_data.log
echo 'done'
