
alias cdwork='cd /mnt/hgfs/work/api-site'
alias cdapi='cd /mnt/hgfs/worK/party-api'
alias sd='sudo su'
alias svim='sudo vim'
alias grep='grep --color'
alias gitm='git commit -m'
alias ngx-conf='cd /usr/local/openresty/nginx/conf/conf.d'
alias tf='tail -f'
alias s='. ~/.bash_profile'
alias vim-profile='vim ~/.bash_profile && s'
export GOPROXY=https://goproxy.io

complete -W "$(echo $(cat ~/.ssh/config | grep -oP '^Host\s([a-z\.]+)' | sort -u | sed 's/^Host //'))" scp

gitc() {
    git add *
    git stash save
}

gitfc() {
    git clean -df
    git reset --hard
}

db() {
    mysql -uroot -p $1
}

mkcd() {
    mkdir -p $1
    cd $1
}

cp-ngx-conf() {
    ngx-conf && copy default.conf $1.conf
}

ssh-sowing() {
    PUBLIC_KEY=`cat ~/.ssh/id_rsa.pub`
    HOST_INFO=$1
    ssh ${HOST_INFO} <<EOF
mkdir -p ~/.ssh
echo ${PUBLIC_KEY} >> ~/.ssh/authorized_keys
chmod 644 ~/.ssh/authorized_keys
exit
EOF

    USERNAME=$(echo ${HOST_INFO} | awk -F@ '{print $1}')
    HOST=$(echo ${HOST_INFO} | awk -F@ '{print $2}')
    cat >> ~/.ssh/config <<EOF
HOST ${HOST_INFO}
    HostName ${HOST}
    User ${USERNAME}
EOF
}

send-mail-test() {
   /usr/bin/python /mnt/hgfs/fwork/auto-work/send-email-with-git.py $1
}