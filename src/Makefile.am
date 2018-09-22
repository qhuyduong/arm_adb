bin_PROGRAMS = adb
adb_SOURCES = adb.cpp adb_io.cpp adb_listeners.cpp adb_trace.cpp adb_unique_fd.cpp \
							adb_utils.cpp client/bugreport.cpp client/adb_client.cpp client/auth.cpp \
							client/adb_install.cpp client/main.cpp client/usb_dispatch.cpp client/usb_linux.cpp \
	client/commandline.cpp client/usb_libusb.cpp 						client/console.cpp client/fastdeploy.cpp client/fastdeploycallbacks.cpp \
							fdevent.cpp client/file_sync_client.cpp client/line_printer.cpp \
							shell_service_protocol.cpp services.cpp sockets.cpp socket_spec.cpp\
							sysdeps_unix.cpp sysdeps/errno.cpp sysdeps/posix/network.cpp transport.cpp \
	      			transport_local.cpp transport_usb.cpp
adb_CXXFLAGS = -I$(includedir) -I$(top_srcdir)/include \
	       -I$(top_srcdir)/lib/base/include \
				 -I$(top_srcdir)/lib/libbuildversion/include \
				 -I$(top_srcdir)/lib/diagnose_usb/include \
				 -I$(top_srcdir)/lib/libcrypto_utils/include -std=c++14 \
	        -DADB_HOST=1 -DHAVE_FORKEXEC=1 \
	       -DHAVE_SYMLINKS -DHAVE_TERMIO_H -DHAVE_SYS_SOCKET_H \
	       -DHAVE_OFF64_T -D_GNU_SOURCE -D_XOPEN_SOURCE -DHAVE_ANDROID_OS=1 \
	       -D'ADB_VERSION="x.x-x"' -DADB_HOST_ON_TARGET=1 -DALLOW_ADBD_ROOT=1 \
	       -DWORKAROUND_BUG6558362 -DFAKE_LOG_DEVICE=1 \
	       -DDONT_USE_MDNS
adb_LDADD = $(top_srcdir)/lib/libbase.la \
			$(top_srcdir)/lib/libbuildversion.la \
			$(top_srcdir)/lib/libcrypto_utils.la \
	    $(top_srcdir)/lib/libcutils.la \
	    $(top_srcdir)/lib/libdiagnose_usb.la \
	    $(top_srcdir)/lib/liblog.la
adb_LDFLAGS = -static -L$(libdir) -lcrypto -lpthread -lrt -lusb-1.0
