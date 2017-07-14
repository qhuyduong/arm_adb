# arm_adb
Android's adb ported to ARM with automake source structures

## Prerequisites
```bash
$ sudo apt-get install libtool automake
```

## How to build and run
### Native compiling
```bash
$ git clone https://github.com/hduong85/arm_adb
$ cd arm_adb
$ ./configure
$ make
```

### Cross-compiling
#### Cross-compile Openssl
```bash
$ git clone https://github.com/hduong85/openssl-1.0.2l.git
$ cd openssl-1.0.2l/
$ ./Configure --prefix=/tmp/openssl os/compiler:$TOOLCHAIN_PREFIX-gcc
$ make && make install
$ cd -
```

#### Cross-compile arm_adb
```bash
$ git clone https://github.com/hduong85/arm_adb
$ cd arm_adb
$ ./configure --host=$TOOLCHAIN_PREFIX --includedir=/tmp/openssl/include --libdir=/tmp/openssl/lib
$ make
```

## Troubleshooting
### 1. WARNING: 'aclocal-1.xx' is missing on your system
Run below command below configure
```bash
$ autoreconf -i --force
```
