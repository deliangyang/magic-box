#!/usr/bin/env bash

FIX_PATH=/mnt/tmp/fix_daily_task
SAVE_LOG_FILE=error_log.log
mkdir -p ${FIX_PATH}
cd ${FIX_PATH}

:> ${SAVE_LOG_FILE}

for i in `seq -w 0 10`; do
    FILE=request-20190425${i}
    wget --ftp-user=xxx --ftp-password=xxxx ftp://xxx@192.168.1.xx/yuechang_log/2019/04/25/${FILE}
    grep -P 'grep '"errno":"500000"'' ${FILE} >> ${SAVE_LOG_FILE}
    #rm -rf ${FILE}
done

echo 'done'
