#!/bin/bash

#####install intel one api########
###extract and install#

packages=/nas/HPCTools
BaseKit=2021.3.0.3422
HPCKit=2021.4.0.3347

echo "Install OneAPI BASEKit NOW!"
cp $packages/Intel/l_BaseKit_p_${BaseKit}_offline.sh ${package_dir}
cd ${package_dir}
sh l_BaseKit_p_${BaseKit}_offline.sh -x
cd l_BaseKit_p_${BaseKit}_offline
##./install.sh --install-dir=/opt/ohpc/pub/apps/intel --silent --eula accept
./install.sh --components intel.oneapi.lin.dpcpp-cpp-compiler:intel.oneapi.lin.mkl.devel  --install-dir=/opt/ohpc/pub/apps/intel --silent --eula accept

cp $packages/Intel/l_HPCKit_p_${HPCKit}_offline.sh ${package_dir}
cd ${package_dir}
sh l_HPCKit_p_${HPCKit}_offline.sh -x
cd l_HPCKit_p_${HPCKit}_offline
##./install.sh --install-dir=/opt/ohpc/pub/apps/intel --silent --eula accept
./install.sh --components intel.oneapi.lin.ifort-compiler:intel.oneapi.lin.dpcpp-cpp-compiler-pro:intel.oneapi.lin.mpi.devel --install-dir=/opt/ohpc/pub/apps/intel --silent --eula accept

#./install.sh --list-products
#./install.sh --list-components --product-id intel.oneapi.lin.basekit.product --product-ver 2021.3.0-3219
#./install.sh --list-components --product-id intel.oneapi.lin.hpckit.product --product-ver 2021.3.0-3230

#the pacakge is installed as big as 22G, uninstaller is in /opt/intel##
# install tmpfiles is in /opt/intel/oneapi/installer, can repair install #

## how to make module###
/opt/ohpc/pub/apps/intel/modulefiles-setup.sh

echo 'export MODULEPATH=${MODULEPATH}:/opt/ohpc/pub/apps/intel/modulefiles' >> /etc/profile.d/lmod.sh

## this command is ok
pdsh -w ${compute_prefix}0[1-2]  echo 'export MODULEPATH=\${MODULEPATH}:/opt/ohpc/pub/apps/intel/modulefiles' \>\> /etc/profile.d/lmod.sh
## also can add in /etc/profile.d/lmod.sh
##export MODULEPATH=${MODULEPATH}:/opt/ohpc/pub/apps/intel/compiler/latest/modulefiles:/opt/ohpc/pub/apps/intel/mkl/latest/modulefiles:/opt/ohpc/pub/apps/intel/mpi/latest/modulefiles:/opt/ohpc/pub/apps/intel/tbb/latest/modulefiles
