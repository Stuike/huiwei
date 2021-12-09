#!/bin/bash

CCchios=/setenv/oneapi.sh
makeFi=VASP-icc-fortran
packages=/nas/HPCTools
VASPversion=6.1.0


source /setenv/oneapi.sh

cp $packages/VASP/vasp.$VASPversion.tar.gz /apps
cd /apps
tar -xvf vasp.$VASPversion.tar.gz
cd /apps/vasp.$VASPversion
cp $HPCTool/arch/$makeFi /apps/vasp.$VASPversion/makefile.include

nohup make std >std &
nohup make gam >gam &
make ncl
