bin_PROGRAMS = adb
adb_SOURCES = adb.c adb_client.c adb_auth_host.c commandline.c console.c \
	      fdevent.c file_sync_client.c get_my_path_linux.c services.c \
	      sockets.c transport.c transport_local.c transport_usb.c \
	      usb_linux.c usb_vendors.c
adb_CFLAGS = -I$(includedir) -I$(top_srcdir)/include -lcrypto -lpthread -lrt \
	     -DADB_HOST=1 -DHAVE_FORKEXEC=1 -DHAVE_SYMLINKS -DHAVE_TERMIO_H \
	     -DHAVE_SYS_SOCKET_H -DHAVE_OFF64_T -D_GNU_SOURCE -D_XOPEN_SOURCE
adb_LDADD = $(top_srcdir)/lib/libcutils.la
adb_LDFLAGS = -static -L$(libdir)
