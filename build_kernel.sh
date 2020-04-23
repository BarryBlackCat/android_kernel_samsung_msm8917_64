#!/bin/bash


OUT_DIR=out

# you should change the "CROSS_COMPILE" to right toolchain path (you downloaded)
# ex)CROSS_COMPILE={android platform directory you downloaded}/android/prebuilt/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
COMMON_ARGS="-C $(pwd) O=$(pwd)/${OUT_DIR} ARCH=arm CROSS_COMPILE=aarch64-linux-android- KCFLAGS=-mno-android"

export PATH=/home/cranberry/Android-kernel-building/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:$PATH
export ARCH=arm64

[ -d ${OUT_DIR} ] && rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}

make ${COMMON_ARGS} j6primelte_defconfig
make -j64 ${COMMON_ARGS}

cp ${OUT_DIR}/arch/arm64/boot/zImage $(pwd)/arch/arm64/boot/zImage