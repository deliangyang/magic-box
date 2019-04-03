
alias cdwork='cd /mnt/hgfs/work/api-site'
alias sd='sudo su'
alias svim='sudo vim'
alias grep='grep --color'
alias gitm='git commit -m'
alias ngx-conf='cd /usr/local/openresty/nginx/conf/conf.d'
alias tf='tail -f'

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
