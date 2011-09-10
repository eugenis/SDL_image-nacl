#!/bin/bash
set -e -x

ROOT=${NACL_TOOLCHAIN_ROOT:-$HOME/root/nacl-sdk}

export SDL_LIBS="-L$ROOT/x86_64-nacl/usr/lib -lSDL -lppapi_cpp -lpthread -lm"
PATH=$ROOT/bin:$PATH CC=x86_64-nacl-gcc AR=x86_64-nacl-ar RANLIB=x86_64-nacl-ranlib PKG_CONFIG_LIBDIR=$ROOT/x86_64-nacl/usr/lib/pkgconfig \
  ./configure --host=x86_64-nacl --prefix=$ROOT/x86_64-nacl/usr
PATH=$ROOT/bin:$PATH make
PATH=$ROOT/bin:$PATH make install

