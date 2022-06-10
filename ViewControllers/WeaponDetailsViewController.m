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
                        *allCharsData,
                        *perkDetails;
    
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
        [btnClose setTintColor:[UIColor systemOrangeColor]];
        [btnClose setAction:@selector(closeAction)];
        
    }

    self.navigationItem.rightBarButtonItem = btnClose;
    
    
    NSDictionary *response = nil,
                 *statData = nil,
                 *perkData = nil;
                
    INVDInventory *invData = nil;
    
    @try {
        
        if (self->cWeapon){
            
            NSString *staticHash = cCell.lblHash.text,
                     *instHash   = cCell.lblInstanceId.text;
            
            
            
            
            
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
                                
                                //Check against AppDelegate SandBox Perk first
                                
                                if (appDelegate.destinySandBoxPerkDefinitions){
                                    
                                    SandPerkBaseClass *perkBase = [appDelegate.destinySandBoxPerkDefinitions objectForKey:perkHash];
                                    
                                    if (perkBase){
                                       
                                        SPDisplayProperties *perkDisp = perkBase.displayProperties;
                                        
                                        [self setPerkByData:perkDisp withIndex:iPdx];
                                        
                                    }
                                    else{
                                        
                                        
                                        
                                        [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinySandboxPerkDefinition"
                                                                    staticHashId:perkHash completionBlock:^(NSArray *values) {
                                            
                                     if (values){
                                                            
                                                                
                                         INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                                                        
                                         if (invItem){
                                             
                                             NSDictionary *resp = (NSDictionary*) [ invItem response];
                                             
                                             if (resp){
                                                 
                                                 SPDisplayProperties * dispProp = [[SPDisplayProperties alloc]
                                                                        initWithDictionary:[resp objectForKey:@"displayProperties"]];
                                                 
                                           
                                                 if (dispProp){
                                                     
                                                     [self setPerkByData:dispProp withIndex:iPdx];
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
                                    
                                    
                                }
                                
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
                    
                    [self setStaticStatsByHashKey:staticHash withExistingCell:self->cCell];
                    
                    //Instance Stats
                    [self setInstanceStatsByData:statData];
                           
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

-(void) setInstanceStatsByData:(NSDictionary *)statInstanceData{
    
    
    NSDictionary *stats = nil,
                 *st    = nil,
                 *s     = nil;
    
    DestinyStatDefinition *sDef = nil;
    
    NSString *sKey = nil,
             *statValue = nil,
             *statHash = nil,
             *pVar = nil;
    
    NSNumberFormatter *numberFormatter = nil;
    
    NSNumber *objValue = nil,
             *objStatHash = nil,
             *pBarValue = nil;
    
    @try {
        
        //Instance Stats
        if (statInstanceData){
            
            stats = [statInstanceData objectForKey:@"data"];
            
            if (appDelegate.destinyStatDefinitions){
             
                st = [stats objectForKey:@"stats"];
                
                if (st){
                    
                    for(int sIndex = 0 ; sIndex < st.allKeys.count ; sIndex++){
                        
                        sKey = [st.allKeys objectAtIndex:sIndex];
                        
                        s = [st.allValues objectAtIndex:sIndex];
                        
                        sDef = [appDelegate.destinyStatDefinitions objectForKey:sKey];
                    
                        
                        numberFormatter = [[NSNumberFormatter alloc] init];
                        
                        [numberFormatter setPositiveFormat:@"0.00"];
                        
                        objValue = [NSNumber numberWithLong:[s objectForKey:@"value"]];
                        objStatHash = [NSNumber numberWithLong:[s objectForKey:@"statHash"]];
                        
                        
                        statValue = [NSString stringWithFormat:@"%@",[objValue integerValue]];
                        statHash = [NSString stringWithFormat:@"%@",[objStatHash integerValue]];
                               
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
        
    } @catch (NSException *exception) {
        
    } @finally {
        
        stats = nil;
        st    = nil;
        s     = nil;
        
        sDef = nil;
        
        sKey = nil;
        statValue = nil;
        statHash = nil;
        pVar = nil;
        
        numberFormatter = nil;
        
        objValue = nil;
        objStatHash = nil;
       pBarValue = nil;
        
    }
    
    
}

-(void) setStaticStatsByHashKey:(NSString *)statHash withExistingCell:(ItemCellTableView *) anyCell {
    
    
    INVDResponse *bClass = nil;
    
    NSNumber *objTier = nil;
    
    NSDictionary *sStats = nil,
                 *st = nil;
    
    DestinyStatDefinition *sDef = nil;
    
    NSNumberFormatter *numberFormatter = nil;
    @try {
       
        /*
         Unknown: 0
         Currency: 1
         Basic: 2
         Common: 3
         Rare: 4
         Superior: 5
         Exotic: 6
         
         */
        
        if (statHash){
            
             
            bClass =  [appDelegate.destinyInventoryItemDefinitions objectForKey:statHash];
          
            if (bClass){
                objTier = [NSNumber numberWithDouble:bClass.inventory.tierType];
                
                
                [self.lblFlavoredText setText:bClass.flavorText];
                
                NSLog(@"Weapon Name=%@",self.lblWeaponName.text);
                [self.lblWeaponType setText:bClass.itemTypeAndTierDisplayName];
                NSLog(@"Weapon Type=%@",self.lblWeaponType.text);
                
            }
            
            [self.imgWeaponIcon.layer setBorderColor:anyCell.imgItem.layer.borderColor];
            [self.imgWeaponIcon.layer setBorderWidth:anyCell.imgItem.layer.borderWidth];
            
            
            switch(objTier.integerValue){
                case 4: //blue
                    
                    break;
                case 5: //legendary
                    
                    if (! [anyCell.imgMaster isHidden]){
                        [self.imgWeaponQuality setImage:[UIImage imageNamed:@"LegendaryMasterFrame.png"]];
                        [self.imgWeaponQuality setHidden:NO];

                    }else{
                        [self.imgWeaponQuality setImage:[UIImage imageNamed:@"LegendaryFrame.png"]];
                        [self.imgWeaponQuality setHidden:NO];
                    }
                    
                    break;
                case 6: //exotic
                    
                    if (! [anyCell.imgMaster isHidden]){
                        [self.imgWeaponQuality setImage:[UIImage imageNamed:@"ExoticMasterFrame.png"]];
                        [self.imgWeaponQuality setHidden:NO];
                    }else{
                        [self.imgWeaponQuality setImage:[UIImage imageNamed:@"ExoticFrame.png"]];
                        [self.imgWeaponQuality setHidden:NO];
                    }
                    
                    break;
            }
            
            
        }
        

        sStats = bClass.stats;
        
        if (sStats){
            
            st = [sStats objectForKey:@"stats"];
            
            if (appDelegate.destinyStatDefinitions){
                
                for(int sIndex = 0 ; sIndex < st.allKeys.count ; sIndex++){
                    
                    NSString *sKey = [st.allKeys objectAtIndex:sIndex];
                    
                    NSDictionary *s = [st.allValues objectAtIndex:sIndex];
                    
                    sDef = [appDelegate.destinyStatDefinitions objectForKey:sKey];
                
                    
                    numberFormatter = [[NSNumberFormatter alloc] init];
                    
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
                        
                        if ([sKey isEqualToString:@"2837207746"]){
                            //Swing Speed
                            [_lblRangeLabel setText:@"Swing Speed"];
                            [_lblRangeValue setText:statValue];
                            [_pBarRange setProgress:pBarValue.floatValue];
                        }
                        
                        if ([sKey isEqualToString:@"3022301683"]){
                            //Charge Rate
                            [_lblStabilityLabel setText:@"Charge Rate"];
                            [_lblStabilityValue setText:statValue];
                            [_pBarStability setProgress:pBarValue.floatValue];
                        }
                        
                        
                        
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
                        
                        
                        if ([sDef.displayProperties.name isEqualToString:@"Charge Rate"]){
                            //Charge Rate
                            [_lblStabilityLabel setText:@"Charge Rate"];
                            [_lblStabilityValue setText:statValue];
                            [_pBarStability setProgress:pBarValue.floatValue];
                        }
                        
                        
                        if ([sDef.displayProperties.name isEqualToString:@"Stability"]){
                            [_lblStabilityLabel setText:@"Stability"];
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
                        
                        if ([sDef.displayProperties.name isEqualToString:@"Swing Speed"]){
                            //Swing Speed
                            [_lblRangeLabel setText:@"Swing Speed"];
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
        
        
    } @catch (NSException *exception) {
     
    } @finally {
        
        
        bClass = nil;
        
        objTier = nil;
        
        sStats = nil;
        st = nil;
        
        sDef = nil;
        
        numberFormatter = nil;
        
    }
    
}

-(void) setStatsByData:(NSDictionary *) statData{
    
}

-(void) setPerkByData:(SPDisplayProperties*) dispProp withIndex:(int) anyIndex{
    
    BOOL hasIcon   = NO;
    
    NSString *dName =  nil,
             *dDessc = nil,
             *dIcon  = nil,
             *dHash  = nil;
    

    @try {
        
        if (dispProp){
            
            if (! self->perkDetails){
                self->perkDetails = [[NSMutableDictionary alloc] init];
            }
            
            hasIcon   = dispProp.hasIcon;
            
            dName =  dispProp.name;
            dDessc = dispProp.displayPropertiesDescription;
            dIcon  = dispProp.icon;
           
            dHash  = [NSString stringWithFormat:@"%d",dispProp.hash];
            
            if (![self->perkDetails.allKeys containsObject:dHash]){
                [self->perkDetails setObject:dispProp forKey:dHash];
            }
            
            if (dName){
               
                switch(anyIndex){
                case 0:{
                 
                    [self.lblTrait1Desc setText:dName];
                    [self.lblTrait1Desc setTag:dispProp.hash];
                    [self.btnBarrelPerk1 setToolTip:dDessc];
                    [self.btnBarrelPerk1 setHidden:NO];
                    [self.btnBarrelPerk1 setTag:dispProp.hash];
                    break;
                }
                case 1:{
                    [self.lblTrait2Desc setText:dName];
                    [self.lblTrait2Desc setTag:dispProp.hash];
                    [self.btnBarrelPerk2 setToolTip:dDessc];
                    [self.btnBarrelPerk2 setTag:dispProp.hash];
                    [self.btnBarrelPerk2 setHidden:NO];
                    break;
                }
                case 2:{
                    [self.lblTrait3Desc setText:dName];
                    [self.lblTrait3Desc setTag:dispProp.hash];
                    [self.btnMagazine1 setToolTip:dDessc];
                    [self.btnMagazine1 setTag:dispProp.hash];
                    [self.btnMagazine1 setHidden:NO];
                    break;
                }
                case 3:{
                    [self.lblTrait4Desc setText:dName];
                    [self.lblTrait4Desc setTag:dispProp.hash];
                    [self.btnMagazine2 setToolTip:dDessc];
                    [self.btnMagazine2 setTag:dispProp.hash];
                    [self.btnMagazine2 setHidden:NO];
                    break;
                }
                case 4:{
                    [self.lblTrait5Desc setText:dName];
                    [self.lblTrait5Desc setTag:dispProp.hash];
                    [self.btnPerkTrait1 setToolTip:dDessc];
                    [self.btnPerkTrait1 setTag:dispProp.hash];
                    [self.btnPerkTrait1 setHidden:NO];
                    break;
                }
                case 5:{
                    [self.lblTrait6Desc setText:dName];
                    [self.lblTrait6Desc setTag:dispProp.hash];
                    [self.btnPerkTrait2 setToolTip:dDessc];
                    [self.btnPerkTrait2 setTag:dispProp.hash];
                    [self.btnPerkTrait2 setHidden:NO];
                    break;
                }
                case 6:{
                    [self.lblTrait7Desc setText:dName];
                    [self.lblTrait7Desc setTag:dispProp.hash];
                    [self.btnPerkTrait3 setToolTip:dDessc];
                    [self.btnPerkTrait3 setTag:dispProp.hash];
                    [self.btnPerkTrait3 setHidden:NO];
                    break;
                }
                case 7:{
                    [self.lblTrait8Desc setText:dName];
                    [self.lblTrait8Desc setTag:dispProp.hash];
                    [self.btnPerkTrait4 setToolTip:dDessc];
                    [self.btnPerkTrait4 setTag:dispProp.hash];
                    [self.btnPerkTrait4 setHidden:NO];
                    break;
                }
                case 8:{
                    [self.lblTrait9Desc setText:dName];
                    [self.lblTrait9Desc setTag:dispProp.hash];
                    [self.btnKillTracker1 setToolTip:dDessc];
                    [self.btnKillTracker1 setTag:dispProp.hash];
                    [self.btnKillTracker1 setHidden:NO];
                    break;
                }
              }
            }
            
            if (hasIcon){
                
                if (![dIcon isEqualToString:@"img/misc/missing_icon_d2.png"]){
                    
                    if (dIcon.length > 0 ){
                        
                        NSString *baseURL     = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,dIcon];
                        NSURL *perkURL        = [[NSURL alloc] initWithString:baseURL];
                        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:perkURL];
                        
                        UIImage *imgPH = [UIImage imageNamed:@"weaponFrame"];
                        
                        UIImageView *pImg  = [[UIImageView alloc] initWithImage:imgPH];
                        
                        [pImg setImageWithURLRequest:request placeholderImage:imgPH success:^
                                (NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                            
                            NSLog(@"Weapon Details:setPerkByData:Icon->%@",baseURL);
                            
                            switch(anyIndex){
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
                                             
                            NSLog(@"Weapon Details:setPerkByData:Exception->%@",baseURL);
                        }];
                        
                        
                    }
                     
                    
               }
                
            }
        }
        
        
    } @catch (NSException *exception) {
        NSLog(@"Weapon Details:setPerkByData:Exception->%@",exception.description);
    } @finally {
        
        hasIcon   = NO;
        dName =  nil,
        dDessc = nil,
        dIcon  = nil;
        
    }
    
 
    
}
 
    
-(void) registerNotifications{

    
     
    
    
}



- (IBAction)perkLookupAction:(UIButton *)sender {
    
    int perkHash = 0;
    
    NSString *strPerkHash = nil,
             *strPerkDesc = nil,
              *strPerkName = nil;
    INVDDisplayProperties *dispProp = nil;
    
    NSArray<UIView *> *labels;
    
    if (sender){
         
        labels = self.view.subviews ;
        
        perkHash = [sender tag];
        
        strPerkHash = [NSString stringWithFormat:@"%d",perkHash];
        
       
        if (strPerkHash.length > 0){
            if (self->perkDetails){
            
                dispProp = [self->perkDetails objectForKey:strPerkHash];
                
                if (dispProp){
                     
                    strPerkDesc = [dispProp displayPropertiesDescription];
                    
                    strPerkName = [dispProp name];
                    
                    if (labels){
                        
                        for(UIView *label in labels){
                            
                            
                            if ([label isKindOfClass:[UILabel class]] && (label.tag)){
                                
                                UILabel *lblPerk = (UILabel *) label;
                                
                                if (strPerkDesc.length > 0 && [lblPerk.text isEqualToString:strPerkName]){
                                    [lblPerk setText:strPerkDesc];
                                    [sender setSelected:YES];
                                }else
                                {
                                
                                    if (strPerkDesc.length > 0 && [lblPerk.text isEqualToString:strPerkDesc]){
                                        [lblPerk setText:strPerkName];
                                        [sender setSelected:YES];
                                    }
                                }
                                
                            }
                            
  
                            
                        }
                        
                    }
                    

                }
            
            }
        }
        
     
        
    }
    
    
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
            [self.lblTrait1Desc setTag:self.lblTrait2Desc.tag];
            [self.lblTrait2Desc setTag:-1];
            [self.lblTrait2Desc setText:@""];
            
 
            [self.btnBarrelPerk1 setImage:self.btnBarrelPerk2.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnBarrelPerk1 setTag:self.btnBarrelPerk2.tag];
            [self.btnBarrelPerk2 setTag:-1];
            
            [self.btnBarrelPerk2 setHidden:YES];
            [self.btnBarrelPerk1 setHidden:NO];
            
            
            stopTimer = YES;
            tName = nil;
        }
        
        
        if (self.lblTrait3Desc.text.length > 0 && self.lblTrait2Desc.text.length == 0){
            
            tName = [self.lblTrait3Desc text];
            
            [self.lblTrait2Desc setText:tName];
            [self.lblTrait2Desc setTag:self.lblTrait3Desc.tag];
            [self.lblTrait3Desc setTag:-1];
            [self.lblTrait3Desc setText:@""];
            
            [self.btnBarrelPerk2 setImage:self.btnMagazine1.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnBarrelPerk2 setTag:self.btnMagazine1.tag];
            [self.btnMagazine1 setTag:-1];
            
            [self.btnMagazine1 setHidden:YES];
            [self.btnBarrelPerk2 setHidden:NO];
            
            stopTimer = YES;
            tName = nil;
        }
        
        
        if (self.lblTrait4Desc.text.length > 0 && self.lblTrait3Desc.text.length == 0){
            
            tName = [self.lblTrait4Desc text];
            
            [self.lblTrait3Desc setText:tName];
            [self.lblTrait3Desc setTag:self.lblTrait4Desc.tag];
            [self.lblTrait4Desc setTag:-1];
            [self.lblTrait4Desc setText:@""];;
            
            [self.btnMagazine1 setImage:self.btnMagazine2.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnMagazine1 setTag:self.btnMagazine2.tag];
            [self.btnMagazine2 setTag:-1];
            
            [self.btnMagazine2 setHidden:YES];
            [self.btnMagazine1 setHidden:NO];
            
            stopTimer = YES;
            tName = nil;
        }
        
        
        if (self.lblTrait5Desc.text.length > 0 && self.lblTrait4Desc.text.length == 0){
            
            tName = [self.lblTrait5Desc text];
            
            [self.lblTrait4Desc setText:tName];
            [self.lblTrait4Desc setTag:self.lblTrait5Desc.tag];
            [self.lblTrait5Desc setTag:-1];
            [self.lblTrait5Desc setText:@""];
            
            [self.btnMagazine2 setImage:self.btnPerkTrait1.currentImage
                                 forState:UIControlStateNormal];
            [self.btnMagazine2 setTag:self.btnPerkTrait1.tag];
            [self.btnPerkTrait1 setTag:-1];
            
            [self.btnPerkTrait1 setHidden:YES];
            [self.btnMagazine2 setHidden:NO];
            
            stopTimer = YES;
            tName = nil;
            
        }
        
        
        if (self.lblTrait6Desc.text.length > 0 && self.lblTrait5Desc.text.length == 0){
            
            tName = self.lblTrait6Desc.text;
            
            [self.lblTrait5Desc setText:tName];
            [self.lblTrait5Desc setTag:self.lblTrait6Desc.tag];
            [self.lblTrait6Desc setTag:-1];
            [self.lblTrait6Desc setText:@""];
            
            [self.btnPerkTrait1 setImage:self.btnPerkTrait2.currentImage
                                 forState:UIControlStateNormal];
            [self.btnPerkTrait1 setTag:self.btnPerkTrait2.tag];
            [self.btnPerkTrait2 setTag:-1];
            
            [self.btnPerkTrait2 setHidden:YES];
            [self.btnPerkTrait1 setHidden:NO];
            
            tName = nil;
            stopTimer = YES;
        }
        
        if (self.lblTrait7Desc.text.length > 0 && self.lblTrait6Desc.text.length == 0){
            
            tName = [self.lblTrait7Desc text];
            
            [self.lblTrait6Desc setText:tName];
            [self.lblTrait6Desc setTag:self.lblTrait7Desc.tag];
            [self.lblTrait7Desc setTag:-1];
            [self.lblTrait7Desc setText:@""];
            
            [self.btnPerkTrait2 setImage:self.btnPerkTrait3.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnPerkTrait2 setTag:self.btnPerkTrait3.tag];
            [self.btnPerkTrait3 setTag:-1];
            
            [self.btnPerkTrait3 setHidden:YES];
            [self.btnPerkTrait2 setHidden:NO];
            
            tName = nil;
            stopTimer = YES;
        }
        
        
        if (self.lblTrait8Desc.text.length > 0 && self.lblTrait7Desc.text.length == 0){
            
            tName = [self.lblTrait8Desc text];
            
            [self.lblTrait7Desc setText:tName];
            [self.lblTrait7Desc setTag:self.lblTrait8Desc.tag];
            [self.lblTrait8Desc setTag:-1];
            [self.lblTrait8Desc setText:@""];
            
            [self.btnPerkTrait3 setImage:self.btnPerkTrait4.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnPerkTrait3 setTag:self.btnPerkTrait4.tag];
            [self.btnPerkTrait4 setTag:-1];
            
            [self.btnPerkTrait4 setHidden:YES];
            [self.btnPerkTrait3 setHidden:NO];
             
            stopTimer = YES;
            tName = nil;
        }
        
        
        
        if (self.lblTrait9Desc.text.length > 0 && self.lblTrait8Desc.text.length == 0){
            
            tName = [self.lblTrait9Desc text];
            
            [self.lblTrait8Desc setText:tName];
            [self.lblTrait8Desc setTag:self.lblTrait9Desc.tag];
            [self.lblTrait9Desc setTag:-1];
            [self.lblTrait9Desc setText:@""];
            
            [self.btnPerkTrait4 setImage:self.btnKillTracker1.currentImage
                                 forState:UIControlStateNormal];
            
            [self.btnPerkTrait4 setTag:self.btnKillTracker1.tag];
            [self.btnKillTracker1 setTag:-1];
            
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
