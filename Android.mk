LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE        := libusbip
LOCAL_MODULE_TAGS   := optional
LOCAL_SRC_FILES     := libsrc/names.c \
					libsrc/sysfs_utils.c \
					libsrc/usbip_common.c \
					libsrc/usbip_device_driver.c \
					libsrc/usbip_host_common.c \
					libsrc/usbip_host_driver.c \
					libsrc/vhci_driver.c
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libsrc external/libudev/include

include $(BUILD_STATIC_LIBRARY)




include $(CLEAR_VARS)

LOCAL_MODULE        := usbip
LOCAL_MODULE_TAGS   := optional
LOCAL_SRC_FILES     := src/usbip_attach.c \
					src/usbip_bind.c \
					src/usbip.c \
					src/usbip_detach.c \
					src/usbip_list.c \
					src/usbip_network.c \
					src/usbip_port.c \
					src/usbip_unbind.c \
					src/utils.c

LOCAL_CFLAGS += -DPACKAGE_STRING=\"usbip-utils\ 2.0\" -DUSBIP_VERSION=0x00000111
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libsrc
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_WHOLE_STATIC_LIBRARIES += libudev libusbip
include $(BUILD_EXECUTABLE)
