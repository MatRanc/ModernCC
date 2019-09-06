@interface MTMaterialView : UIView
@end 

@interface CCUIButtonModuleView : UIControl
@end


@interface CCUIContentModuleContentContainerView : UIView {

	BOOL _expanded;
	BOOL _moduleProvidesOwnPlatter;
	BOOL _clipsContentInCompactMode;
	MTMaterialView* _moduleMaterialView;
	NSString* _materialViewGroupName;

}

@property (assign,nonatomic) BOOL moduleProvidesOwnPlatter;                      //@synthesize moduleProvidesOwnPlatter=_moduleProvidesOwnPlatter - In the implementation block
@property (nonatomic,readonly) MTMaterialView * moduleMaterialView;              //@synthesize moduleMaterialView=_moduleMaterialView - In the implementation block
@property (nonatomic,copy) NSString * materialViewGroupName;                     //@synthesize materialViewGroupName=_materialViewGroupName - In the implementation block
@property (assign,nonatomic) BOOL clipsContentInCompactMode;                     //@synthesize clipsContentInCompactMode=_clipsContentInCompactMode - In the implementation block
-(void)_transitionToExpandedMode:(BOOL)arg1 force:(BOOL)arg2 ;
-(void)_configureModuleMaterialViewIfNecessary;
-(BOOL)_isContentClippingRequiredForSubview:(id)arg1 ;
-(void)transitionToExpandedMode:(BOOL)arg1 ;
-(void)setModuleProvidesOwnPlatter:(BOOL)arg1 ;
-(MTMaterialView *)moduleMaterialView;
-(void)setMaterialViewGroupName:(NSString *)arg1 ;
-(BOOL)moduleProvidesOwnPlatter;
-(NSString *)materialViewGroupName;
-(BOOL)clipsContentInCompactMode;
-(void)setClipsContentInCompactMode:(BOOL)arg1 ;
-(id)init;
-(id)initWithFrame:(CGRect)arg1 ;
-(void)addSubview:(id)arg1 ;
-(void)layoutSubviews;
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