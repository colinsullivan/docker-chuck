FROM debian:jessie

ENV CHUCK_VERSION chuck-1.4.0.1

RUN apt-get update && apt-get install -y \
      build-essential \
      bison \
      flex \
      gcc-4.9 \
      libasound2-dev \
      librtmidi-dev \
      libpulse-dev \
      libsndfile1-dev \
      pulseaudio \
      pulseaudio-utils \
      wget

RUN mkdir /src/ && \
      cd /src/ && \
      wget https://chuck.cs.princeton.edu/release/files/$CHUCK_VERSION.tgz && \
      tar zxf $CHUCK_VERSION.tgz

WORKDIR /src/$CHUCK_VERSION/src/

ENV CFLAGS -std=gnu++0x

RUN make linux-pulse && make install
