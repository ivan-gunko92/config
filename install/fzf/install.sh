#!/bin/bash
set -eu -o pipefail
set -f
readonly DIR=$(dirname "$0")
cd "${DIR}"
#END
CHECKOUT=0.19.0
git clone  https://github.com/junegunn/fzf.git fzf-repo
cd fzf-repo
git checkout "${CHECKOUT}" -- 
./install
ln -s $(pwd)/bin/fzf ~/bin/fzf


