# arm_adb
Android's adb ported to ARM with automake source structures

## Prerequisites
```bash
$ sudo apt-get install libtool automake
```

## How to build and run
```bash
$ git clone https://github.com/hduong85/arm_adb
$ cd arm_adb
$ ./configure
$ make
$ ./src/arm_adb
```
## Troubleshooting

### 1. WARNING: 'aclocal-1.xx' is missing on your system
Run below command below configure
```bash
$ autoreconf -i --force
```
