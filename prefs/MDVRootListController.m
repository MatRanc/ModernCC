#include "MDVRootListController.h"

@implementation MDVRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
											//Use your actual package pref plist and not root.plist
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end