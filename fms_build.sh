#!/bin/bash
mkdir -p build/fms/
(cd build/fms; rm -f path_names; \
 ../../src/mkmf/bin/list_paths -l ../../src/FMS; \
 ../../src/mkmf/bin/mkmf -t ../../src/mkmf/templates/ncrc5-gcc.mk -p libfms.a -c "-Duse_libMPI -Duse_netCDF" path_names)
#../../src/mkmf/bin/mkmf -t ../../src/mkmf/templates/ncrc5-intel.mk -p libfms.a -c "-Duse_libMPI -Duse_netCDF" path_names)


#source ./build/env/gaea_intel
source ./build/env/gaea_gnu
make -C ./build/fms NETCDF=4 REPRO=1 libfms.a -j
