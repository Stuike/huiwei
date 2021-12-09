#!/bin/bash

setipaddr=10.10.0.1
setnetmask=
setgateway=

echo "changing /etc/hosts"
echo "$setipaddr `hostname`">>/etc/hosts

echo "loading config file"
cp /etc/sysconfig/network-scripts/ifcfg-$sms_eth_internal /cachetmp/ifcfg.-$sms_eth_internal.bak

cp /etc/sysconfig/network-scripts/ifcfg-$sms_eth_internal /cachetmp/.ifcfg-$sms_eth_internal

echo "rebuild config file"
sed -i "/BOOTPROTO\|ONBOOT\|IPADDR\|NETMASK\|GATEWAY/d" /cachetmp/.ifcfg-$sms_eth_internal
echo "ONBOOT=yes" >>/cachetmp/.ifcfg-$sms_eth_internal
echo "BOOTPROTO=static" >>/cachetmp/.ifcfg-$sms_eth_internal
echo "IPADDR=$setipaddr" >>/cachetmp/.ifcfg-$sms_eth_internal
echo "NETMASK=$setnetmask" >>/cachetmp/.ifcfg-$sms_eth_internal
echo "GATEWAY=$setgateway" >>/cachetmp/.ifcfg-$sms_eth_internal


echo "recover file....."
\cp /cachetmp/.ifcfg-$sms_eth_internal /etc/sysconfig/network-scripts/ifcfg-$sms_eth_internal

echo "restart network....."

ifdown $sms_eth_internal
ifup $sms_eth_internal

