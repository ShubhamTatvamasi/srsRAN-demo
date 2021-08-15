#!/usr/bin/env bash

MME_IP=192.168.60.142

while true; do
  docker exec -it srsue iperf3 -c ${MME_IP}
  docker exec -it srsue iperf3 -c ${MME_IP} -R
done
