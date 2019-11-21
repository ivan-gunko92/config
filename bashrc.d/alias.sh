alias v=vim
alias j=jobs
alias f=fuck
alias last='echo $?'
alias l="/bin/ls --color --group-directories-first -lh --time-style=long-iso -A -og"
alias ll="/bin/ls --color --group-directories-first -lh --time-style=long-iso -a"
alias ls="/bin/ls --color --group-directories-first" 
alias la="/bin/ls --color --group-directories-first -A" 

function dir() { mkdir -p "$1" && cd "$1" ; }
alias clear-dir='rm -rf ./*' 
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias d-run='docker run -it --rm'
alias d-run-bash='docker run -it --rm --entrypoint=/bin/bash'
alias d-im='docker images |grep'
d-ps () {
	docker ps --format '{docker_pretty_ps () {{.Names}}\n\tContainer ID:\t{{.ID}}\n\tImage: \t{{.Image}}\n\tCommand: \t{{.Command}}\n\tCreated: \t{{.CreatedAt}}\n\tStatus: \t{{.Status}}\n\tPorts: \t{{.Ports}}\n\n' | awk '{ if ( $0 ~ /^[a-zA-Z]/ ) printf "%c[1;"(((NR-1)%5)+31)"m"$0"\n", 27; else printf "%c[1;0m"$0"\n", 27; }'
}

alias psa='ps -aux |grep'
alias en='env |grep'
alias r-bash='source ~/.bashrc'
alias r-tmux='tmux source-file ~/.tmux.conf'

pr-dir-sizes () {
    for D in `find . -maxdepth 1 -type d`
    do
     du -hs "${D}"
    done
}
pr-port () {
  sudo netstat -tulpn | grep "$1"
  sudo lsof -i:"$1"
}
alias pr-mem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
alias pr-cpu='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'

alias aptupdate='sudo apt-get update'
alias aptupgrade='sudo apt-get update ; sudo apt-get upgrade'
alias aptsearch='sudo apt-cache search '
alias aptinstall='sudo apt-get install '
alias aptremove='sudo apt-get remove '
alias aptpurge='sudo apt-get purge '
alias aptautoremove='sudo apt-get autoremove'

# Поиск файла по шаблону:
function search-file() { find . -type f -iname '*'$*'*' -ls ; }
# Поиск файла по шаблону в $1 и запуск команды в $2 с ним:
function search-file-exec() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;  ; }
# поиск строки по файлам:
function search-file-str()
{
    OPTIND=1
    local case=""
    local usage="fstr: поиск строки в файлах.
Порядок использования: fstr [-i] \"шаблон\" [\"шаблон_имени_файла\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    local SMSO=$(tput smso)
    local RMSO=$(tput rmso)
    find . -type f -name "${2:-*}" -print0 | xargs -0 grep -sn ${case} "$1" 2>&- | \
sed "s/$1/${SMSO}\0${RMSO}/gI" | more
}

function repeat()       # повторить команду n раз
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-подобный синтаксис
        eval "$@";
    done
}

function ask()
{
    echo -n "$@" '[y/n] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}

