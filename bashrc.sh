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
PATH="${PATH}:${config}/bin"

echo Lol
