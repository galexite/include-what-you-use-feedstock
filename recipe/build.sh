#!/usr/bin/env bash

set -eu

mkdir -p build
cd build

cmake \
  -G "Unix Makefiles" \
  ${CMAKE_ARGS} \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_BUILD_TYPE=release \
  -DCMAKE_C_COMPILER=${CC} \
  -DCMAKE_CXX_COMPILER=${CXX} \
  ..

cmake --build .
cmake --install . -v
