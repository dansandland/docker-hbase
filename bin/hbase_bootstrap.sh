#!/bin/bash

set -eo pipefail

if [[ -n $HBASE_CREATE_NAMESPACE ]]; then
    echo
    echo '***********************************************'
    echo 'Create namespaces. First sleep for 20 seconds '
    echo 'to ensure hbase is up...'
    echo '***********************************************'
    echo
    sleep 20
    hbase_cmd=""
    IFS=','; for namespaceToCreate in $HBASE_CREATE_NAMESPACE; do
        hbase_cmd="${hbase_cmd}create_namespace '$namespaceToCreate'; "
    done
    echo "$hbase_cmd" | hbase shell -n
fi