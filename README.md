# srsRAN-demo

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/shubhamtatvamasi/srsran-demo)](https://hub.docker.com/r/shubhamtatvamasi/srsran-demo)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/shubhamtatvamasi/srsran-demo?sort=semver)](https://hub.docker.com/r/shubhamtatvamasi/srsran-demo)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/shubhamtatvamasi/srsran-demo/latest)](https://hub.docker.com/r/shubhamtatvamasi/srsran-demo)
[![Docker Pulls](https://img.shields.io/docker/pulls/shubhamtatvamasi/srsran-demo)](https://hub.docker.com/r/shubhamtatvamasi/srsran-demo)
[![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/shubhamtatvamasi/srsran-demo/latest)](https://hub.docker.com/r/shubhamtatvamasi/srsran-demo)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/shubhamtatvamasi/srsran-demo)](https://hub.docker.com/r/shubhamtatvamasi/srsran-demo)


Get MME IP address from your AGW:
```bash
ifconfig eth1 | grep 'inet ' | awk '{print $2}'
```

Get the IP of AGW:
```bash
ifconfig eth2 | grep 'inet ' | awk '{print $2}'
```

For testing download, ping AGW from UE:
```bash
docker exec -it srsue ping 192.168.129.1
```
---

## Work in progress

For testing upload, ping Network attached IP of UE from AGW:
```bash
ping 172.50.50.11
```

192.168.0.5
docker exec -it srsue ping 192.168.128.21

---

docker exec -it srsue ping 192.168.0.5



docker exec -it srsue iperf3 -c 192.168.0.5 -f m
iperf3 -s 192.168.0.5


