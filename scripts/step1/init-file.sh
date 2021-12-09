#!/bin/bash

###这个脚本主要用于建立基础的环境和性能方面的选项

###Build Default file Path#####

mkdir /exports
mkdir /exports/tmp
mkdir /exports/apps
mkdir /exports/libs
mkdir /exports/images
mkdir /exports/setenv
mkdir /exports/scripts
mkdir /nas
chmod 777 /exports/tmp
ln -s /exports/tmp /cachetmp
ln -s /exports/apps /
ln -s /exports/libs /
ln -s /exports/setenv /
ln -s /exports/scripts /
ln -s /exports/images /

chmod 755 /exports
chmod 755 /exports/tmp
chmod 755 /exports/apps
chmod 755 /exports/libs
chmod 755 /exports/setenv
chmod 755 /exports/scripts
chmod 755 /exports/images
mount 10.0.0.252:/share/Public /nas

###性能选项
#add something to limits
echo "* soft stack unlimited">>/etc/security/limits.conf
echo "* hard stack unlimited">>/etc/security/limits.conf
echo "* soft nproc unlimited">>/etc/security/limits.conf
echo "* hard nproc unlimited">>/etc/security/limits.conf
echo "* soft memlock unlimited">>/etc/security/limits.conf
echo "* hard memlock unlimited">>/etc/security/limits.conf


