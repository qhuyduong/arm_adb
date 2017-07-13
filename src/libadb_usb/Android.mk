# Copyright 2005 The Android Open Source Project
#
# Android.mk for adb
#

LOCAL_PATH:= $(call my-dir)

# adb host tool
# =========================================================
include $(CLEAR_VARS)

LOCAL_MODULE := libadb_usb
LOCAL_CFLAGS := \
	$(LIBADB_CFLAGS) \
	-DADB_HOST=0 
LOCAL_SRC_FILES := := \
  usb_linux_client.c 
# Even though we're building a static library (and thus there's no link step for
# this to take effect), this adds the includes to our path.

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libadb_usb
LOCAL_CFLAGS := \
	$(LIBADB_CFLAGS) \
	-DADB_HOST=0 
LOCAL_SRC_FILES := := \
  usb_linux_client.c 
# Even though we're building a static library (and thus there's no link step for
# this to take effect), this adds the includes to our path.

include $(BUILD_HOST_STATIC_LIBRARY)
