# srsRAN-demo

[![docker build](https://github.com/ShubhamTatvamasi/srsRAN-demo/actions/workflows/docker-build.yml/badge.svg?branch=master)](https://github.com/ShubhamTatvamasi/srsRAN-demo/actions/workflows/docker-build.yml)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/shubhamtatvamasi/srsran-demo?sort=semver)](https://hub.docker.com/r/shubhamtatvamasi/srsran-demo)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/shubhamtatvamasi/srsran-demo/latest)](https://hub.docker.com/r/shubhamtatvamasi/srsran-demo)
[![Docker Pulls](https://img.shields.io/docker/pulls/shubhamtatvamasi/srsran-demo)](https://hub.docker.com/r/shubhamtatvamasi/srsran-demo)


Get MME IP address from your AGW:
```bash
ifconfig eth1 | grep 'inet ' | awk '{print $2}'
```

Get **gtp_br0** IP of AGW:
```bash
ifconfig gtp_br0 | grep 'inet ' | awk '{print $2}'
```

For testing download, ping **gtp_br0** network of AGW from UE:
```bash
docker exec -it srsue ping 192.168.128.1
```

For testing upload, ping Network attached IP of UE from AGW:
```bash
ping 192.168.128.12
```
---

### iperf3 test

#### Upload

Start iperf3 server inside AGW:
```bash
iperf3 -s
```

Upload test from srsue docker container:
```bash
docker exec -it srsue iperf3 -c 192.168.60.142 -t 86400
```
> Change IP to Network attach IP

#### Download

Start iperf3 server inside srsue docker container:
```bash
docker exec -it srsue iperf3 -s
```

Download test from AGW:
```bash
iperf3 -c 192.168.128.12 -t 86400
```
> Change IP to Network attach IP

#### iperf3 loop

Start iperf3 server inside AGW:
```bash
iperf3 -s
```

run loop inside srsRAN server:
```bash
./iperf3-loop.sh
```
---

### Debug

packet capture:
```bash
sudo tcpdump -i any -w srs_attach.pcap
```

Ref: https://docs.srsran.com/en/latest/app_notes/source/zeromq/source/index.html

