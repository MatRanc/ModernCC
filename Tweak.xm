//Imports
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.matdev.moderncc.plist"
#import "Tweak.h"

//Set keys for the prefrence bundle
inline float GetPrefFloat(NSString *key) {
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] floatValue];
}

//Values
//float customRadius = GetPrefFloat(@"largeCCModuleRadius");
float customRadius = 4;
float customCCUIRoundButton = customRadius;


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

//Hooks the music/media player module as it is also a special cookie
%hook MediaControlsMaterialView
-(void)_setContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}
%end

//Beginning of confusion
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%hook CCUIButtonModuleView
    -(void)didMoveToWindow {
        %orig;
        self.cornerRadius = customRadius;
    }
%end

//one of the init, didMoveToSuperview/willMoveToSuperview:, or anything else that is called once.
//https://discordapp.com/channels/349243932447604736/349251798621749261/627364710525960192




//START-old code that changed mtmaterialview system-wide
//Hooks the background of all the cc modules to fix the white background bug

/*
%hook _MTBackdropView

-(void)_setContinuousCornerRadius:(double)arg1 {
    arg1 = customRadius;
    %orig;
}

%end

%hook CCUIButtonModuleCollectionView

- (void)layoutSubviews {
    self.layer.cornerRadius = customRadius;
}

%end 
//END

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