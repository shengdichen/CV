#!/usr/bin/env dash

__by_scp() {
    scp "${1}" "${2}"
}

__by_scp_xyz() {
    __by_scp \
        "${1}" \
        "ssh_xyz:domains/shengdichen.xyz/public_html/${2}"
}

__push() {
    local _pdf_only""
    if [ "${1}" = "--pdf-only" ]; then
        _pdf_only="yes"
    fi

    __by_scp_xyz "../src/main.pdf" "CV.pdf"

    find "../ms" -mindepth 1 -type f | while read -r _f; do
        printf "> [%s]\n" "${_f}"

        if [ "${_pdf_only}" ]; then
            if printf "%s" "${_f}" | grep -q "\.pdf$"; then
                __by_scp_xyz "${_f}" "$(basename "${_f}")"
            fi
        else
            __by_scp_xyz "${_f}" "$(basename "${_f}")"
        fi

    done
}

__push "${@}"
