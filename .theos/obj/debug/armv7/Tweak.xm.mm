#line 1 "Tweak.xm"



































CGFloat customRadius = 6.5;
CGFloat customCCUIRoundButton = customRadius;


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

@class CCUIRoundButton; @class MTMaterialView; 
static void (*_logos_orig$_ungrouped$MTMaterialView$_setContinuousCornerRadius$)(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$MTMaterialView$_setContinuousCornerRadius$(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL, double); static double (*_logos_orig$_ungrouped$MTMaterialView$_continuousCornerRadius)(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL); static double _logos_method$_ungrouped$MTMaterialView$_continuousCornerRadius(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$CCUIRoundButton$_setCornerRadius$)(_LOGOS_SELF_TYPE_NORMAL CCUIRoundButton* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$_ungrouped$CCUIRoundButton$_setCornerRadius$(_LOGOS_SELF_TYPE_NORMAL CCUIRoundButton* _LOGOS_SELF_CONST, SEL, double); 

#line 39 "Tweak.xm"


static void _logos_method$_ungrouped$MTMaterialView$_setContinuousCornerRadius$(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
	arg1 = customRadius;
	_logos_orig$_ungrouped$MTMaterialView$_setContinuousCornerRadius$(self, _cmd, arg1);
	} 

static double _logos_method$_ungrouped$MTMaterialView$_continuousCornerRadius(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return customRadius;
	_logos_orig$_ungrouped$MTMaterialView$_continuousCornerRadius(self, _cmd);
	} 
	






static void _logos_method$_ungrouped$CCUIRoundButton$_setCornerRadius$(_LOGOS_SELF_TYPE_NORMAL CCUIRoundButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
	arg1 = customCCUIRoundButton;
	_logos_orig$_ungrouped$CCUIRoundButton$_setCornerRadius$(self, _cmd, arg1);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$MTMaterialView = objc_getClass("MTMaterialView"); MSHookMessageEx(_logos_class$_ungrouped$MTMaterialView, @selector(_setContinuousCornerRadius:), (IMP)&_logos_method$_ungrouped$MTMaterialView$_setContinuousCornerRadius$, (IMP*)&_logos_orig$_ungrouped$MTMaterialView$_setContinuousCornerRadius$);MSHookMessageEx(_logos_class$_ungrouped$MTMaterialView, @selector(_continuousCornerRadius), (IMP)&_logos_method$_ungrouped$MTMaterialView$_continuousCornerRadius, (IMP*)&_logos_orig$_ungrouped$MTMaterialView$_continuousCornerRadius);Class _logos_class$_ungrouped$CCUIRoundButton = objc_getClass("CCUIRoundButton"); MSHookMessageEx(_logos_class$_ungrouped$CCUIRoundButton, @selector(_setCornerRadius:), (IMP)&_logos_method$_ungrouped$CCUIRoundButton$_setCornerRadius$, (IMP*)&_logos_orig$_ungrouped$CCUIRoundButton$_setCornerRadius$);} }
#line 63 "Tweak.xm"
