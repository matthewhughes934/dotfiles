#!/bin/bash

gocov() {
    local filename="${1:-coverage.out}"
    # based on some undocumented behaviour...
    # https://github.com/golang/go/blob/ffbd194f5cf399a98578ea950c969d07a751ecfd/src/cmd/vendor/golang.org/x/tools/cover/profile.go#L58
    awk 'NR>1 && $NF==0 {print $1}' "$filename"
}

godoc() {
    go doc -all "$@" | less
}
export -f godoc

gohelp() {
    go help "$@" | less
}

# go build -gcflags="$GODEBUG_FLAGS"
export GODEBUG_FLAGS="all=-N -l"
