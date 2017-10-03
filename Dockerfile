FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install autoconf automake build-essential gcc cmake
#RUN apt-get -y install libass-dev libfreetype6-dev libsdl2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo wget zlib1g-dev
RUN apt-get -y install texinfo
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

