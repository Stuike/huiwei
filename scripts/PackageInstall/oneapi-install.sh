#!/bin/bash

packages=/nas/HPCTools
intel_ins_path=/opt/ohpc/pub/apps/intel

BaseKit=2021.3.0.3422
HPCKit=2021.4.0.3347

#####install intel one api########
echo "Install OneAPI BASEKit NOW!"
###extract and install#
cp $packages/Intel/l_BaseKit_p_`echo $BaseKit`_offline.sh /cachetmp/Intel
cd /cachetmp/Intel
sh l_BaseKit_p_`echo $BaseKit`_offline.sh -x
cd l_BaseKit_p_`echo $BaseKit`_offline

##./install.sh --install-dir=/opt/ohpc/pub/apps/intel --silent --eula accept

./install.sh --components intel.oneapi.lin.dpcpp-cpp-compiler:intel.oneapi.lin.mkl.devel  --install-dir=$intel_ins_path --silent --eula accept

echo "Install OneAPI HPCKit NOW!"
cp $packages/Intel/l_HPCKit_p_`echo $HPCKit`_offline.sh /cachetmp/Intel
cd /cachetmp/Intel
sh l_HPCKit_p_`echo $HPCKit`_offline.sh -x
cd l_HPCKit_p_`echo $HPCKit`_offline
##./install.sh --install-dir=/opt/ohpc/pub/apps/intel --silent --eula accept
./install.sh --components intel.oneapi.lin.ifort-compiler:intel.oneapi.lin.dpcpp-cpp-compiler-pro:intel.oneapi.lin.mpi.devel --install-dir=$intel_ins_path --silent --eula accept