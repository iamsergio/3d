#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INSTALL_TO="/pub_data/installed/mesa/26.04"

cd $SCRIPT_DIR/../mesa/

rm -rf build/

meson setup build/ \
    -Dprefix=$INSTALL_TO \
    -Dvulkan-drivers=amd \
    -Dgallium-drivers= \
    -Dbuildtype=debugoptimized \
    -Dallow-fallback-for=libdrm

ninja -C build
ninja -C build install

echo "Mesa installed to $INSTALL_TO"
