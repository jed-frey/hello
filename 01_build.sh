#!/usr/bin/env bash

for v in 4.0 5.0 6.0 7
do
	CC=clang-$v make hello
done


for v in 4.8 5 6 7 8
do
	CC=gcc-$v make hello
done
