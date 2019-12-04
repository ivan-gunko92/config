#!/bin/bash
set -eu -o pipefail
set -f
readonly DIR=$(dirname "$0")
cd "${DIR}"
#END
CHECKOUT="v2019.07.01"
sudo apt install libncursesw5-dev pkg-config
git clone --branch "${CHECKOUT}" --depth 1 https://github.com/mawww/kakoune.git repo
cd repo/src/
make all -j $(($(nproc) + 1))
PREFIX=$HOME/.local make install

