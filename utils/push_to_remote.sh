#!/usr/bin/env bash

_by_scp() {
    local local_path=$1
    local remote_path=$2

    scp "$local_path" "$remote_path"
}

# vim: filetype=sh
