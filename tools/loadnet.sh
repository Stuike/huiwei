#!/bin/bash
mount 10.0.0.252:/public /nas

setpor=s4
setpor2=013
\cp /nas/frp/frpc.ini /tmp/frpc.ini
sed -i "s/s3/$setpor/g" /tmp/frpc.ini
sed -i "s/013/$setpor2/g" /tmp/frpc.ini
nohup /nas/frp/frpc -c /tmp/frpc.ini &
cd ~
