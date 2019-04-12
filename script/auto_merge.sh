#!/usr/bin/env bash

cd /mnt/hgfs/work/party-api

ENV=$1
CURRENT_BRANCH=`git branch | grep '*' | sed 's/* //g'`
echo 'current branch ' ${CURRENT_BRANCH}

if [[ ${CURRENT_BRANCH} == 'dev' || ${CURRENT_BRANCH} == 'new-dev' ]]; then
    echo 'illegal branch'
    exit -1
fi

if [[ ${ENV} == 'dev' ]]; then
    git checkout dev
    git pull
    git merge ${CURRENT_BRANCH}
    git push
    git checkout test
    git pull
    git merge dev
    git push
elif [[ ${ENV} == 'new-dev' ]]; then
    git checkout dev-next
    git pull
    git merge ${CURRENT_BRANCH}
    git push
    git checout test-next
    git pull
    git merge dev-next
    git push
fi

echo 'done'