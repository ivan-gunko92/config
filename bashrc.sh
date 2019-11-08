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

export my="${SCRIPT_PATH}"

echo Lol
