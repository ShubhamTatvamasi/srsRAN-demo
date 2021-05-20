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

