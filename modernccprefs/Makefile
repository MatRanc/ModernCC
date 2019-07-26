include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ModernCCprefs

ModernCCprefs_FILES = MATRootListController.m
ModernCCprefs_INSTALL_PATH = /Library/PreferenceBundles
ModernCCprefs_FRAMEWORKS = UIKit
ModernCCprefs_PRIVATE_FRAMEWORKS = Preferences
ModernCCprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ModernCCprefs.plist$(ECHO_END)
