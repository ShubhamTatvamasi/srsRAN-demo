FROM gcc:11.1.0

ARG SRSRAN_VERSION=21_04_pre

ARG LIBZMQ_VERSION=4.3.4

ARG CZMQ_VERSION=4.2.1

RUN apt update && \
    apt install -y \
      cmake \
      fftw3-dev \
      libuhd-dev \
      libsctp-dev \
      libzmq3-dev \
      libboost-dev \
      libmbedtls-dev \
      libbladerf-dev \
      libpcsclite-dev \
      libsoapysdr-dev \
      libconfig++-dev

WORKDIR /tmp

ADD https://github.com/srsran/srsRAN/archive/refs/tags/release_${SRSRAN_VERSION}.zip .

ADD https://github.com/zeromq/libzmq/archive/refs/tags/v${LIBZMQ_VERSION}.zip .

ADD https://github.com/zeromq/czmq/archive/refs/tags/v${CZMQ_VERSION}.zip .

RUN unzip release_${SRSRAN_VERSION}.zip && \
    unzip v${LIBZMQ_VERSION}.zip && \
    unzip v${CZMQ_VERSION}.zip && \
    rm *.zip

WORKDIR /tmp/libzmq-${LIBZMQ_VERSION}

RUN ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    ldconfig

WORKDIR /tmp/czmq-${CZMQ_VERSION}

RUN ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    ldconfig

WORKDIR /tmp/srsRAN-release_${SRSRAN_VERSION}/build

RUN cmake ..
# RUN cmake .. && \
#     make

