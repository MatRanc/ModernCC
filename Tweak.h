@interface MTMaterialView : UIView
@end 

@interface CCUIButtonModuleView : UIControl
@end

@interface CCUIModuleCollectionViewController : UIViewController
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