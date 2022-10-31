#!/usr/bin/env bash

_by_scp() {
    local local_path=$1
    local remote_path=$2

    scp "$local_path" "$remote_path"
}

push_to_xyz() {
    _by_scp \
        "../src/main.pdf" \
        "ssh_xyz:domains/shengdichen.xyz/public_html/CV.pdf"
}
push_to_xyz

# vim: filetype=sh
