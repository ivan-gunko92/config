#!/bin/bash
set -eu -o pipefail
set -f
readonly DIR=$(dirname "$0")
#END
VERSION=3.2.0
curl https://beyondgrep.com/ack-v"${VERSION}" > ~/bin/ack && chmod 0755 ~/bin/ack
