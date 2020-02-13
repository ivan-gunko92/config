pushd . > /dev/null
SCRIPT_PATH="${BASH_SOURCE[0]}";
while([ -h "${SCRIPT_PATH}" ]); do
    cd "`dirname "${SCRIPT_PATH}"`"
    SCRIPT_PATH="$(readlink "`basename "${SCRIPT_PATH}"`")";
done
cd "`dirname "${SCRIPT_PATH}"`" > /dev/null
SCRIPT_PATH="`pwd`";
popd  > /dev/null

source "${SCRIPT_PATH}"/z/z.sh
for f in "${SCRIPT_PATH}"/bashrc.d/*; do source $f; done
eval $(thefuck --alias)

export my="${SCRIPT_PATH}"/..
export config="${SCRIPT_PATH}"
export repo="${my}"/repo
export data="${my}"/data
export music="${data}"/music
export tips="${my}"/tips
export PASSWORD_STORE_DIR="${my}"/pass
export kittyd="${HOME}/.config/kitty/"
export passd="${PASSWORD_STORE_DIR}"

export PAGER='less'
export LESS='--RAW-CONTROL-CHARS --LONG-PROMPT --IGNORE-CASE --tabs=4'
export PATH="${config}/bin:${HOME}/bin:${HOME}/.local/bin:${PATH}"

NC='\e[0m'
DarkGray='\e[1;30m'
Blue='\e[0;34m'
LightBlue='\e[1;34m'
Green='\e[0;32m'
LightGreen='\e[1;32m'
Cyan='\e[0;36m'
LightCyan='\e[1;36m'
Red='\e[0;31m'
LightRed='\e[1;31m'
Purple='\e[0;35m'
LightPurple='\e[1;35m'
Brown='\e[0;33m'
Yellow='\e[1;33m'
LightGray='\e[0;37m'

function ret_code_colored {
    if [ "$?" == "0" ]; then
        echo -e "${Green}0${NC}"
    else
        echo -e "${Red}$?${NC}"
    fi
}
DELIMITER="________________________________________________________________________________"
PS1="${LightCyan}${DELIMITER}${NC}\n[\`ret_code_colored\`] \w  ${Blue}\u${NC}@${Brown}\h${NC} [jobs: \j]${NC}\n> "

echo Lol
