FROM ubuntu:16.04

RUN apt-get update  && \
    apt-get -y install autoconf automake build-essential gcc cmake \
    figlet \
    frei0r-plugins-dev \
    libfribidi-dev \
    libmp3lame-dev \
    libopencore-amrnb-dev \
    libopencore-amrwb-dev \
    libopenjpeg-dev \
    libopus-dev \
    libsoxr-dev \
    libspeex-dev \
    libtheora-dev \
    libvorbis-dev \
    libvo-amrwbenc-dev \
    libwebp-dev \
    libx264-dev \
    libxvidcore-dev \
    libssl-dev \
    openssl \
    texinfo \
    yasm


