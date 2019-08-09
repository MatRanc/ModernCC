#define PLIST_PATH @"/var/mobile/Library/Preferences/com.matdev.moderncc.plist"

//set keys for the prefrence bundle
inline float GetPrefFloat(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] floatValue];
}


//values
float customRadius = GetPrefFloat(@"largeCCModuleRadius");
float customCCUIRoundButton = customRadius;


%hook MTMaterialView

-(void) _setContinuousCornerRadius:(double)arg1 {
	arg1 = customRadius;

	if(customRadius <= 0){
		customRadius = 0;
	}

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


https://pastebin.com/eb4tJHPk

*/