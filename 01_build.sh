#!/usr/bin/env bash

TARGET=hello

for CLANG_VERSION in 4.0 5.0 6.0 7
do
	export CC=clang-${CLANG_VERSION}
	make ${TARGET}
done


for GCC_VERSION in 4.8 5 6 7 8
do
	export CC=gcc-${GCC_VERSION}
	make ${TARGET}
done
