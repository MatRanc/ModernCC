
@interface MTMaterialView : UIView {

	UIView* _reducedTransparencyBackdropReplacementView;
	UIView* _baseOverlayView;
	UIView* _primaryOverlayView;
	UIView* _secondaryOverlayView;
	BOOL _cornerRadiusIsContinuous;
	BOOL _isConfiguredAsOverlay;
	BOOL _highlighted;
	BOOL _shouldCrossfadeIfNecessary;
	BOOL _forceCrossfadeIfNecessary;
	BOOL _useBuiltInAlphaTransformerAndBackdropScaleAdjustment;
	NSString* _groupName;
	/*^block*/id _backdropScaleAdjustment;

}

@property (readonly) Class superclass; 
-(double)cornerRadius;
-(double)_continuousCornerRadius;
-(void)_setCornerRadius:(double)arg1 ;
-(void)_setContinuousCornerRadius:(double)arg1 ;
@end



@interface CCUIRoundButton : UIControl {

	BOOL _useAlternateBackground;
	UIImage* _glyphImage;
	NSString* _glyphState;
	UIColor* _highlightColor;
	UIView* _normalStateBackgroundView;
	UIView* _selectedStateBackgroundView;
	UIView* _alternateSelectedStateBackgroundView;
	UIImageView* _glyphImageView;
	UIImageView* _selectedGlyphView;

}

@property (readonly) Class superclass; 
-(void)_setCornerRadius:(double)arg1 ;
-(double)_cornerRadius;
 
@end