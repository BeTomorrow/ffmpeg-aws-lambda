FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install autoconf automake build-essential gcc cmake
RUN apt-get -y install figlet \
    frei0r-plugins-dev \
    libfribidi-dev \
    libmp3lame-dev \
    libopencore-amrnb-dev \
    libopencore-amrwb-dev \
    libopenjpeg-dev \
    libopus-dev \
    libsoxr-dev \
    libspeex-dev \
    libvo-amrwbenc-dev \
    libwebp-dev \
    libx264-dev \
    libxvidcore-dev \
    libopenjpeg-dev \
    libssl-dev \
    openssl \
    yasm

RUN apt-get -y install \
    texinfo \
    pkgconf \
    libavformat-dev \
    libtheora-dev \
    libvorbis-dev

WORKDIR /data

ENTRYPOINT [ "/data/build-ffmpeg.sh" ]
