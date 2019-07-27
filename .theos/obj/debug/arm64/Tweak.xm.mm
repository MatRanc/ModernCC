#line 1 "Tweak.xm"



































#import <SpringBoard/SpringBoard-Structs.h>
#import <SpringBoard/SBIgnoredForAutorotationSecureWindow.h>

float customRadius = 3;


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class MTMaterialView; 
static void (*_logos_orig$_ungrouped$MTMaterialView$_setContinuousCornerRadius$)(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$MTMaterialView$_setContinuousCornerRadius$(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL, double); static double (*_logos_orig$_ungrouped$MTMaterialView$_continuousCornerRadius)(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL); static double _logos_method$_ungrouped$MTMaterialView$_continuousCornerRadius(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL); 

#line 41 "Tweak.xm"


static void _logos_method$_ungrouped$MTMaterialView$_setContinuousCornerRadius$(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
	if ([self.window isKindOfClass:[SBControlCenterWindow class]]){
	arg1 = customRadius;
	_logos_orig$_ungrouped$MTMaterialView$_setContinuousCornerRadius$(self, _cmd, arg1);
	} 
}

static double _logos_method$_ungrouped$MTMaterialView$_continuousCornerRadius(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
		if ([self.view isKindOfClass:[SBControlCenterWindow class]]){

	return customRadius;
	_logos_orig$_ungrouped$MTMaterialView$_continuousCornerRadius(self, _cmd);
	} 
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$MTMaterialView = objc_getClass("MTMaterialView"); MSHookMessageEx(_logos_class$_ungrouped$MTMaterialView, @selector(_setContinuousCornerRadius:), (IMP)&_logos_method$_ungrouped$MTMaterialView$_setContinuousCornerRadius$, (IMP*)&_logos_orig$_ungrouped$MTMaterialView$_setContinuousCornerRadius$);MSHookMessageEx(_logos_class$_ungrouped$MTMaterialView, @selector(_continuousCornerRadius), (IMP)&_logos_method$_ungrouped$MTMaterialView$_continuousCornerRadius, (IMP*)&_logos_orig$_ungrouped$MTMaterialView$_continuousCornerRadius);} }
#line 58 "Tweak.xm"
