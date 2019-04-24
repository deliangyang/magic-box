#!/usr/bin/env bash

REPLACE_CRLF_TO_LF=$(cat $1 | sed 's/~/#/g' | sed 's/[\r\n]/~/g' | tr '\n' '~')
LEN=$(echo ${REPLACE_CRLF_TO_LF} | wc -m)

test "${LEN}" = "$(cat $1 | sed 's/~/#/g' | sed 's/[\r\n]/~/g' | tr '\n' '~' |
    grep -oP '^(feat|fix|docs|style|refactor|perf|test|chore|revert)(\([^\)]+\))?:[^~]+(~~.+(?=~~))?(~~.+)?~?' |
    wc -m)" || {
    echo >&2 [x] bad commit | cat <<\EOF
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
EOF
    exit 1
}
