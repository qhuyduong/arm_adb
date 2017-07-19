lib_LTLIBRARIES = libbase.la libcrypto_utils.la libcutils.la liblog.la

libbase_la_SOURCES = base/file.cpp base/stringprintf.cpp \
		     base/strings.cpp base/logging.cpp \
		     base/parsenetaddress.cpp
libbase_la_CXXFLAGS = -I$(includedir) -I$(top_srcdir)/include \
		      -I$(top_srcdir)/lib/base/include \
		      -std=c++11

libcrypto_utils_la_SOURCES = libcrypto_utils/android_pubkey.c
libcrypto_utils_la_CFLAGS = -I$(includedir) -I$(top_srcdir)/include \
			    -I$(top_srcdir)/lib/libcrypto_utils/include \
			    -std=c99

libcutils_la_SOURCES = libcutils/socket_inaddr_any_server_unix.c \
		       libcutils/socket_local_client_unix.c \
		       libcutils/socket_local_server_unix.c \
		       libcutils/socket_network_client_unix.c \
		       libcutils/load_file.c libcutils/threads.c \
		       libcutils/sockets.cpp
libcutils_la_CFLAGS = -I$(includedir) -I$(top_srcdir)/include -std=c99 \
		      -D_POSIX_C_SOURCE=200112L
libcutils_la_CXXFLAGS = -I$(includedir) -I$(top_srcdir)/include -std=c++11

liblog_la_SOURCES = liblog/logd_write.c liblog/log_event_write.c \
		    liblog/fake_log_device.c
liblog_la_CFLAGS = -I$(includedir) -I$(top_srcdir)/include \
		   -I$(top_srcdir)/lib/base/include -std=c99 \
		   -DLIBLOG_LOG_TAG=1005 -DFAKE_LOG_DEVICE=1 \
		   -D_POSIX_C_SOURCE=199309L
