#!/bin/bash
SRC_PATH="$GOPATH/src"
PKG_PATH="$GOPATH/pkg/darwin_amd64"

# https://qiita.com/sonatard/items/7b9b376f3420879a00d6
go tool compile -o buildtest.a -p main -I $PKG_PATH -pack main.go
