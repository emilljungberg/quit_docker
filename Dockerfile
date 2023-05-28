#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:latest

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common gcc pkg-config && \
  apt-get install -y git man unzip wget curl cmake && \
  apt-get install -y ninja-build zip zlib1g zlib1g-dev autoconf autoconf-archive && \
  rm -rf /var/lib/apt/lists/*

#### QUIT ####
WORKDIR /root
RUN git clone https://github.com/spinicist/QUIT.git
WORKDIR /root/QUIT
RUN git fetch origin
RUN git checkout -b build origin/build
RUN export VCPKG_FORCE_SYSTEM_BINARIES=0 && \
  ./bootstrap.sh

RUN mkdir /root/app
WORKDIR /root/app

# Define default command.
ENTRYPOINT ["/root/QUIT/build/Source/qi"]
