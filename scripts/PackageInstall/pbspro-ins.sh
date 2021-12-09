#!/bin/bash

#git clone https://github.com/openpbs/openpbs.git /cachetmp/pbspro
packages=/nas/HPCTools
pbsversion=20.0.1

##install something
yum -y install python3-devel libtool-ltdl-devel postgresql-contrib rpm-build gcc autoconf automake libtool hwloc-devel libX11-devel libXt-devel libedit-devel libical-devel ncurses-devel postgresql-devel python-devel python-devel tcl-devel tk-devel swig expat-devel openssl-devel libXext libXft
mkdir -p /root/rpmbuild/SOURCES/
cp $packages/PBS/openpbs-$pbsversion.tar.gz /root/rpmbuild/SOURCES/openpbs-$pbsversion.tar.gz
cd /root/rpmbuild/SOURCES && tar -zxvf openpbs-$pbsversion.tar.gz
cd /root/rpmbuild/SOURCES/openpbs-$pbsversion && rpmbuild -ba openpbs.spec
cp -rf /root/rpmbuild/RPMS/x86_64 /cachetmp/openpbs
yum install -y /cachetmp/openpbs/openpbs-server-$pbsversion-0.x86_64.rpm

sed -i "s/PBS_START_MOM=0/PBS_START_MOM=1/g" /etc/pbs.conf
