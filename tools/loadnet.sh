#!/bin/bash
mount 10.0.0.252:/public /nas

setpor=s4
setpor2=013
\cp /nas/HPCTool/frp/frpc.ini /tmp/frpc.ini
sed -i "s/NAmE/$setpor/g" /tmp/frpc.ini
sed -i "s/POrT/$setpor2/g" /tmp/frpc.ini
nohup /nas/HPCTool/frp/frpc -c /tmp/frpc.ini >/tmp/frpc.log &
