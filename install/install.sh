#!/bin/sh
#
# Copyright (c) 2024 Sidecar CX, LLC <https://www.sidecarcx.com>
#

set -e

SCRIPT_DIR=$(dirname "$0")

os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(uname -m | tr '[:upper:]' '[:lower:]')

if [ ! -f "${SCRIPT_DIR}/installer_${os}_${arch}" ]; then
  echo "unsupported os and architecture - ${os}_${arch}"
  exit 1
fi

sh "${SCRIPT_DIR}/create_resources.sh"
"${SCRIPT_DIR}/installer_${os}_${arch}"