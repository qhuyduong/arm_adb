# arm_adb
Android's adb ported to ARM with automake source structures

## Prerequisites
```bash
$ sudo apt-get install libtool automake
```
NOTE: Please make sure you are using navite/cross gcc >= 4.9

## How to build and run
### Native compiling
#### Native-compile openssl
```bash
$ git clone https://github.com/hduong85/openssl-1.0.2l.git
$ cd openssl-1.0.2l/
$ ./Configure --prefix=/tmp/openssl os/compiler:gcc
$ make && make install
$ cd -
```

#### Native-compile arm_adb
```bash
$ git clone https://github.com/hduong85/arm_adb
$ cd arm_adb
$ ./configure --includedir=/tmp/openssl/include --libdir=/tmp/openssl/lib
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
Run below command before configure
```bash
$ autoreconf -i --force
```
