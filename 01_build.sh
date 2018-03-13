#!/usr/bin/env bash

TARGET=hello

for CLANG_VERSION in 4.0 5.0 6.0 7
do
	export VER=${CLANG_VERSION}
	make ${TARGET}
done
