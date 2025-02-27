#!/bin/bash

set -e

test -d install/rv32gc_ilp32d || ./scripts/download_helper.sh install/rv32gc_ilp32d/ gnu 2024.09.03 rv32gc_ilp32d

test -d install/llvm || ./scripts/download_helper.sh install/llvm/ llvm 19.1.6_xcvmem_heuristic

./scripts/setup_m2isar.sh

./scripts/setup_seal5.sh

./scripts/patch_etiss.sh RV32IMACFDK

./scripts/setup_etiss.sh Release

./scripts/patch_llvm.sh

# ./scripts/compile_example.sh 48bit_test seal5_llvm rv32gck ilp32d Release
./scripts/compile_example.sh 48_bit_test llvm rv32gck ilp32d Release

./scripts/run_example.sh 48bit_test RV32IMACFDK
