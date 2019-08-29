include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = mccprefs

mccprefs_FILES = FSDRootListController.m
mccprefs_INSTALL_PATH = /Library/PreferenceBundles
mccprefs_FRAMEWORKS = UIKit
mccprefs_PRIVATE_FRAMEWORKS = Preferences
mccprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/mccprefs.plist$(ECHO_END)
