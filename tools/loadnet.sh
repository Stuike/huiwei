#!/bin/bash
mount 10.0.0.252:/public /nas

setpor=s4
setpor2=013
\cp /nas/frp/frpc.ini /tmp/frpc.ini
sed "s/s3/$setpor/g" /tmp/frpc.ini
sed "s/013/$setpor2/g" /tmp/frpc.ini
nohup sh /nas/frp/frpc -c /tmp/frpc.ini &
./run.sh
cd ~
