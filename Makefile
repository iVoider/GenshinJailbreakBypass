THEOS_PACKAGE_DIR_NAME = debs
TARGET =: clang::9.0
ARCHS = armv7 armv7s arm64 arm64e
DEBUG = 0
GO_EASY_ON_ME = 0
ADDITIONAL_CFLAGS = -fobjc-arc
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = GenshinJailbreakBypass
GenshinJailbreakBypass_FILES = GenshinJailbreakBypass.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall GenshinImpact; exit 0"