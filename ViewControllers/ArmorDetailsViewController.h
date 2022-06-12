//
//  ArmorDetailsViewController.h
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "INSTBaseClass.h"
#import "ItemCellTableView.h"
 

@interface ArmorDetailsViewController : UIViewController<UITabBarDelegate,UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UIButton *btnBarrelPerk1;
@property (strong, nonatomic) IBOutlet UIButton *btnBarrelPerk2;

@property (strong, nonatomic) IBOutlet UIButton *btnMagazine1;
@property (strong, nonatomic) IBOutlet UIButton *btnMagazine2;

@property (strong, nonatomic) IBOutlet UIButton *btnPerkTrait1;
@property (strong, nonatomic) IBOutlet UIButton *btnPerkTrait2;
@property (strong, nonatomic) IBOutlet UIButton *btnPerkTrait3;
@property (strong, nonatomic) IBOutlet UIButton *btnPerkTrait4;
@property (strong, nonatomic) IBOutlet UIButton *btnKillTracker1;
@property (strong, nonatomic) IBOutlet UIButton *btnKillTracker2;


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *progressIndicator;

@property (strong, nonatomic) IBOutlet UIImageView *imgPlayerLogo;

@property (strong, nonatomic) IBOutlet UIButton *btnAction;

@property (strong, nonatomic) IBOutlet UIButton *btnClose;

@property (strong, nonatomic) IBOutlet UIImageView *imgArmorIcon;

@property (strong, nonatomic) IBOutlet UIImageView *imgArmorScreenshot;

@property (strong, nonatomic) IBOutlet UILabel *lblPower;
@property (strong, nonatomic) IBOutlet UILabel *lblFlavoredText;

@property (strong, nonatomic) IBOutlet UIImageView *imgArmorQuality;

@property (strong, nonatomic) IBOutlet UIImageView *imgArmorBurn;
@property (strong, nonatomic) IBOutlet UILabel *lblArmorName;
@property (strong, nonatomic) IBOutlet UILabel *lblArmorType;

@property (nonatomic,strong) NSTimer   *timer;
@property (nonatomic,strong) NSRunLoop *loop;
@property (nonatomic,strong) NSMutableDictionary *destChars;
@property (nonatomic,strong) NSMutableDictionary  *destVaultItems;
@property (nonatomic,strong) NSMutableDictionary  *destEquippedItems;
@property (nonatomic,strong) UIImageView  *selectedCharEmblem;
@property (nonatomic,strong) NSArray   *destVaultItemsBuckets;
@property (nonatomic,strong) NSArray   *destEquippedItemsBuckets;
@property (nonatomic,strong) NSString  *selectedChar;
@property (nonatomic,strong) NSString  *selectedMembership;
@property (nonatomic,strong) UIViewController *parentVC;
@property (nonatomic) BOOL isVaultItems;
@property (strong, nonatomic) IBOutlet UILabel *lblEnemiesDefeatedLabel;
@property (strong, nonatomic) IBOutlet UILabel *lblEnemiesDefeatedValue;
@property (strong, nonatomic) IBOutlet UIImageView *imgArmorType;

@property (strong, nonatomic) IBOutlet UILabel *lblItemDescription;

@property (strong, nonatomic) IBOutlet UILabel *lblImpactLable;

@property (strong, nonatomic) IBOutlet UILabel *lblImpactValue;
@property (strong, nonatomic) IBOutlet UILabel *lblRangeLabel;

@property (strong, nonatomic) IBOutlet UILabel *lblRangeValue;

@property (strong, nonatomic) IBOutlet UILabel *lblStabilityLabel;

@property (strong, nonatomic) IBOutlet UILabel *lblStabilityValue;

@property (strong, nonatomic) IBOutlet UILabel *lblHandlingLabel;

@property (strong, nonatomic) IBOutlet UILabel *lblHandlingValue;


@property (strong, nonatomic) IBOutlet UILabel *lblReloadSpeedLabel;

@property (strong, nonatomic) IBOutlet UILabel *lblReloadValue;

@property (strong, nonatomic) IBOutlet UILabel *lblAimAssistLabel;

@property (strong, nonatomic) IBOutlet UILabel *lblAimAssistValue;
@property (strong, nonatomic) IBOutlet UILabel *lblArmorDamageType;


@property (strong, nonatomic) IBOutlet UILabel *lblRecoilLabel;

@property (strong, nonatomic) IBOutlet UILabel *lblRecoilValue;

@property (strong, nonatomic) IBOutlet UILabel *lblRoundsLabel;

@property (strong, nonatomic) IBOutlet UILabel *lblRoundsValue;

@property (strong, nonatomic) IBOutlet UILabel *lblMagazineLabel;

@property (strong, nonatomic) IBOutlet UILabel *lblMagazineValue;

@property (strong, nonatomic) IBOutlet UIProgressView *pBarImpact;

@property (strong, nonatomic) IBOutlet UIProgressView *pBarStability;
@property (strong, nonatomic) IBOutlet UIProgressView *pBarHandling;
@property (strong, nonatomic) IBOutlet UIProgressView *pBarReload;
@property (strong, nonatomic) IBOutlet UIProgressView *pBarAimAssist;

@property (strong, nonatomic) IBOutlet UILabel *lblTrait1Desc;
@property (strong, nonatomic) IBOutlet UILabel *lblTrait2Desc;
@property (strong, nonatomic) IBOutlet UILabel *lblTrait3Desc;
@property (strong, nonatomic) IBOutlet UILabel *lblTrait4Desc;
@property (strong, nonatomic) IBOutlet UILabel *lblTrait5Desc;
@property (strong, nonatomic) IBOutlet UILabel *lblTrait6Desc;
@property (strong, nonatomic) IBOutlet UILabel *lblTrait7Desc;
@property (strong, nonatomic) IBOutlet UILabel *lblTrait8Desc;
@property (strong, nonatomic) IBOutlet UILabel *lblTrait9Desc;
@property (strong, nonatomic) IBOutlet UIImageView *imgSeason;
@property (strong, nonatomic) IBOutlet UIImageView *imgArmorAmmoType;

@property (strong, nonatomic) IBOutlet UIImageView *imgLock;
@property (strong, nonatomic) IBOutlet UIProgressView *pBarRange;
-(void) startTimer;
-(void) endTimer;
-(void) loadItems;
-(void) loadLostItems;
-(void) loadVaultItems;
-(void) refreshItems:(NSString *) itemHash;
-(void) loadInventories;
-(void) closeAction;

-(void) loadArmorDetail:(INSTBaseClass *) armorData withArmorCell:(ItemCellTableView*) anyCell charactersData:(NSDictionary *) characters;

- (IBAction)weaponAction:(UIButton *)sender;

- (IBAction)perkLookupAction:(UIButton *)sender;


@end

 
