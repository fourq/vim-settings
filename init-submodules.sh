#!/bin/sh
 
set -e

# Taken from here https://gist.github.com/aroemen/5027030

git config -f .gitmodules --get-regexp '^submodule\..*\.path$' |
    while read path_key path
    do
        url_key=$(echo $path_key | sed 's/\.path/.url/')
        url=$(git config -f .gitmodules --get "$url_key")
        if [ ! -d "$path" ]; then
            git submodule add -f $url $path
        fi
    done
