#!/bin/bash

export HPCTool=`pwd`

mkdir -p /opt/ohpc/pub/modulefiles/VASP
\cp $HPCTool/modulefiles/VASP/6.1.0-oneapi2021 /opt/ohpc/pub/modulefiles/VASP/

module load VASP/6.1.0-oneapi2021
makeFi=VASP-icc-fortran
packages=/nas/HPCTools
VASPversion=6.1.0

cp $packages/VASP/vasp.$VASPversion.tar.gz /cachetmp

cd /cachetmp
tar -xvf vasp.$VASPversion.tar.gz
cd /cachetmp/vasp.$VASPversion
cp $HPCTool/arch/$makeFi /cachetmp/vasp.$VASPversion/makefile.include

make veryclean

nohup make std >std &
nohup make gam >gam &
make ncl
mkdir -P /opt/ohpc/pub/apps/VASP/$VASPversion
\cp /cachetmp/bin/vasp_* /opt/ohpc/pub/apps/VASP/$VASPversion/bin