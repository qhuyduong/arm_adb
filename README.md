# arm_adb
Android's adb ported to ARM with automake source structures

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=Q8BH5C48PA9SC)

## Prerequisites
NOTE: Please make sure you are using navite/cross gcc >= 4.9
```bash
$ sudo apt-get install libtool automake
```
For cross-compiling:
### ARM
```bash
$ sudo apt-get install linux-libc-dev-armhf-cross libc6-armhf-cross libc6-dev-armhf-cross
```
### AARCH64
```bash
$ sudo apt-get install linux-libc-dev-arm64-cross libc6-arm64-cross libc6-dev-arm64-cross
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
Run below command before configure
```bash
$ autoreconf -i --force
```

## Donation
If this project helps you reduce time to develop, you can give me a cup of coffee :)

[![Paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=Q8BH5C48PA9SC)
