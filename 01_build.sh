#!/usr/bin/env bash

TARGET=debug

for v in 4.0 5.0 6.0 7
do
	export CC=clang-$v
	export CXX=clang-cpp-$v
	make ${TARGET}
done


for v in 4.8 5 6 7 8
do
	export CC=gcc-$v
	export CXX=g++-$v
	make ${TARGET}
done
