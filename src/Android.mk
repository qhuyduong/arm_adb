# Copyright 2005 The Android Open Source Project
#
# Android.mk for adb
#

LOCAL_PATH:= $(call my-dir)

adb_version := N-android

ADB_COMMON_CFLAGS := \
    -Wall -Wextra -Werror \
    -Wno-unused-parameter \
    -Wno-missing-field-initializers \
    -Wvla \
    '-DADB_REVISION="$(adb_version)"' \
    -DADB_HOST_ON_TARGET=1 \
    -fpermissive \
    -std=gnu++1y  \
    -DALLOW_ADBD_ROOT=1 

ADB_COMMON_darwin_CFLAGS := \
    -std=gnu++14 \
    -Wexit-time-destructors \
    
CFLAGS += -DARM=1
CFLAGS += -O2 -fPIC -static -D_GNU_SOURCE
LOCAL_CXX_STL := libc++_static
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_C_INCLUDES) 

CFLAGS += \
	-DHAVE_SYS_UIO_H \
	-DHAVE_PTHREADS \
	-DHAVE_SCHED_H \
	-DHAVE_SYS_UIO_H \
	-DHAVE_IOCTL \
	-DHAVE_TM_GMTOFF \
	-DANDROID_SMP=1  \
	-DHAVE_ENDIAN_H \
	-DHAVE_POSIX_FILEMAP \
	-DHAVE_OFF64_T \
	-Wno-format-y2k \
	-DHAVE_ENDIAN_H \
	-DHAVE_SCHED_H \
 	-DHAVE_LITTLE_ENDIAN_H \
 	-D__ANDROID__ \
 	-DHAVE_ANDROID_OS \
 	-D_ANDROID_CONFIG_H \
 	-D_BYPASS_DSO_ERROR \

ADB_STATIC_LIBRARIES := \
    libbase \
    libcrypto_static \
    libcrypto_utils_static \
    libcutils \
    libutils \
    libziparchive \
    libc \
    libz \
    libcrypto_utils_static \
    libcrypto_static \
    liblog 

 
common_includes := \
        $(LOCAL_PATH)/include \
        system/core/base/include \
        system/core/libutils \
        system/core/include \
        system/core/liblog \
        system/core/libcutils \
        system/core/libcrypto_utils/include \
        system/core/libcrypto_utils \
        external/boringssl/src/include \
        external/boringssl/src/include/crypto \
        external/libpng \
        external/libcxx/include \
        external/expat \
        external/zlib \
        bionic/libc/include \
        external/openssl/include \
        system/core/libziparchive \
        system/extras/ext4_utils
        
        
# libadb
# =========================================================

# Much of adb is duplicated in bootable/recovery/minadb and fastboot. Changes
# made to adb rarely get ported to the other two, so the trees have diverged a
# bit. We'd like to stop this because it is a maintenance nightmare, but the
# divergence makes this difficult to do all at once. For now, we will start
# small by moving common files into a static library. Hopefully some day we can
# get enough of adb in here that we no longer need minadb. https://b/17626262

LIBADB_SRC_FILES := \
    adb.cpp \
    adb_auth.cpp \
    adb_io.cpp \
    adb_listeners.cpp \
    adb_trace.cpp \
    adb_utils.cpp \
    fdevent.cpp \
    sockets.cpp \
    transport.cpp \
    transport_local.cpp \
    transport_usb.cpp \
    
LIBADB_CFLAGS := \
    $(ADB_COMMON_CFLAGS) \
    -fvisibility=hidden \
    -Wno-missing-field-initializers \

LIBADB_linux_CFLAGS := \
    $(ADB_COMMON_linux_CFLAGS) \

LIBADB_linux_SRC_FILES := \
    get_my_path_linux.cpp \
    sysdeps_unix.cpp \
    usb_linux.cpp \

# Even though we're building a static library (and thus there's no link step for
# this to take effect), this adds the includes to our path.

LOCAL_PATH:= $(call my-dir)


include $(CLEAR_VARS)

LOCAL_MODULE := libadb
LOCAL_MULTILIB := both
LOCAL_MODULE_STEM_32 := $(LOCAL_MODULE)
LOCAL_MODULE_STEM_64 := $(LOCAL_MODULE)64
LOCAL_CLANG := false
LOCAL_CFLAGS := $(LIBADB_CFLAGS) -DADB_HOST=1
LOCAL_CFLAGS_linux := $(LIBADB_linux_CFLAGS)
LOCAL_SRC_FILES := \
    $(LIBADB_SRC_FILES) \
    adb_auth_host.cpp 
    
LOCAL_C_INCLUDS := $(common_includes)
# Even though we're building a static library (and thus there's no link step for
# this to take effect), this adds the includes to our path.
LOCAL_STATIC_LIBRARIES := libcrypto_utils_static libcrypto_static libbase 
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_CLANG := false

adb_srcs := \
    adb.cpp \
    adb_auth.cpp \
    adb_io.cpp \
    adb_listeners.cpp \
    adb_trace.cpp \
    adb_utils.cpp \
    fdevent.cpp \
    sockets.cpp \
    get_my_path_linux.cpp \
    transport.cpp \
    transport_local.cpp \
    transport_usb.cpp \
    adb_client.cpp \
    client/main.cpp \
    console.cpp \
    commandline.cpp \
    diagnose_usb.cpp \
    file_sync_client.cpp \
    line_printer.cpp \
    services.cpp \
    shell_service_protocol.cpp \
    adb_auth_host.cpp \
    sysdeps_unix.cpp \
    usb_linux.cpp \

LOCAL_CFLAGS += \
    $(ADB_COMMON_CFLAGS) \
	-DADB_HOST=1 \
	-DADB_HOST_ON_TARGET=1 \
	-Wall \
	-Wno-unused-parameter \
	-D_XOPEN_SOURCE \
	-D_GNU_SOURCE

LOCAL_CFLAGS_linux := \
    $(ADB_COMMON_linux_CFLAGS) \

LOCAL_MODULE := adb
LOCAL_MULTILIB := both
LOCAL_MODULE_STEM_32 := $(LOCAL_MODULE)
LOCAL_MODULE_STEM_64 := $(LOCAL_MODULE)64
LOCAL_SRC_FILES := $(adb_srcs)
LOCAL_STATIC_LIBRARIES := $(ADB_STATIC_LIBRARIES) 
LOCAL_WHOLE_STATIC_LIBRARIES := libbase
LOCAL_CXX_STL := libc++_static
LOCAL_C_INCLUDS:= $(common_includes)
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE_CLASS := UTILITY_EXECUTABLES    
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT_SBIN)
LOCAL_UNSTRIPPED_PATH := $(TARGET_ROOT_OUT_SBIN_UNSTRIPPED)
LOCAL_MODULE_TAGS := optional debug eng
LOCAL_LDLIBS := -lc -lgcc -ldl -lz 
LOCAL_LDFLAGS += -static 
include $(BUILD_EXECUTABLE)

# adbd device daemon
# =========================================================

include $(CLEAR_VARS)

LOCAL_CLANG := true

adbd_srcs := \
    daemon/main.cpp \
    services.cpp \
    file_sync_service.cpp \
    framebuffer_service.cpp \
    remount_service.cpp \
    set_verity_enable_state_service.cpp \
    shell_service.cpp \
    shell_service_protocol.cpp \

LOCAL_CFLAGS := \
    $(ADB_COMMON_CFLAGS) \
    $(ADB_COMMON_linux_CFLAGS) \
    -DADB_HOST=0 \
    -D_GNU_SOURCE \
    -Wno-deprecated-declarations \

ADBD_CFLAGS += \
	-DALLOW_ADBD_NO_AUTH=1 \
	-DALLOW_ADBD_DISABLE_VERITY=1 \
	-DALLOW_ADBD_ROOT=1
	
LOCAL_MODULE := adbd
LOCAL_MULTILIB := both
LOCAL_MODULE_STEM_32 := $(LOCAL_MODULE)
LOCAL_MODULE_STEM_64 := $(LOCAL_MODULE)64
ADBD_STATIC_LIBRARIES := \
	$(ADB_STATIC_LIBRARIES) \
	libfs_mgr \
	libfec \
	libfec_rs \
	libselinux \
	libmincrypt \
	libext4_utils_static \
	libsquashfs_utils \
	libcutils \
	libminijail
	
LOCAL_SRC_FILES := $(adbd_srcs)
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT_SBIN)
LOCAL_UNSTRIPPED_PATH := $(TARGET_ROOT_OUT_SBIN_UNSTRIPPED)
LOCAL_C_INCLUDS:= $(common_includes)
LOCAL_STATIC_LIBRARIES := $(ADBD_STATIC_LIBRARIES)
include $(BUILD_EXECUTABLE)

