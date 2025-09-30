#!/bin/sh
#
# Copyright (c) 2024-2025 Sidecar CX, LLC <https://www.sidecarcx.com>
#

set -e

volumes="
sidecarcx_self_hosted_cache
sidecarcx_self_hosted_data
sidecarcx_self_hosted_db_18_data
fusionauth_db_18_data
fusionauth_config_data
fusionauth_search_data
"

for volume in $volumes; do
  echo "created volume $(docker volume create "${volume}")."
done

networks="
sidecarcx_self_hosted_net
"

for network in $networks; do
  docker network inspect "${network}" >/dev/null 2>&1 || \
    (docker network create --driver bridge "${network}" && echo "created network ${network}.")
done