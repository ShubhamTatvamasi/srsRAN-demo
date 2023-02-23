FROM ubuntu:jammy

ARG SRSRAN_VERSION=22_10

ARG LIBZMQ_VERSION=4.3.4

ARG CZMQ_VERSION=4.2.1

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y \
        build-essential \
        cmake \
        unzip \
        wget \
        curl \
        vim \
        ripgrep \
        iptables \
        iproute2 \
        iputils-ping \
        libfftw3-dev \
        libmbedtls-dev \
        libpcsclite-dev \
        libboost-program-options-dev \
        libconfig++-dev \
        libsctp-dev \
        libczmq-dev \
        libpcsclite-dev \
        rapidjson-dev \
        colordiff \
        ninja-build \
        clang-format-14 \
        libtool-bin \
        autoconf \
        iperf3 \
        net-tools \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srsran

RUN wget https://github.com/srsran/srsRAN_4G/archive/refs/tags/release_${SRSRAN_VERSION}.zip && \
    wget https://github.com/zeromq/libzmq/archive/refs/tags/v${LIBZMQ_VERSION}.zip && \
    wget https://github.com/zeromq/czmq/archive/refs/tags/v${CZMQ_VERSION}.zip && \
    unzip release_${SRSRAN_VERSION}.zip && \
    unzip v${LIBZMQ_VERSION}.zip && \
    unzip v${CZMQ_VERSION}.zip && \
    rm *.zip

WORKDIR /srsran/libzmq-${LIBZMQ_VERSION}

RUN ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    ldconfig

WORKDIR /srsran/czmq-${CZMQ_VERSION}

RUN ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    ldconfig

WORKDIR /srsran/srsRAN-release_${SRSRAN_VERSION}/build

RUN cmake .. && \
    make && \
    ldconfig && \
    mv ./srsenb/src/srsenb \
       ./srsepc/src/srsepc \
       ./srsepc/src/srsmbms \
       ./srsue/src/srsue \
    /usr/local/bin

RUN mkdir -p /etc/srsran && \
    find .. -type f -name '*.example' -exec \
    bash -c 'x={}; y=${x##*/}; z=${y%.example}; \
    cp {} /etc/srsran/${z}' \;

WORKDIR /etc/srsran
