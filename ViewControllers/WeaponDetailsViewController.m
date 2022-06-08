//
//  WeaponDetailsViewController.m
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "WeaponDetailsViewController.h"
#import "NetworkAPISingleClient+Definition.h"
#import "NetworkAPISingleClient+LinkedProfiles.h"
#import "GuardianViewController.h"
#import "DataModels.h"
#import "Constants.h"
#import "ItemCellTableView.h"
#import "Utilities.h"
#import "INVDDisplayProperties.h"
#import "INSTBaseClass.h"
#import "INVDResponse.h"
#import "INVDInventory.h"
#import "WeaponsTableViewController.h"

@interface WeaponDetailsViewController ()
{
    AppDelegate *appDelegate;
    
    NSMutableDictionary *destItemData,
                        *destVaultData,
                        *instanceData,
                        *destCharData,
                        *bucketsData,
                        *allCharsData;
    
    VAULTItems *vaultItems;
    
    NSMutableArray *itemBuckets;
    
    NSInteger RowHeight,
              HeaderHeight,
              FooterHeight;
    
    NSString *currentClass;
    
    UIImageView *cImage;
    
    BOOL isGeneralItems,
         isLostItems,
         isVaultItems,
         isInventoryItems;
    
    ItemCellTableView *cCell;
    INSTBaseClass *cWeapon;
}
@end



@implementation WeaponDetailsViewController


@synthesize imgWeaponScreenshot   = _imgWeaponScreenshot;
@synthesize imgWeaponIcon = _imgWeaponIcon;
@synthesize lblPower = _lblPower;
@synthesize lblWeaponType = _lblWeaponType;

@synthesize destChars = _destChars;
@synthesize selectedMembership = _selectedMembership;
@synthesize selectedChar = _selectedChar;
@synthesize destVaultItems = _destVaultItems;
@synthesize destVaultItemsBuckets =_destVaultItemsBuckets;
@synthesize selectedCharEmblem = _selectedCharEmblem;
@synthesize btnClose = _btnClose;
@synthesize lblItemDescription = _lblItemDescription;
@synthesize parentVC = _parentVC;
@synthesize isVaultItems = _isVaultItems;


-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
   
    [self endTimer];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    appDelegate = [AppDelegate currentDelegate];
    
    /*[[UILabel appearance] setFont:[UIFont fontWithName:kDefaultFontName size:[UIFont labelFontSize]]];
    
    [[UIButton appearance] setFont:[UIFont fontWithName:kDefaultFontName size:[UIFont buttonFontSize]]];*/
    
    UIBarButtonItem *btnClose =  [[UIBarButtonItem alloc] init];
    
    
    if (btnClose){
        [btnClose setTitle:@"Close"];
        [btnClose setTarget:self];
        [btnClose setAction:@selector(closeAction)];
        
    }

    self.navigationItem.rightBarButtonItem = btnClose;
    
    
    NSDictionary *response = nil,
                 *statData = nil,
                 *perkData = nil;
                
    INVDInventory *invData = nil;
    
    INVDResponse *bClass = nil;
    
    @try {
        
        if (self->cWeapon){
            
 
            response = (NSDictionary*)[self->cWeapon response];
            
            if (response){
                invData =  (INVDInventory*) [response objectForKey:@"instance"];
                
                statData = (NSDictionary*) [response objectForKey:@"stats"];
                
                perkData = (NSDictionary*) [response objectForKey:@"perks"];
                
                
                if (perkData){
                    
                    NSDictionary *perkArray = [perkData objectForKey:@"data"];
                    
                    NSArray *perks =   [perkArray objectForKey:@"perks"];
                    
                    for(int iPdx = 0; iPdx < perks.count ; iPdx++){
                        
                        NSDictionary *perk = [perks objectAtIndex:iPdx];
                        
                        NSLog(@"Perk Details->%@",perk);
                        
                        if (perk){
                            
                            NSString *iconPath = [perk objectForKey:@"iconPath"],
                                     *perkName = [perk objectForKey:@"name"],
                                     *perkDesc = [perk objectForKey:@"description"],
                                     *perkHash = nil;
                            
                            BOOL isActive  = [perk objectForKey:@"isActive"],
                                 isVisible = [perk objectForKey:@"isVisible"];
                            
                            
                            NSNumber *objPHash = [NSNumber numberWithLong:[perk objectForKey:@"perkHash"]];
                            
                            
                            if (objPHash){
                                
                                perkHash = [NSString stringWithFormat:@"%@",[objPHash integerValue]];
                                
                                
                                NSLog(@"WeaponsDetails:perkLookup:for[%@]",perkHash);
                                                       
                                    [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinySandboxPerkDefinition" staticHashId:perkHash completionBlock:^(NSArray *values) {
                                                           
                                        if (values){
                                                               
                                       UIImage *imgPH = [UIImage imageNamed:@"weaponFrame"];
                                                                   
                                        INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                                                           
                                            if (invItem){
                                                
                                                NSDictionary *resp = (NSDictionary*) [ invItem response];
                                                
                                                if (resp){
                                                    
                                                    NSDictionary *dispProp = [resp objectForKey:@"displayProperties"];
                                                    
                                                    if (dispProp){
                                                        
                                                        NSString *dName = [dispProp objectForKey:@"name"],
                                                                 *dDessc =[dispProp objectForKey:@"description"];
                                                        
                                                        if (dName){
                                                           
                                                            switch(iPdx){
                                                            case 0:{
                                                                [self.lblTrait1Desc setText:dName];
                                                                [self.btnBarrelPerk1 setToolTip:dDessc];

                                                                [self.btnBarrelPerk1 setHidden:NO];

                                                                break;
                                                            }
                                                            case 1:{
                                                                [self.lblTrait2Desc setText:dName];
                                                                [self.btnBarrelPerk2 setToolTip:dDessc];
     
                                                                [self.btnBarrelPerk2 setHidden:NO];
                                                                break;
                                                            }
                                                            case 2:{
                                                                [self.lblTrait3Desc setText:dName];
                                                                [self.btnMagazine1 setToolTip:dDessc];
                                                                [self.btnMagazine1 setHidden:NO];
                                                                break;
                                                            }
                                                            case 3:{
                                                                [self.lblTrait4Desc setText:dName];
                                                                [self.btnMagazine2 setToolTip:dDessc];
                                                                [self.btnMagazine2 setHidden:NO];
                                                                break;
                                                            }
                                                            case 4:{
                                                                [self.lblTrait5Desc setText:dName];
                                                                [self.btnPerkTrait1 setToolTip:dDessc];
                                                                [self.btnPerkTrait1 setHidden:NO];
                                                                break;
                                                            }
                                                            case 5:{
                                                                [self.lblTrait6Desc setText:dName];
                                                                [self.btnPerkTrait2 setToolTip:dDessc];
                                                                [self.btnPerkTrait2 setHidden:NO];
                                                                break;
                                                            }
                                                            case 6:{
                                                                [self.lblTrait7Desc setText:dName];
                                                                [self.btnPerkTrait3 setToolTip:dDessc];
                                                                [self.btnPerkTrait3 setHidden:NO];
                                                                break;
                                                            }
                                                            case 7:{
                                                                [self.lblTrait8Desc setText:dName];
                                                                [self.btnPerkTrait4 setToolTip:dDessc];
                                                                [self.btnPerkTrait4 setHidden:NO];
                                                                break;
                                                            }
                                                            case 8:{
                                                                [self.lblTrait9Desc setText:dName];
                                                                [self.btnKillTracker1 setToolTip:dDessc];
                                                                [self.btnKillTracker1 setHidden:NO];
                                                                break;
                                                            }
                                                          }
                                                        }
                                                    }
                                                    
                                                }
                                               // NSLog(@"WeaponsDetails:perkLookup:Received->%@",dName);
                                                
                                            }
                                        }
                                                           
                                    }
                                    andErrorBlock:^(NSError *exception) {
                                    NSLog(@"WeaponsDetails:perkLookup::Exception->%@",exception.description);
                                 }];
                                
                            }
                            
                            
                            if (iconPath.length > 0 ){
                                
                                NSString *baseURL     = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,iconPath];
                                NSURL *perkURL        = [[NSURL alloc] initWithString:baseURL];
                                NSURLRequest *request = [[NSURLRequest alloc] initWithURL:perkURL];
                                
                                UIImage *imgPH = [UIImage imageNamed:@"weaponFrame"];
                                
                                UIImageView *pImg  = [[UIImageView alloc] initWithImage:imgPH];
                                
                                [pImg setImageWithURLRequest:request placeholderImage:imgPH success:^
                                        (NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                    
                                    NSLog(@"Weapon Details:Load Perks Image:Received->%@",baseURL);
                                    
                                    switch(iPdx){
                                        case 0:{
                                            
                                            [self.btnBarrelPerk1 setImage:image
                                                             forState:UIControlStateNormal];
                             
                                            break;
                                        }
                                        case 1:{
                                            [self.btnBarrelPerk2 setImage:image
                                                             forState:UIControlStateNormal];
                                         
                                            break;
                                        }
                                        case 2:{
                                            [self.btnMagazine1 setImage:image
                                                             forState:UIControlStateNormal];
                                          
                                            break;
                                        }
                                        case 3:{
                                            [self.btnMagazine2 setImage:image
                                                             forState:UIControlStateNormal];
                                           
                                            break;
                                        }
                                        case 4:{
                                            [self.btnPerkTrait1 setImage:image
                                                             forState:UIControlStateNormal];
                                            
                                            break;
                                        }
                                        case 5:{
                                            [self.btnPerkTrait2 setImage:image
                                                             forState:UIControlStateNormal];
                                             
                                            break;
                                        }
                                        case 6:{
                                            [self.btnPerkTrait3 setImage:image
                                                             forState:UIControlStateNormal];
                                 
                                            break;
                                        }
                                        case 7:{
                                            [self.btnPerkTrait4 setImage:image
                                                             forState:UIControlStateNormal];
                                          
                                            break;
                                        }
                                        case 8:{
                                            
                                            [self.btnKillTracker1 setImage:image
                                                             forState:UIControlStateNormal];
                                            break;
                                        }
                                    }
                                    
                                                     
                                } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                                     
                                    NSLog(@"Weapon Details:Load Perks Image:Exception->%@",baseURL);
                                }];
                                
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
                if (self->cCell){
                    NSString *baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,self->cCell.lblMisc.text];
                    NSURL *screeShot = [[NSURL alloc] initWithString:baseURL];
                   
                    
                    if (! self.lblWeaponName){
                        self.lblWeaponName = [[UILabel alloc] init];
                    }
                    [self.lblWeaponName setText:self->cCell.lblItemName.text];
                    
                    if (! self.imgWeaponAmmoType){
                        self.imgWeaponAmmoType = [[UIImageView alloc] init];
                    }
                    [self.imgWeaponAmmoType setImage:self->cCell.imgBackground.image];
                    
                    if (! self.imgSeason){
                        self.imgSeason = [[UIImageView alloc] init];
                    }
                    [self.imgSeason setImage:self->cCell.imgCareer.image];
                    
                    if (! self.imgLock){
                        self.imgLock = [[UIImageView alloc] init];
                    }
                    [self.imgLock setImage:self->cCell.btnLockAction.imageView.image];
                    
                    if (! self.imgWeaponQuality){
                        self.imgWeaponQuality = [[UIImageView alloc] init];
                    }
                    
                    NSString *staticHash = [self->cCell.lblHash text];
                    
                    if (staticHash){
                        
                        /*
                         Unknown: 0
                         Currency: 1
                         Basic: 2
                         Common: 3
                         Rare: 4
                         Superior: 5
                         Exotic: 6
                         
                         */
                        
                         
                        bClass =  [appDelegate.destinyInventoryItemDefinitions objectForKey:staticHash];
                      
                        NSNumber *objTier = nil;
                        if (bClass){
                            objTier = [NSNumber numberWithDouble:bClass.inventory.tierType];
                        }
                        
                        [self.imgWeaponIcon.layer setBorderColor:cCell.imgItem.layer.borderColor];
                        [self.imgWeaponIcon.layer setBorderWidth:cCell.imgItem.layer.borderWidth];
                        
                        
                        switch(objTier.integerValue){
                            case 4: //blue
                                
                                break;
                            case 5: //legendary
                                
                                if (! [self->cCell.imgMaster isHidden]){
                                    [self.imgWeaponQuality setImage:[UIImage imageNamed:@"LegendaryMasterFrame.png"]];
                                    [self.imgWeaponQuality setHidden:NO];

                                }else{
                                    [self.imgWeaponQuality setImage:[UIImage imageNamed:@"LegendaryFrame.png"]];
                                    [self.imgWeaponQuality setHidden:NO];
                                }
                                
                                break;
                            case 6: //exotic
                                
                                if (! [self->cCell.imgMaster isHidden]){
                                    [self.imgWeaponQuality setImage:[UIImage imageNamed:@"ExoticMasterFrame.png"]];
                                    [self.imgWeaponQuality setHidden:NO];
                                }else{
                                    [self.imgWeaponQuality setImage:[UIImage imageNamed:@"ExoticFrame.png"]];
                                    [self.imgWeaponQuality setHidden:NO];
                                }
                                
                                break;
                        }
                        
                        
                    }
                    

                    NSDictionary *sStats = bClass.stats;
                    
                    if (sStats){
                        
                        NSDictionary *st = [sStats objectForKey:@"stats"];
                        
                        if (appDelegate.destinyStatDefinitions){
                            
                            for(int sIndex = 0 ; sIndex < st.allKeys.count ; sIndex++){
                                
                                NSString *sKey = [st.allKeys objectAtIndex:sIndex];
                                
                                NSDictionary *s = [st.allValues objectAtIndex:sIndex];
                                
                                DestinyStatDefinition *sDef = [appDelegate.destinyStatDefinitions objectForKey:sKey];
                            
                                
                                NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
                                
                                [numberFormatter setPositiveFormat:@"0.00"];
                                
                                NSNumber *objValue = [NSNumber numberWithLong:[s objectForKey:@"value"]],
                                         *objStatHash = [NSNumber numberWithLong:[s objectForKey:@"statHash"]],
                                         *pBarValue = nil;
                                
                                NSString *statValue = [NSString stringWithFormat:@"%@",[objValue integerValue]],
                                         *statHash = [NSString stringWithFormat:@"%@",[objStatHash integerValue]],
                                         *pVar = nil;
                                
                                pVar = [NSString stringWithFormat:@"%@",statValue];
                                
                                if (objValue.integerValue < 100){
                                    pVar = [NSString stringWithFormat:@"0.%@",statValue];
                                    
                                    if ([statValue isEqualToString:@"100"]){
                                        pVar = @"100";
                                    }
                                }else{
                                    pVar = @"100";
                                }
                                
                                pBarValue = [numberFormatter numberFromString:pVar];
                                
                                if (! sDef){
                                    NSLog(@"Stat Key Not Found=%@",sKey);
                                    
                                    
                                    if ([sKey isEqualToString:@"2523465841"]){
                                        //Velocity
                                        [_lblRangeLabel setText:@"Velocity"];
                                        [_lblRangeValue setText:statValue];
                                        [_pBarRange setProgress:pBarValue.floatValue];
                                    }
                                    
                                    if ([sKey isEqualToString:@"3614673599"]){
                                        //Blast Radius
                                        [_lblImpactLable setText:@"Blast Radius"];
                                        [_lblImpactValue setText:statValue];
                                        [_pBarImpact setProgress:pBarValue.floatValue];
                                    }
                                    
                                    if ([sKey isEqualToString:@"4043523819"]){
                                        //Impact
                                        [_lblImpactValue setText:statValue];
                                        [_pBarImpact setProgress:pBarValue.floatValue];
                                    }
                                    
                                    if ([sKey isEqualToString:@"4284893193"]){
                                        //Rounds per Minute
                                        [_lblRoundsValue setText:statValue];
                                    }
                                    
                                    
                                    if ([sKey isEqualToString:@"447667954"]){
                                        //Draw Time
                                        [_lblRoundsLabel setText:@"Draw Time"];
                                        [_lblRoundsValue setText:statValue];
                                    }
                                    
                                    if ([sKey isEqualToString:@"2961396640"]){
                                        //Charge Time
                                        [_lblRoundsLabel setText:@"Charge Time"];
                                        [_lblRoundsValue setText:statValue];
                                    }
                                    
                                    if ([sKey isEqualToString:@"4188031367"]){
                                        //Reload Speed
                                        [_lblReloadValue setText:statValue];
                                        [_pBarReload setProgress:pBarValue.floatValue];
                                    }
                                    
                                    if ([sKey isEqualToString:@"2715839340"]){
                                        //Recoil Direction
                                        [_lblRecoilValue setText:statValue];
                                        
                                    }
                                    
                                    if ([sKey isEqualToString:@"3871231066"]){
                                        //Magazine
                                        [_lblMagazineLabel setText:@"Magazine"];
                                        [_lblMagazineValue setText:statValue];
                                    }
                                    
                                    if ([sKey isEqualToString:@"1931675084"]){
                                        //Inventory Size
                                        [_lblMagazineLabel setText:@"Inventory Size"];
                                        [_lblMagazineValue setText:statValue];
                                    }
                                    
                                    
                                    
                                    if ([sKey isEqualToString:@"1345609583"]){
                                        //Aim Assist
                                        [_lblAimAssistValue setText:statValue];
                                        [_pBarAimAssist setProgress:pBarValue.floatValue];
                                    }
                                    
                                    
                                    
                                }
                                
                                if (sDef){
                                    NSLog(@"Stat Key=%,Name=%,Value=%@",sKey,sDef.displayProperties.name,statValue);
                             
                                    
                                    if ([sDef.displayProperties.name isEqualToString:@"Blast Radius"]){
                                        //Blast Radius
                                        [_lblImpactLable setText:@"Blast Radius"];
                                        [_lblImpactValue setText:statValue];
                                        [_pBarImpact setProgress:pBarValue.floatValue];
                                    }
                                    
                        
                                    if ([sDef.displayProperties.name isEqualToString:@"Handling"]){
                                        [_lblHandlingValue setText:statValue];
                                        [_pBarHandling setProgress:pBarValue.floatValue];
                                    }
                                    
                                    if ([sDef.displayProperties.name isEqualToString:@"Stability"]){
                                        [_lblStabilityValue setText:statValue];
                                        [_pBarStability setProgress:pBarValue.floatValue];
                                    }
                                    
                                    if ([sDef.displayProperties.name isEqualToString:@"Magazine"]){
                                        [_lblMagazineLabel setText:@"Magazine"];
                                        [_lblMagazineValue setText:statValue];
                                    }
                                    
                                    
                                    if ([sDef.displayProperties.name isEqualToString:@"Inventory Size"]){
                                        [_lblMagazineLabel setText:@"Inventory Size"];
                                        [_lblMagazineValue setText:statValue];
                                    }
                                    
                                    
                                    if ([sDef.displayProperties.name isEqualToString:@"Range"]){
                                        [_lblRangeValue setText:statValue];
                                        [_pBarRange setProgress:pBarValue.floatValue];
                                    }
                                    
                                    if ([sDef.displayProperties.name isEqualToString:@"Velocity"]){
                                        //Velocity
                                        [_lblRangeLabel setText:@"Velocity"];
                                        [_lblRangeValue setText:statValue];
                                        [_pBarRange setProgress:pBarValue.floatValue];
                                    }
                                    
                                    if ([sDef.displayProperties.name isEqualToString:@"Charge Time"]){
                                        //Charge Time
                                        [_lblRoundsLabel setText:@"Charge Time"];
                                        [_lblRoundsValue setText:statValue];
                                    }
                                    
                                    if ([sDef.displayProperties.name isEqualToString:@"Draw Time"]){
                                        //Draw Time
                                        [_lblRoundsLabel setText:@"Draw Time"];
                                        [_lblRoundsValue setText:statValue];
                                    }
                                    
                                    
                                    if ([sDef.displayProperties.name isEqualToString:@"Aim Assistance"]){
                                        //Aim Assist
                                        [_lblAimAssistValue setText:statValue];
                                        [_pBarAimAssist setProgress:pBarValue.floatValue];
                                    }
                                }
                                
                                
                            }
                            
                        }
                        
                    }
                    
                    //Instance Stats
                    if (statData){
                        
                        NSDictionary *stats = [statData objectForKey:@"data"];
                        
                        if (appDelegate.destinyStatDefinitions){
                         
                            NSDictionary *st = [stats objectForKey:@"stats"];
                            
                            if (st){
                                
                                for(int sIndex = 0 ; sIndex < st.allKeys.count ; sIndex++){
                                    
                                    NSString *sKey = [st.allKeys objectAtIndex:sIndex];
                                    
                                    NSDictionary *s = [st.allValues objectAtIndex:sIndex];
                                    
                                    DestinyStatDefinition *sDef = [appDelegate.destinyStatDefinitions objectForKey:sKey];
                                
                                    
                                    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
                                    
                                    [numberFormatter setPositiveFormat:@"0.00"];
                                    
                                    NSNumber *objValue = [NSNumber numberWithLong:[s objectForKey:@"value"]],
                                             *objStatHash = [NSNumber numberWithLong:[s objectForKey:@"statHash"]],
                                             *pBarValue = nil;
                                    
                                    NSString *statValue = [NSString stringWithFormat:@"%@",[objValue integerValue]],
                                             *statHash = [NSString stringWithFormat:@"%@",[objStatHash integerValue]],
                                             *pVar = nil;
                                    
                                    pVar = [NSString stringWithFormat:@"%@",statValue];
                                    
                                    if (objValue.integerValue < 100){
                                        pVar = [NSString stringWithFormat:@"0.%@",statValue];
                                        
                                        if ([statValue isEqualToString:@"100"]){
                                            pVar = @"100";
                                        }
                                        
                                    }else{
                                        pVar = @"100";
                                    }
                                    
                                    pBarValue = [numberFormatter numberFromString:pVar];
                                    
                                    if (! sDef){
                                        NSLog(@"Stat Key Not Found=%@",sKey);
                                        
                                        if ([sKey isEqualToString:@"3614673599"]){
                                            //Blast Radius
                                            [_lblImpactLable setText:@"Blast Radius"];
                                            [_lblImpactValue setText:statValue];
                                            [_pBarImpact setProgress:pBarValue.floatValue];
                                        }
                                        
                                        if ([sKey isEqualToString:@"2523465841"]){
                                            //Velocity
                                            [_lblRangeLabel setText:@"Velocity"];
                                            [_lblRangeValue setText:statValue];
                                            [_pBarRange setProgress:pBarValue.floatValue];
                                        }
                                        
                                        if ([sKey isEqualToString:@"4043523819"]){
                                            //Impact
                                            [_lblImpactValue setText:statValue];
                                            [_pBarImpact setProgress:pBarValue.floatValue];
                                        }
                                        
                                        if ([sKey isEqualToString:@"4284893193"]){
                                            //Rounds per Minute
                                            [_lblRoundsValue setText:statValue];
                                        }
                                
                                        if ( [sKey isEqualToString:@"2961396640"]){
                                            //Charge Time
                                            [_lblRoundsLabel setText:@"Charge Time"];
                                            [_lblRoundsValue setText:statValue];
                                        }
                                        
                                        
                                        if ([sKey isEqualToString:@"4188031367"]){
                                            //Reload Speed
                                            [_lblReloadValue setText:statValue];
                                            [_pBarReload setProgress:pBarValue.floatValue];
                                        }
                                        
                                        if ([sKey isEqualToString:@"2715839340"]){
                                            //Recoil Direction
                                            [_lblRecoilValue setText:statValue];
                                            
                                        }
                                        
                                        
                                        if ([sKey isEqualToString:@"3871231066"]){
                                            //Magazine
                                            [_lblMagazineValue setText:statValue];
                                        }
                                        
                                        
                                        if ([sKey isEqualToString:@"1345609583"]){
                                            //Aim Assist
                                            [_lblAimAssistValue setText:statValue];
                                            [_pBarAimAssist setProgress:pBarValue.floatValue];
                                        }
                                        
                                        
                                    }
                                    
                                    if (sDef){
                                        NSLog(@"Stat Key=%,Name=%,Value=%@",sKey,sDef.displayProperties.name,statValue);
                                 
                                        
                                        if ([sDef.displayProperties.name isEqualToString:@"Blast Radius"]){
                                            //Blast Radius
                                            [_lblImpactLable setText:@"Blast Radius"];
                                            [_lblImpactValue setText:statValue];
                                            [_pBarImpact setProgress:pBarValue.floatValue];
                                        }
                                        
                                        
                                        if ([sDef.displayProperties.name isEqualToString:@"Handling"]){
                                            [_lblHandlingValue setText:statValue];
                                            [_pBarHandling setProgress:pBarValue.floatValue];
                                        }
                                        
                                        if ([sDef.displayProperties.name isEqualToString:@"Stability"]){
                                            [_lblStabilityValue setText:statValue];
                                            [_pBarStability setProgress:pBarValue.floatValue];
                                        }
                                        
                                        if ([sDef.displayProperties.name isEqualToString:@"Magazine"]){
                                            [_lblMagazineValue setText:statValue];
                                        }
                                        
                                        
                                        if ([sDef.displayProperties.name isEqualToString:@"Range"]){
                                            [_lblRangeValue setText:statValue];
                                            [_pBarRange setProgress:pBarValue.floatValue];
                                        }
                                        
                                        if ([sDef.displayProperties.name isEqualToString:@"Aim Assistance"]){
                                            //Aim Assist
                                            [_lblAimAssistValue setText:statValue];
                                            [_pBarAimAssist setProgress:pBarValue.floatValue];
                                        }
                                        
                                        if ([sDef.displayProperties.name isEqualToString:@"Velocity"]){
                                            //Velocity
                                            [_lblRangeLabel setText:@"Velocity"];
                                            [_lblRangeValue setText:statValue];
                                            [_pBarRange setProgress:pBarValue.floatValue];
                                        }
                                        
                                        
                                        if ( [sDef.displayProperties.name isEqualToString:@"Charge Time"]){
                                            //Charge Time
                                            [_lblRoundsLabel setText:@"Charge Time"];
                                            [_lblRoundsValue setText:statValue];
                                        }
                                        
                                        
                                    }
                                    
                                    
                                }
                            }
                        
                            
                            
                        }
                        
                        
                    }
                    
                    
                    [self.lblFlavoredText setText:bClass.flavorText];
                    
                    NSLog(@"Weapon Name=%@",self.lblWeaponName.text);
                    [self.lblWeaponType setText:bClass.itemTypeAndTierDisplayName];
                    NSLog(@"Weapon Type=%@",self.lblWeaponType.text);
                    
                    [self.lblPower setText:self->cCell.lblPowerLevel.text];
                    
                    [self.imgWeaponIcon setImage:self->cCell.imgItem.image];
                    
                    [self.imgWeaponBurn setImage:self->cCell.imgItemBurn.image];
                    
                    if (screeShot){
                        
                    
                        if (! self.imgWeaponScreenshot){
                            self.imgWeaponScreenshot = [[UIImageView alloc] init];
                        }
                        
                        [self.imgWeaponScreenshot setImageWithURL:screeShot];
                    
                    }
                }
                
            }
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        [self startTimer];
    }
    
    

  
}



 
    
-(void) registerNotifications{

    
     
    
    
}



- (IBAction)weaponAction:(UIButton *)sender {
    
    
    if (self->cCell){
        
        [self dismissViewControllerAnimated:NO completion:^{
            
            [self->cCell transferItemAction:self->allCharsData];

            
        }];
        
    }
    
}

-(void) loadWeaponDetail:(INSTBaseClass *) weaponData withWeaponCell:(ItemCellTableView*) anyCell charactersData:(NSMutableDictionary *) characters{
    
    NSDictionary *response = nil,
                 *statData = nil;
                
    INVDInventory *invData = nil;
    
    NSArray  *perkData = nil;
    
    
    @try {
        
        if (weaponData){
            
            self->allCharsData = characters;
            self->cWeapon = weaponData;
            self->cCell = anyCell;
            
            return;
            response = (NSDictionary*)[weaponData response];
            
            if (response){
                invData =  (INVDInventory*) [response objectForKey:@"instance"];
            
                statData = (NSDictionary*) [response objectForKey:@"stats"];
            
                perkData = (NSArray*) [response objectForKey:@"perks"];
                
                
                
                if (anyCell){
                    NSString *baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,anyCell.lblMisc.text];
                    NSURL *screeShot = [[NSURL alloc] initWithString:baseURL];
                    
                    if (! self.lblWeaponName){
                        self.lblWeaponName = [[UILabel alloc] init];
                    }
                        
                    [self.lblWeaponName setText:anyCell.lblItemName.text];
                    
                    NSLog(@"Weapon Name=%@",self.lblWeaponName.text);
                    [self.lblWeaponType setText:anyCell.lblItemType.text];
                    NSLog(@"Weapon Type=%@",self.lblWeaponType.text);
                    
                    if (screeShot){
                        
                        
                        if (! self.imgWeaponScreenshot){
                            self.imgWeaponScreenshot = [[UIImageView alloc] init];
                        }
                        
                        [self.imgWeaponScreenshot setImageWithURL:screeShot];
                        
                        [self.imgWeaponIcon setImage:anyCell.imgItem.image];
                    }
                }
                
            }
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}

-(void) loadLostItems{
 
    NSString *message   = @"3:ItemsViewController:loadLostItems:Invoked by GuardianViewController...",
             *strMID    = @"",
             *strCharID = @"";
    
    NSDictionary        *chars = nil,
                        *equip = nil,
                        *cChar = nil,
                        *vData = nil;
    
    NSArray             *vArray = nil,
                        *eArray = nil;
    
    NSMutableDictionary *cBucket = [[NSMutableDictionary alloc] init];
    
    NSMutableArray *cBucketDef = [[NSMutableArray alloc] init];
    
    @try {
        NSLog(@"%@",message);
        
        isGeneralItems = NO;
        isLostItems = YES;
        isVaultItems = NO;
        isInventoryItems = NO;
         
        strMID = self.selectedMembership;
        strCharID = self.selectedChar;
        
        if (! appDelegate){
            appDelegate = [AppDelegate currentDelegate];
        }
        
        chars = self.destChars;
        
        vData = self.destVaultItems;
        
        equip = self.destEquippedItems;
      
        vArray = self.destVaultItemsBuckets;
        
        eArray = self.destEquippedItemsBuckets;
        
        cChar = [chars objectForKey:strCharID];
        
        if (strCharID){
            
            if (! self->destItemData){
                self->destItemData = [[NSMutableDictionary alloc] init];
            }
            
            if(! self->itemBuckets){
                self->itemBuckets = [[NSMutableArray alloc] initWithCapacity:eArray.count];
            }
            
            if (! self->instanceData){
                self->instanceData = [[NSMutableDictionary alloc] init];
            }
            
            for(int idx = 0 ;idx < eArray.count; idx ++){
             
                NSString *sectionKey = [eArray objectAtIndex:idx];
                
                NSString *bucketFilter = [NSString stringWithFormat:@"%@_%@",strCharID, sectionKey];
               
                NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",bucketFilter];
                
                NSArray *filteredItems = [equip.allKeys filteredArrayUsingPredicate:bPredicate];
               
                if (filteredItems){
                    
                    if (! [cBucketDef containsObject:bucketFilter]){
                          [cBucketDef addObject:bucketFilter];
                    }
                    
                    for(int fIdx = 0 ; fIdx < filteredItems.count ; fIdx++){
                       
                        NSString *cFBucket = [filteredItems objectAtIndex:fIdx];
                        
                        INVCItems *cFItem = (INVCItems *) [equip objectForKey:cFBucket];
                        
                        if (cFItem){
                         if (![cBucket.allKeys containsObject:cFBucket]){
                             [cBucket setValue:cFItem forKey:cFBucket];
                             
                          }
                            
                            NSNumber *objHashId  = [[NSNumber alloc] initWithDouble:cFItem.itemHash];
                            NSString *strHashKey = [NSString stringWithFormat:@"%@",objHashId],
                                     *strInstanceId = cFItem.itemInstanceId;
                            
                            if (strHashKey){
                                
                                if (! [self->instanceData.allKeys containsObject:strHashKey]){
                                     
                                    //Need to get instance data
                                    NSLog(@"ItemsViewController:loadItems:APICall to getInstancedItem:For->%@",strHashKey);
                                    
                                    [NetworkAPISingleClient getInstancedItem:strInstanceId completionBlock:^(NSArray *values){
                                            
                                        if (values){
                                            
                                            INSTBaseClass *instanceBase = (INSTBaseClass*) [values firstObject];
                                                    
                                            NSString *strIDX = [NSString stringWithFormat:@"%d",fIdx],
                                                     *strSDX = [NSString stringWithFormat:@"%d",idx];
                                                
                                            NSDictionary *callerInfo = [[NSDictionary alloc]
                                                            initWithObjectsAndKeys:@"ItemsViewController",@"ClassName",
                                                                                    @"loadItems",@"MethodName",
                                                                                    strIDX,@"CurrentIndex",
                                                                                    strSDX,@"CurrentSection",
                                                                                    strHashKey, @"itemHashKey",
                                                                                    strInstanceId, @"itemInstanceId",nil];
                                                    
                                            [[NSNotificationCenter defaultCenter]
                                                postNotificationName:kDestinyLoadedInstancedItemNotification
                                                                object:instanceBase
                                                            userInfo:callerInfo];
                                                    
                                      NSLog(@"ItemsViewController:loadItems:kDestinyLoadedInstancedItemNotification:Raised->%@",strHashKey);
                                                
                                                
                                     }
                                                
                                    }
                                    andErrorBlock:^(NSError *exception){
                                     NSLog(@"ItemsViewController:loadItems:getInstancedItem:Exception->%@",exception.description);
                                     }];
                                    
                                }
                            }
                            
                        }
                        
                    }
                    
                   // self->itemBuckets = [cBucketDef copy];
                   // self->destItemData = [cBucket copy];
                }
                 
            }
            
            self->itemBuckets = [cBucketDef copy];
            self->destItemData = [cBucket copy];
        }
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
    
}

-(void) loadItems{
 
    NSString *message   = @"3:ItemsViewController:loadItems:Invoked by GuardianViewController...",
             *strMID    = @"",
             *strCharID = @"";
    
    NSDictionary        *chars = nil,
                        *equip = nil,
                        *cChar = nil,
                        *vData = nil;
    
    NSArray             *vArray = nil,
                        *eArray = nil;
    
    NSMutableDictionary *cBucket = [[NSMutableDictionary alloc] init];
    
    NSMutableArray *cBucketDef = [[NSMutableArray alloc] init];
    
    @try {
        NSLog(@"%@",message);
        
        isGeneralItems = YES;
        isLostItems = NO;
        isVaultItems = NO;
        isInventoryItems = NO;
         
        strMID = self.selectedMembership;
        strCharID = self.selectedChar;
        
        if (! appDelegate){
            appDelegate = [AppDelegate currentDelegate];
        }
        
        chars = self.destChars;
        
        vData = self.destVaultItems;
        
        equip = self.destEquippedItems;
      
        vArray = self.destVaultItemsBuckets;
        
        eArray = self.destEquippedItemsBuckets;
        
        cChar = [chars objectForKey:strCharID];
        
        if (strCharID){
            
            if (! self->destItemData){
                self->destItemData = [[NSMutableDictionary alloc] init];
            }
            
            if(! self->itemBuckets){
                self->itemBuckets = [[NSMutableArray alloc] initWithCapacity:eArray.count];
            }
            
            if (! self->instanceData){
                self->instanceData = [[NSMutableDictionary alloc] init];
            }
            
            for(int idx = 0 ;idx < eArray.count; idx ++){
             
                NSString *sectionKey = [eArray objectAtIndex:idx];
                
                NSString *bucketFilter = [NSString stringWithFormat:@"%@_%@",strCharID, sectionKey];
               
                NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",bucketFilter];
                
                NSArray *filteredItems = [equip.allKeys filteredArrayUsingPredicate:bPredicate];
               
                if (filteredItems){
                    
                    if (! [cBucketDef containsObject:bucketFilter]){
                          [cBucketDef addObject:bucketFilter];
                    }
                    
                    for(int fIdx = 0 ; fIdx < filteredItems.count ; fIdx++){
                       
                        NSString *cFBucket = [filteredItems objectAtIndex:fIdx];
                        
                        INVCItems *cFItem = (INVCItems *) [equip objectForKey:cFBucket];
                        
                        if (cFItem){
                         if (![cBucket.allKeys containsObject:cFBucket]){
                             [cBucket setValue:cFItem forKey:cFBucket];
                             
                          }
                            
                            NSNumber *objHashId  = [[NSNumber alloc] initWithDouble:cFItem.itemHash];
                            NSString *strHashKey = [NSString stringWithFormat:@"%@",objHashId],
                                     *strInstanceId = cFItem.itemInstanceId;
                            
                            if (strHashKey){
                                
                                if (! [self->instanceData.allKeys containsObject:strHashKey]){
                                     
                                    //Need to get instance data
                                    NSLog(@"ItemsViewController:loadItems:APICall to getInstancedItem:For->%@",strHashKey);
                                    
                                    [NetworkAPISingleClient getInstancedItem:strInstanceId completionBlock:^(NSArray *values){
                                            
                                        if (values){
                                            
                                            INSTBaseClass *instanceBase = (INSTBaseClass*) [values firstObject];
                                                    
                                            NSString *strIDX = [NSString stringWithFormat:@"%d",fIdx],
                                                     *strSDX = [NSString stringWithFormat:@"%d",idx];
                                                
                                            NSDictionary *callerInfo = [[NSDictionary alloc]
                                                            initWithObjectsAndKeys:@"ItemsViewController",@"ClassName",
                                                                                    @"loadItems",@"MethodName",
                                                                                    strIDX,@"CurrentIndex",
                                                                                    strSDX,@"CurrentSection",
                                                                                    strHashKey, @"itemHashKey",
                                                                                    strInstanceId, @"itemInstanceId",nil];
                                                    
                                            [[NSNotificationCenter defaultCenter]
                                                postNotificationName:kDestinyLoadedInstancedItemNotification
                                                                object:instanceBase
                                                            userInfo:callerInfo];
                                                    
                                      NSLog(@"ItemsViewController:loadItems:kDestinyLoadedInstancedItemNotification:Raised->%@",strHashKey);
                                                
                                                
                                     }
                                                
                                    }
                                    andErrorBlock:^(NSError *exception){
                                     NSLog(@"ItemsViewController:loadItems:getInstancedItem:Exception->%@",exception.description);
                                     }];
                                    
                                }
                            }
                            
                        }
                        
                    }
                    
                   // self->itemBuckets = [cBucketDef copy];
                   // self->destItemData = [cBucket copy];
                }
                 
            }
            
            self->itemBuckets = [cBucketDef copy];
            self->destItemData = [cBucket copy];
        }
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
    
}

-(void) endTimer{
    
    if (self.timer != nil){
        [self.timer invalidate];
    }
    NSLog(@"WeapnsDetailsViiewController Timer Stopped");
    self.timer = nil;
}


-(void) startTimer{
    

    double interval = 0.5;
    
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]
                                              interval:interval target:self
                                              selector:@selector(timerFireMethod:)
                                              userInfo:nil
                                               repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
    
        [self.loop addTimer:self.timer forMode:NSDefaultRunLoopMode];
 
    
}




- (void)timerFireMethod:(NSTimer *)t{
    
    NSString *message         = @"Fix Gaps Check called",
             *tName           = @"";
    
    BOOL stopTimer = NO;
    @try {
        
            
        //fix gaps
       
       // [UIView setAnimationsEnabled:NO];
        
        if (self.lblTrait2Desc.text.length > 0 && self.lblTrait1Desc.text.length == 0){
            
            tName = [self.lblTrait2Desc text];
            
            [self.lblTrait1Desc setText:tName];
            [self.lblTrait2Desc setText:@""];
 
            [self.btnBarrelPerk1 setImage:self.btnBarrelPerk2.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnBarrelPerk2 setHidden:YES];
            [self.btnBarrelPerk1 setHidden:NO];
            
            
            stopTimer = YES;
            tName = nil;
        }
        
        
        if (self.lblTrait3Desc.text.length > 0 && self.lblTrait2Desc.text.length == 0){
            
            tName = [self.lblTrait3Desc text];
            
            [self.lblTrait2Desc setText:tName];
            [self.lblTrait3Desc setText:@""];
            
            [self.btnBarrelPerk2 setImage:self.btnMagazine1.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnMagazine1 setHidden:YES];
            [self.btnBarrelPerk2 setHidden:NO];
            
            stopTimer = YES;
            tName = nil;
        }
        
        
        if (self.lblTrait4Desc.text.length > 0 && self.lblTrait3Desc.text.length == 0){
            
            tName = [self.lblTrait4Desc text];
            
            [self.lblTrait3Desc setText:tName];
            [self.lblTrait4Desc setText:@""];;
            
            [self.btnMagazine1 setImage:self.btnMagazine2.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnMagazine2 setHidden:YES];
            [self.btnMagazine1 setHidden:NO];
            
            stopTimer = YES;
            tName = nil;
        }
        
        
        if (self.lblTrait5Desc.text.length > 0 && self.lblTrait4Desc.text.length == 0){
            
            tName = [self.lblTrait5Desc text];
            
            [self.lblTrait4Desc setText:tName];
            [self.lblTrait5Desc setText:@""];
            
            [self.btnMagazine2 setImage:self.btnPerkTrait1.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnPerkTrait1 setHidden:YES];
            [self.btnMagazine2 setHidden:NO];
            
            stopTimer = YES;
            tName = nil;
            
        }
        
        
        if (self.lblTrait6Desc.text.length > 0 && self.lblTrait5Desc.text.length == 0){
            
            tName = self.lblTrait6Desc.text;
            
            [self.lblTrait5Desc setText:tName];
            [self.lblTrait6Desc setText:@""];
            
            [self.btnPerkTrait1 setImage:self.btnPerkTrait2.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnPerkTrait2 setHidden:YES];
            [self.btnPerkTrait1 setHidden:NO];
            
            tName = nil;
            stopTimer = YES;
        }
        
        if (self.lblTrait7Desc.text.length > 0 && self.lblTrait6Desc.text.length == 0){
            
            tName = [self.lblTrait7Desc text];
            
            [self.lblTrait6Desc setText:tName];
            [self.lblTrait7Desc setText:@""];
            
            [self.btnPerkTrait2 setImage:self.btnPerkTrait3.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnPerkTrait3 setHidden:YES];
            [self.btnPerkTrait2 setHidden:NO];
            
            tName = nil;
            stopTimer = YES;
        }
        
        
        if (self.lblTrait8Desc.text.length > 0 && self.lblTrait7Desc.text.length == 0){
            
            tName = [self.lblTrait8Desc text];
            
            [self.lblTrait7Desc setText:tName];
            [self.lblTrait8Desc setText:@""];
            
            [self.btnPerkTrait3 setImage:self.btnPerkTrait4.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnPerkTrait4 setHidden:YES];
            [self.btnPerkTrait3 setHidden:NO];
             
            stopTimer = YES;
            tName = nil;
        }
        
        
        
        if (self.lblTrait9Desc.text.length > 0 && self.lblTrait8Desc.text.length == 0){
            
            tName = [self.lblTrait9Desc text];
            
            [self.lblTrait8Desc setText:tName];
            [self.lblTrait9Desc setText:@""];
            
            [self.btnPerkTrait4 setImage:self.btnKillTracker1.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnKillTracker1 setHidden:YES];
            [self.btnPerkTrait4 setHidden:NO];
            
            tName = nil;
            stopTimer = YES;
        }
        
        
      
       // [UIView setAnimationsEnabled:YES];
           
        if (stopTimer){
         //   [self endTimer];
        }
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
       
        stopTimer = NO;
        
    }
    
    
}


 


-(void) closeAction{
    
    
    
    
}

 
@end
