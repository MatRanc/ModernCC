//Imports
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.matdev.moderncc.plist"
#import "Tweak.h"

//Set keys for the prefrence bundle
inline float GetPrefFloat(NSString *key) {
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] floatValue];
}

//Values
float customRadius = GetPrefFloat(@"largeCCModuleRadius");
float customCCUIRoundButton = customRadius;


//Hooks the main set of cc modules

%hook CCUIContentModuleContentContainerView

-(void)_setContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}

%end

//Hooks the smaller circles inside the main modules

%hook CCUIRoundButton

-(void)_setCornerRadius:(double)arg1 {
    arg1 = customCCUIRoundButton;
    %orig;
}

%end

//Hooks the volume and birghtness sliders as they are too special to follow along with the others

%hook CCUIModuleSliderView

-(void)setContinuousSliderCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}

%end

//Hooks the music/media player module as it is also a special cookie

%hook MediaControlsMaterialView

-(void)_setContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}

%end

//----------------------------------------------


%hook MTMaterialView

-(void)setContinuousCornerRadius:(double)arg1 {
	if ([self isKindOfClass:%c(SBControlCenterWindow)])
	arg1 = 12;    
}

%end


/*
-(void) _setContinuousCornerRadius:(double)arg1 {
    if ([self.window isKindOfClass:%c(SBControlCenterWindow)])
        arg1 = customRadius;
    %orig;
} 
*/