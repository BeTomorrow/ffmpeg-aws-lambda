#!/bin/bash

set -ev
ROOT=`pwd`

# libx265
cd "$ROOT/x265/build/linux"
PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=off ../../source
make
make install

# libvpx
cd "$ROOT/libvpx"
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests
PATH="$HOME/bin:$PATH" make
make install
make clean

args=(
    --disable-shared
    --enable-static
    --disable-debug
    --disable-runtime-cpudetect
    --disable-ffplay
    --disable-ffserver
    --disable-doc
    --disable-network
    --disable-devices

    # Protocols
    --disable-protocols
    --enable-protocol=file
    --enable-protocol=pipe
    --enable-protocol=tee
    --enable-protocol=http

    # Libraries
    --enable-libmp3lame
    --enable-libvpx
    --enable-libwebp
    --enable-libopus
    --enable-fontconfig
    --enable-gray
    --enable-libfreetype
    --enable-libmp3lame
    --enable-libopenjpeg
    --enable-libspeex
    --enable-libtheora
    --enable-libvorbis
    #--enable-libsoxr
    #--enable-libfribidi

    # GPL
    --enable-gpl
    --enable-frei0r
    --enable-libx264
    --enable-libx265
    --enable-libxvid

    # GPLv3
    --enable-version3
    --enable-libopencore-amrnb
    --enable-libopencore-amrwb
    --enable-libvo-amrwbenc

    # Activate OpenSSL for https
    --enable-openssl
    --enable-nonfree # required to enable openssl
)

cd "$ROOT/ffmpeg"
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
    --prefix="$HOME/ffmpeg_build" \
    --pkg-config-flags="--static" \
    --extra-cflags="-I$HOME/ffmpeg_build/include -static" \
    --extra-ldflags="-L$HOME/ffmpeg_build/lib -static" \
    --bindir="$HOME/bin" \
    --cc="gcc -m64" \
    --cpu="sandybridge" \
    --arch="x84_64" \
    ${args[@]}
PATH="$HOME/bin:$PATH" make
make install
make distclean
hash -r

tar -czvf "./ffmpeg-build-lambda.tar.gz" -C $HOME/bin/ .