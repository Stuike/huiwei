#!/bin/bash

#disable security flag
swapoff -a
echo 0 > /proc/sys/kernel/numa_balancing
echo 0 > /proc/sys/kernel/randomize_va_space
echo 0 > /sys/kernel/debug/x86/retp_enabled
echo 0 > /sys/kernel/debug/x86/pti_enabled
echo 0 > /sys/kernel/debug/x86/ibrs_enabled
echo 0 > /sys/kernel/debug/x86/ibpb_enabled

#disable selinux
setenforce 0

#change cpu frequency set to performance
cpupower frequency-set -g performance
cpupower idle-set -d 2