#!/usr/bin/env bash

FIX_PATH=/mnt/tmp/fix_daily_task
SAVE_LOG_FILE=error_log.log
mkdir -p ${FIX_PATH}
cd ${FIX_PATH}

:> ${SAVE_LOG_FILE}

for i in `seq -w 0 11`; do
    FILE=consumer-20190424${i}
    #wget --ftp-user=michong --ftp-password=xtkj2016 ftp://michong@192.168.1.172/yuechang_log/2019/04/24/${FILE}
    grep -oP 'Consume Error Occurred.+"errors":' ${FILE} >> ${SAVE_LOG_FILE}
    #rm -rf ${FILE}
done

echo 'done'
