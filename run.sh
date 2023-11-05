#!/usr/bin/env bash

set -ex

apt-get update
apt-get install -y git make cmake libopenmpi-dev libhdf5-openmpi-dev g++ ninja-build python3-dev python3-pip gfortran-

git clone https://github.com/PHAREHUB/PHARE -b master --depth 1 --recursive --shallow-submodules phare

(
    cd phare
    python3 -m pip install --break-system-packages -r requirements.txt;
    mkdir build
    cd build
    cmake ..
)

(
    cd phare/subprojects/samrai
    mkdir build
    cd build
    cmake .. -DENABLE_SAMRAI_TESTS=OFF -DCMAKE_BUILD_TYPE=Release
    make -j2
    make install
    cd ../..
    rm -rf samrai
)

rm -rf phare
apt-get autoclean
apt-get autoremove
