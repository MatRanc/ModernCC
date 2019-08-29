export ARCHS = arm64 armv7 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ModernCC

ModernCC_FILES = Tweak.xm
ModernCC_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

SUBPROJECTS += mccprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
