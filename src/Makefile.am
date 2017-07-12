bin_PROGRAMS = arm_adb
arm_adb_SOURCES = adb.c adb_client.c adb_auth_host.c commandline.c console.c \
		  fdevent.c file_sync_client.c get_my_path_linux.c services.c \
		  sockets.c transport.c transport_local.c transport_usb.c \
		  usb_linux.c usb_vendors.c
arm_adb_CFLAGS = -I$(top_srcdir)/include -lcrypto -lpthread -lrt -DADB_HOST=1 \
		 -DHAVE_FORKEXEC=1 -DHAVE_SYMLINKS -DHAVE_TERMIO_H -DHAVE_SYS_SOCKET_H \
		 -DHAVE_OFF64_T -D_GNU_SOURCE -D_XOPEN_SOURCE
arm_adb_LDADD = $(top_srcdir)/lib/libcutils.la
arm_adb_LDFLAGS = -static
