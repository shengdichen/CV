#!/usr/bin/env bash

function _by_scp() {
    local local_path=$1
    local remote_path=$2

    scp "${local_path}" "${remote_path}"
}

function push_to_xyz() {
    _by_scp \
        "../src/main.pdf" \
        "ssh_xyz:domains/shengdichen.xyz/public_html/CV.pdf"
}

function main() {
    push_to_xyz

    unset -f _by_scp push_to_xyz
}
main
unset -f main
