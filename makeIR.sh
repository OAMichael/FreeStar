#!/bin/bash

script_dir=$(dirname "$(realpath $0)")

clang ${script_dir}/main.c -o ${script_dir}/main.ll -S -emit-llvm
