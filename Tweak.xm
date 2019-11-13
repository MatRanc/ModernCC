//Imports
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.matdev.moderncc.plist"
#import "Tweak.h"

//Set keys for the prefrence bundle
inline float GetPrefFloat(NSString *key) {
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] floatValue];
}

//Values
//float customRadius = GetPrefFloat(@"largeCCModuleRadius");
float customRadius = 5;
float customCCUIRoundButton = customRadius;
//19 is defualtt


//Hooks the smaller modules inside the main modules (wifi, airplane mode, bluetooth, etc.)
%hook CCUIRoundButton
-(void)_setCornerRadius:(double)arg1 {
    arg1 = customCCUIRoundButton;
    %orig;
}
%end

//iOS 13 hooks all small-er modules like on 12.
%hook CCUIContentModuleContentContainerView
-(void)setCompactContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}

-(void)setExpandedContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;

}
%end

//Hooks the brightness slider (possibly other general ones?) -ios13 only
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


/*

//doesnt work for radii - tested on 13
%hook CCUIButtonModuleView
-(void)_setContinuousCornerRadius:(CGFloat)value {
    value = customRadius;
    %orig;
}
%end

//Hooks the main (most) set of cc modules (all stock ones, not added through settings)
%hook CCUIContentModuleContentContainerView
-(void)_setContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}
%end

//Hooks the smaller modules inside the main modules (wifi, airplane mode, bluetooth, etc.)
%hook CCUIRoundButton
-(void)_setCornerRadius:(double)arg1 {
    arg1 = customCCUIRoundButton;
    %orig;
}
%end

//Hooks for volume and birghtness sliders (have different hookings)
%hook CCUIModuleSliderView
-(void)setContinuousSliderCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}
%end

//one of the init, didMoveToSuperview/willMoveToSuperview:, or anything else that is called once.
//https://discordapp.com/channels/349243932447604736/349251798621749261/627364710525960192


//Sets backdrop/white thing to math the rest, but changes radius system wide. Not optimal.
/*
%hook _MTBackdropView

-(void)_setContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}

%end


//START - old code - testing iskindofclass scenarios
//%orig([self.window isKindOfClass:%c(SBControlCenterWindow)] ? customRadius : arg1);
//exceptions
//SBCoverSheetWindow
//SBHomeScreenWindow


/*
-(void) _setContinuousCornerRadius:(double)arg1 {
    if ([self.window isKindOfClass:%c(SBControlCenterWindow)])
        arg1 = customRadius;
    %orig;
} 
*/
//END