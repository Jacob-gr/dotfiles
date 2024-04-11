alias cat='batcat -pp'
alias bcat='batcat'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias htop='btop'
alias lt='ls --human-readable --size -1 -S --classify'
alias hg='history|grep'
alias le='batcat --paging=always --pager=less'

fixroute() {
    if [ $# -eq 0 ]; then
        echo "Usage: fixroute <destination_ip>"
        return 1
    fi

    local destination="$1"
    route -n | awk -v dest="$destination" '$1 == dest {print $2, $3, $8}' | while read -r gw mask iface; do
        sudo route del -net "$destination" gw "$gw" netmask "$mask" dev "$iface"
    done
}

# This function provides a shortcut to search installed tldr pages.
# It uses the first argument as a grep expression
tf() {
    tldr -l | \
    tr -d "[]" | \
    tr "," "\n" | \
    sed "s/'//g" | \
    sed 's/^[ \t]*//;s/[ \t]*$//' | \
    grep "$1"
}

alias fr='fixroute 192.168.250.31'