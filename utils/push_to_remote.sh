#!/usr/bin/env dash

__by_scp() {
    scp "${1}" "${2}"
}

__push() {
    __by_scp \
        "../src/main.pdf" \
        "ssh_xyz:domains/shengdichen.xyz/public_html/CV.pdf"
}

main() {
    __push
    unset -f __by_scp __push
}
main
unset -f main
