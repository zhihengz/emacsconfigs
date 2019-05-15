#!/usr/bin/env bash
#
# install emacs configuration
#
function create_layout {
    mkdir -p ~/.emacs.d/profiles/public
    mkdir -p ~/.emacs.d/profiles/private
}

function backup_file {
    local file=$1
    if [ -f "$file" ] || [ -d "$file" ]; then
        echo "move $file to ${file}.bak"
        mv "$file" "${file}.bak"
    fi
}

function install_and_backup {
    local source=$1
    local dest=$2
    backup_file "$dest"
    cp -fr "$source" "$dest"
}

function install_configs {
    create_layout
    touch ~/.emacs.d/custom.el
    install_and_backup init.el ~/.emacs.d/init.el
    install_and_backup profiles ~/.emacs.d/profiles/public
}

install_configs
