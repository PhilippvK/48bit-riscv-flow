# 48bit-riscv-flow
Experiments with 48-bit endided RISC-V Instructions

## Usage

Either clone this repository recursively via

```sh
git clone https://github.com/PhilippvK/48bit-riscv-flow.git --recursive
```

or fetch the submodules in a two-step fashion:

```sh
git clone https://github.com/PhilippvK/38bit-riscv-flow.git
git submodule update --init --recursive
```


### Step-by-step

Download toolchains

```sh
test -d install/rv32gc_ilp32d || ./scripts/download_helper.sh install/rv32gc_ilp32d/ gnu 2024.09.03 rv32gc_zicsr_zifencei_ilp32d
test -d install/llvm || ./scripts/download_helper.sh install/llvm/ llvm 19.1.6_xcvmem_heuristic
```

Setup venv for M2-ISA-R

```sh
./scripts/setup_m2isar.sh
```

Setup another venv for Seal5
```sh
./scripts/setup_seal5.sh
```

Generate and apply ETISS patches
```sh
# ./scripts/patch_etiss.sh [ETISS_ARCH]
./scripts/patch_etiss.sh RV32IMACFDK
```

Build patched ETISS simulator
```sh
# ./scripts/setup_etiss.sh [Release|Debug]
./scripts/setup_etiss.sh Release
```

Generate & build patched LLVM
```sh
./scripts/patch_llvm.sh
```

Compile target SW
```sh
# ./scripts/compile_example.sh [PROG] [gcc|llvm|seal5_llvm] [ARCH] [ABI]
./scripts/compile_example.sh mnn seal5_llvm rv32gck_zicsr_zifencei ilp32d
```

Run program on patched architecture ETISS
```sh
# ./scripts/run_example.sh [PROG] [CPU_ARCH]
./scripts/run_example.sh mnn RV32IMACFDK
```

### All-in-one

All steps above combined in one single script:

```sh
./scripts/full_flow.sh
```
