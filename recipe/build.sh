#!/bin/bash

export ESMF_DIR=$(pwd)
export ESMF_INSTALL_PREFIX=${PREFIX}
export ESMF_INSTALL_BINDIR=${PREFIX}/bin
export ESMF_INSTALL_DOCDIR=${PREFIX}/doc
export ESMF_INSTALL_HEADERDIR=${PREFIX}/include
export ESMF_INSTALL_LIBDIR=${PREFIX}/lib
export ESMF_INSTALL_MODDIR=${PREFIX}/mod
export ESMF_NETCDF="split"
export ESMF_NETCDF_INCLUDE=${PREFIX}/include
export ESMF_NETCDF_LIBPATH=${PREFIX}/lib

export ESMF_COMM=mpiuni

make
#make check
make install
#otool -L ${PREFIX}/bin/ESMF_Info
#ldd ${PREFIX}/bin/ESMF_Info
#exit 1
#  - conda create -n esmf --yes -c conda-forge esmf
#  - source activate esmf
#  - find /Users/travis/miniconda3/envs/esmf -name "*libesmf*"
_ESMF_LIB_PATH=${PREFIX}/lib/libesmf.dylib
#_ESMF_ORIGINAL_LIB_PATH=/Users/travis/miniconda3/conda-bld/work/esmf/lib/libO/Darwin.gfortran.64.mpiuni.default/libesmf.dylib
_CURRENT_DIRECTORY=`pwd`
_ESMF_ORIGINAL_LIB_PATH=`find ${_CURRENT_DIRECTORY}/lib -name '*libesmf.dylib'`
_ESMF_INFO_PATH=${PREFIX}/bin/ESMF_Info
#ESMF_Info
#otool -D ${ESMF_LIB_PATH}
#otool -L ${ESMF_INFO_PATH}
install_name_tool -change ${_ESMF_ORIGINAL_LIB_PATH} ${_ESMF_LIB_PATH} ${_ESMF_INFO_PATH}
#  - ESMF_Info