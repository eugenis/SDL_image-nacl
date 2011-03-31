#!/bin/bash
set -e -x

ROOT=${NACL_TOOLCHAIN_ROOT:-$HOME/root/nacl-sdk}

export SDL_LIBS="-L$ROOT/nacl64/usr/lib -lSDL -lppapi_cpp -lpthread -lm"
PATH=$ROOT/bin:$PATH CC=nacl64-gcc AR=nacl64-ar RANLIB=nacl64-ranlib PKG_CONFIG_LIBDIR=$ROOT/nacl64/usr/lib/pkgconfig \
  ./configure --host=nacl64 --prefix=$ROOT/nacl64/usr
PATH=$ROOT/bin:$PATH make
PATH=$ROOT/bin:$PATH make install

