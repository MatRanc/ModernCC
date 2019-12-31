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




//------------------------------------------------------------------------------------------------------------------------


//Fix to the untweaked background on modules, needs a class though
%hook MTMaterialView

//Create the instance to be used below
CCUIButtonModuleView *MTMaterialInstance = [[CCUIButtonModuleView alloc]init];

-(void)_setContinuousCornerRadius:(double)arg1 { 
    if ([self isKindOfClass:%c(CCUIToggleViewController)])
    //Override the method 
    [MTMaterialInstance _setContinuousCornerRadius:customRadius];
    }
%end


//Notes

// In flex, select the MTMaterialView of the module, then using the parent class, you can change the radius
// So, I just need to make an instance of the parent class of the MTMaterialView being used to modify it?

//Create the instance first
//[instanceName methodName:Parameter]

// Thats the correct class but you call it on the instance (since its an instance method).
// https://discordapp.com/channels/349243932447604736/349251798621749261/661381997280624649

// [CCUIButtonModuleView setContinuousCornerRadius:customRadius];

// remember heirarchies

//@mat No, forget about layers for a second. 
//Assume you are only given the interface of CustomView and you are allowed to either override its methods or you 
//are allowed to call methods on it. How would you change the continuous corner radius?

//Possible contenders: CCUIContentModuleContainerView, CCUIToggleViewController, CCUIContentModuleContainerViewController

//https://developer.limneos.net/index.php?ios=13.1.3&framework=ControlCenterUIKit.framework&header=CCUIButtonModuleView.h




//------------------------------------------------------------------------------------------------------------------------



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