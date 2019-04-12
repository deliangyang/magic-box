#!/usr/bin/env bash

cd /mnt/hgfs/work/party-api

ENV=$1
CURRENT_BRANCH=`echo git branch | grep '*' | sed 's/* //g'`
echo 'current branch ' ${CURRENT_BRANCH}

if [[ ${CURRENT_BRANCH} == 'dev' || ${CURRENT_BRANCH} == 'new-dev' ]]; then
    echo 'illegal branch'
    exit -1
fi

if [[ ${ENV} == 'dev' ]]; then
    echo git checkout dev
    echo git pull
    echo git merge ${CURRENT_BRANCH}
    echo git push
    echo git checkout test
    echo git pull
    echo git merge dev
    echo git push
elif [[ ${ENV} == 'new-dev' ]]; then
    echo git checkout dev-next
    echo git pull
    echo git merge ${CURRENT_BRANCH}
    echo git push
    echo git checout test-next
    echo git pull
    echo git merge dev-next
    echo git push
fi

echo 'done'