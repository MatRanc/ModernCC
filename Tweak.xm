//TODO - FIX 13 VOLUME HUD, WHITE BACKGROUND BUG
// (both bugs probably related due to mtmaterialview)

//Imports
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.matdev.moderncc.plist"
#import "Tweak.h"

//Set keys for the prefrence bundle
inline float GetPrefFloat(NSString *key) {
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] floatValue];
}

//Values
//float customRadius = GetPrefFloat(@"largeCCModuleRadius");
// ^for using values from settings
float customRadius = 5;
float customCCUIRoundButton = customRadius;
//19 is defualt


//Hooks the smaller modules inside the main modules (wifi, airplane mode, bluetooth, etc.) -13,12,11
%hook CCUIRoundButton
-(void)_setCornerRadius:(double)arg1 {
    arg1 = customCCUIRoundButton;
    %orig;
}
%end

//Hooks all modules
%hook CCUIContentModuleContentContainerView
-(void)_setContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}
%end

//Fix to the untweaked background on modules, needs a class though
%hook MTMaterialView
-(void)_setContinuousCornerRadius:(double)arg1 { 
    if ([self isKindOfClass:%c(CCUIToggleViewController)]) 
    //Below needs a rework...
    [UIViewController setContinuousSliderCornerRadius:continuousCornerRadius];
    _setContinuousSliderCornerRadius = customRadius;
    }
%end

// remember heirarchies
// layer.cornerRadius = 
// "Essentially set the cornerRadius property of the layer"
//Possible contenders: CCUIContentModuleContainerView, CCUIToggleViewController, CCUIContentModuleContainerViewController

//Hooks the brightness slider -ios13 only
%hook CCUIContinuousSliderView
-(void)setContinuousSliderCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}
%end

//Hooks the volume slider -ios13 only
%hook MediaControlsVolumeSliderView
-(void)setContinuousSliderCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}
%end

//Hooks the media control 'square' -ios 13+12
%hook MediaControlsMaterialView
-(void)_setContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}
%end





/* OLD HOOKS

//Hooks the main (most) set of cc modules (ONLY MAIN NOT ONES ADDED IN SETTINGS) -ios12+11 only
%hook CCUIContentModuleContentContainerView
-(void)_setContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}
%end

//Hooks for volume and birghtness sliders (have different hookings) -ios 11+12
%hook CCUIModuleSliderView
-(void)setContinuousSliderCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}
%end

//Sets backdrop/white thing to math the rest, but changes radius system wide. Not optimal. -ios12+11 only 
%hook _MTBackdropView
-(void)_setContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}
%end

*/