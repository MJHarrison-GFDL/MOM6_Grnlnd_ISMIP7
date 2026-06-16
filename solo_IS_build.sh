#/bin/bash
mkdir -p build/IS_solo/
(cd build/IS_solo/; rm -f path_names; \
../../src/mkmf/bin/list_paths -l ./ ../../src/MOM6/{config_src/infra/FMS2,config_src/memory/dynamic_symmetric,config_src/drivers/ice_solo_driver,config_src/external,src/{*,*/*}}/ ; \
 ../../src/mkmf/bin/mkmf -t ../../src/mkmf/templates/ncrc5-gcc.mk -o '-I../fms' -p MOM6 -l '-L../fms -lfms' -c '-Duse_libMPI -Duse_netCDF' path_names)
# ../../src/mkmf/bin/mkmf -t ../../src/mkmf/templates/ncrc5-intel.mk -o '-I../fms' -p MOM6 -l '-L../fms -lfms' -c '-Duse_libMPI -Duse_netCDF' path_names)
source ./build/env/gaea_gnu
#source ./build/env/gaea_intel
make -C ./build/IS_solo NETCDF=4 REPRO=1 MOM6 -j
