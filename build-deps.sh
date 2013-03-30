#!/bin/bash

RELEASE=`lsb_release -sr`
INSTALLS="git
pkg-config
make
autoconf 
libtool 
g++ 
tcl 
unzip 
libyajl-dev 
libyajl1 
qt4-qmake
libsqlite3-dev 
curl 
gperf 
bison 
libglib2.0-dev 
libssl-dev 
libxi-dev 
libxrandr-dev 
libxfixes-dev
libxcursor-dev
libfreetype6-dev
libxinerama-dev
libgl1-mesa-dev
libgstreamer0.10-dev
libgstreamer-plugins-base0.10-dev
flex
libicu-dev
libboost-system-dev
libboost-filesystem-dev
libboost-regex-dev
libboost-program-options-dev
liburiparser-dev 
libc-ares-dev
libsigc++-2.0-dev
libglibmm-2.4-dev
libdb4.8-dev
libcurl4-openssl-dev 
xcb
libx11-xcb-dev
libxcb-sync0-dev
libxcb1-dev
libxcb-keysyms1-dev
libxcb-image0-dev
libxcb-render-util0-dev"

if [ "$RELEASE" = "12.04" ]; then
  INSTALLS="$INSTALLS libxcb-icccm4-dev"
else
  INSTALLS="$INSTALLS libxcb-icccm1-dev"
fi

sudo apt-get install $INSTALLS
if [ $? -ne 0 ]; then
  echo "build is not ready"
  exit 1
fi

echo
echo "to build:"
echo " $ ./build-webos-desktop.sh"

RESOLUTION=$(xdpyinfo | sed 's/^ *dimensions: *\([0-9x]*\).*/\1/;t;d')
echo
echo $RESOLUTION
