#!/bin/sh
set -ex

cd ${0%/*}

version=$(cd /usr/src; ls -1 linux-source-* | sed 's/linux-source-//;s/.tar.xz//' | sort -n | tail -n1)
rm -rf linux-source-*
tar xf /usr/src/linux-source-$version.tar.xz
cd linux-source-$version/

xz -dc /usr/src/linux-config-$version/config.amd64_none_amd64.xz >.config

./scripts/config --disable MODULE_SIG
./scripts/config --disable DEBUG_INFO
./scripts/config --set-str BUILD_SALT "$version-amd64"

./scripts/config --disable HZ_250
./scripts/config --set-val HZ 1000
./scripts/config --enable HZ_1000
./scripts/config --enable IRQ_FORCED_THREADING_DEFAULT
./scripts/config --enable LATENCYTOP
./scripts/config --disable PREEMPT_VOLUNTARY
./scripts/config --enable PREEMPT

./scripts/config --disable KERNEL_XZ
./scripts/config --enable KERNEL_LZ4

make olddefconfig

export PATH="/usr/lib/ccache:$PATH"
export CCACHE_DIR=$PWD/../ccache
export KBUILD_BUILD_TIMESTAMP=''
export KCFLAGS='-march=native'
make bindeb-pkg -j $(nproc) LOCALVERSION=-lowlatency

cd ..
rm -rf linux-source-$version/

ccache -s
