/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/

#define PLIST_PATH @"/var/mobile/Library/Preferences/Root.plist"

//set keys for the prefrence bundle
inline float GetPrefFloat(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] floatValue];
}


//values
float customRadius = GetPrefFloat(@"customRadius"); //key customRadius
float customCCUIRoundButton = customRadius;

%hook MTMaterialView

-(void) _setContinuousCornerRadius:(double)arg1 {
	arg1 = customRadius;
	%orig;
	} 

-(double) _continuousCornerRadius {

	return customRadius;
	%orig;
	} 
	
%end


//Hooks for the smaller buttons in the CC | ie. airplane mode, wifi, etc.
%hook CCUIRoundButton

-(void)_setCornerRadius:(double)arg1 {
	arg1 = customCCUIRoundButton;
	%orig;
}

%end







/* Notes

This is a good place to learn more about prefrencebundle keys, not really learn but look how they are implemented
(https://github.com/Auxilium-Development/excitant/blob/master/Excitant.xm) Thanks Auxilium bois ;)

*/
