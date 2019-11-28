#!/bin/bash
set -eu -o pipefail
set -f
readonly DIR=$(dirname "$0")
#END
cd "${DIR}"
tar xzf pass-update-2.1.tar.gz
cd pass-update-2.1
sudo make install
