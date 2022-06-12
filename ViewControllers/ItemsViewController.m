//
//  ItemsViewController.m
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "ItemsViewController.h"
#import "NetworkAPISingleClient+Definition.h"
#import "NetworkAPISingleClient+LinkedProfiles.h"
#import "GuardianViewController.h"
#import "DataModels.h"
#import "Constants.h"
#import "ItemCellTableView.h"
#import "Utilities.h"
#import "INVDDisplayProperties.h"
#import "INVDResponse.h"
#import "WeaponsTableViewController.h"
#import "WeaponDetailsViewController.h"
#import "ArmorDetailsViewController.h"

@interface ItemsViewController ()
{
    AppDelegate *appDelegate;
    
    NSMutableDictionary *destItemData,
                        *destVaultData,
                        *instanceData,
                        *destCharData,
                        *bucketsData;
    
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
    
}
@end



@implementation ItemsViewController

@synthesize lblPlayerName = _lblPlayerName;
@synthesize lblPlayerMotto = _lblPlayerMotto;
@synthesize imgPlayerLogo = _imgPlayerLogo;
@synthesize imgItemScreenShot   = _imgItemScreenShot;
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *strClass  = nil,
             *strRace   = nil,
             *strGender = nil,
             *strLight  = nil;
    
    self->RowHeight = 90;
    self->HeaderHeight = 30;
    self->FooterHeight = 10;
    
    [self.lblItemDescription setText:@""];
    
    if (self.selectedCharEmblem){
    
        
        if (self.destChars){
            
            self->destCharData = [self.destChars objectForKey:self.selectedChar];
            
            if (self->destCharData){
                
                NSDictionary *chData = [self->destCharData objectForKey:@"character"];
                
                if (chData){
                    NSDictionary *cData = [chData objectForKey:@"data"];
                
                    if (cData){
                        NSString *classHash = [cData objectForKey:@"classHash"],
                                 *raceType = [cData objectForKey:@"raceType"],
                                 *genderHash = [cData objectForKey:@"genderHash"];
                                 
                        
                        strClass = [Utilities decodeClassHash:classHash];
                        
                        self->currentClass = strClass;
                        strRace  = [Utilities decodeRaceHash:raceType];
                        strGender = [Utilities decodeGenderHash:genderHash];
                        strLight  = [cData objectForKey:@"light"];
                    }
                }
            }
            
            
        }
        

        self->cImage = self.selectedCharEmblem;
        
        
        [self->cImage setFrame:CGRectMake(0, 0, self.tblItems.frame.size.width, 100)];
        
        CGRect  lblFrame = CGRectMake(50, -20, self.tblItems.frame.size.width, 80);
        
        UILabel *lblChar   = [[UILabel alloc] initWithFrame:lblFrame];
        [lblChar setTextAlignment:NSTextAlignmentLeft];
        [lblChar setFont:[UIFont fontWithName:kDefaultFontName size:22]];
        [lblChar setTextColor:[UIColor systemOrangeColor]];
        if (self.isVaultItems){
            [lblChar setText:@""];
        }
        else{
        [lblChar setText:[NSString stringWithFormat:@"%@//%@//%@//%@",strLight,strClass,strRace,strGender]];
        }
        
        [self->cImage addSubview:lblChar];
        
        [self.navigationItem setTitleView:self->cImage];
       
    }
    
    
    UIBarButtonItem *btnClose =  [[UIBarButtonItem alloc] init];
    
    
    if (btnClose){
        [btnClose setTitle:@"Close"];
        [btnClose setTarget:self];
        [btnClose setTintColor:[UIColor systemOrangeColor]];
        [btnClose setAction:@selector(closeAction)];
        
    }

    self.navigationItem.rightBarButtonItem = btnClose;
    
    appDelegate = [AppDelegate currentDelegate];
    
    [self registerNotifications];
    [self initTableView];
  
}


-(void) updateInstancedItemData:(int) bucketIndex
                 usingItemIndex:(int) itemIndex
             usingInstancedItem:(INSTBaseClass *) anyInstancedItem
               usingInstancedId:(NSString *) anyInstancedId {
    

    INSTBaseClass *instanceBase  = nil;
    
    BOOL hasUncommitedChanges = NO,
         performUpdates = NO,
          performMatch   = NO;
    
    
    NSIndexPath *cIndexPath = nil;
    
    @try {
        instanceBase = (INSTBaseClass *) anyInstancedItem ;
       
        hasUncommitedChanges = [self.tblItems hasUncommittedUpdates];
    
     
        
        if (!hasUncommitedChanges){
             
                NSIndexPath *iPath = [NSIndexPath indexPathForRow:itemIndex inSection:bucketIndex];
                
                if (iPath){
                    
                    cIndexPath = iPath;
                    
                    ItemCellTableView *Ocell = [self.tblItems cellForRowAtIndexPath:cIndexPath];
                    
                    if (Ocell){
                        
                        //Determine if cell has alreay been updated with item instance
                        if (Ocell.lblInstanceId.text.length == 0){
                            NSLog(@"ItemsViewController:updateInstancedItemData:Index[%d],InstanceId[%@] Not set:performUpdates = YES", itemIndex,anyInstancedId);
                            performUpdates = YES;
                        }
                        else{
                            
                            if ([Ocell.lblInstanceId.text isEqualToString:anyInstancedId]){
                                NSLog(@"ItemsViewController:updateInstancedItemData:Index[%d],InstanceId[%@]SET:performUpdates=NO", itemIndex,anyInstancedId);
                                performUpdates = NO;
                            }else{
                                performMatch = YES;
                                NSLog(@"ItemsViewController:Need to perform Match!");
                            }
                        }
                        
                    }
                }
    
        }
        else{
            
            NSLog(@"ItemsViewController:updateInstancedItemData:itemIndex [%d] returning to due hasUncommitedChanges", itemIndex);
            performUpdates = NO;
           // return;
        }
        
        if (performUpdates){
        
        [self.tblItems performBatchUpdates:^{
            
                if (instanceBase){
                    
                    ItemCellTableView *cell = [self.tblItems cellForRowAtIndexPath:cIndexPath];
                    
                    if (! cell.tag){
                        cell.tag = bucketIndex;
                    }
                    
                    NSLog(@"ItemsViewController:updateInstancedItemData:For IndexPath Section->[%d],Row->[%d]",cIndexPath.section, cIndexPath.row);
                
                    if (anyInstancedId){
                        if (! performMatch){
                            [cell.lblInstanceId setText:anyInstancedId];
                        }
                        
                        
                    }
                    
                
                    if (instanceBase){
                    
                        NSDictionary *response = (NSDictionary *)[instanceBase response];
                        
                        if (response){
                            
                            NSDictionary *instance = (NSDictionary*) [response objectForKey:@"instance"],
                                    *itemD    = (NSDictionary*) [response objectForKey:@"item"];
                            
                            if (performMatch){
                                
                                NSDictionary *iDD = (NSDictionary*) [itemD objectForKey:@"data"];
                                
                                if (iDD){
                                    
                                    NSString *iInstanceID = [iDD objectForKey:@"itemInstanceId"];
                                    
                                    if (![cell.lblInstanceId.text isEqualToString:iInstanceID] && [anyInstancedId isEqualToString:iInstanceID]){
                                        
                                        [cell.lblInstanceId setText:iInstanceID];
                                        
                                        NSLog(@"ItemsViewController:updateInstancedItemData:Udate to Match[%@] ",iInstanceID);
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            if (instance){
                                NSDictionary *data = (NSDictionary*) [instance objectForKey:@"data"];
                                
                                if (data){
                                    NSDictionary *pStat = (NSDictionary*) [data objectForKey:@"primaryStat"] ;
                                    
                                    if (pStat){
                                        NSObject *objValue =   [pStat objectForKey:@"value"];
                                        if (objValue){
                                            [cell.lblPowerLevel setText:[NSString stringWithFormat:@"%@",objValue]];
                                            [cell.lblPowerLevel setHidden:NO];
                                        }
                                    }
                                }
                            }
                        }
                    }
                
                }
   
        }
        completion:^(BOOL finished) {
            if (finished){
                
                NSArray<NSIndexPath *> *visibleIndexPaths = [self.tblItems indexPathsForVisibleRows];
                
                [self.tblItems reloadRowsAtIndexPaths:visibleIndexPaths
                                      withRowAnimation:UITableViewRowAnimationNone];
                
                NSLog(@"WItemsViewController:updateInstancedItemData:tblItems:performBatchUpdates:finished!");
            }
        }];
            
        }
        else{
            NSLog(@"ItemsViewController:updateInstancedItemData:tblItems has uncommited changes, waiting...");
        }
        
        
    } @catch (NSException *exception) {
        NSLog(@"ItemsViewController:updateInstancedItemData:Exception->%@",exception.description);
    } @finally {
        instanceBase = nil;
        hasUncommitedChanges = NO;
        performUpdates = NO;
    }
}

 
-(void) updateItemData:(NSIndexPath *) cIndexPath usingStaticBaseItem:(INVDDestinyInventoryBaseClass *) anyStaticItem
                                                  usingInstancedItem:(INSTBaseClass *) anyInstancedItem {
    
    INVDDestinyInventoryBaseClass *invItem  = anyStaticItem;
    
    INSTBaseClass *instanceBase = anyInstancedItem;
    
    BOOL hasUncommitedChanges = NO;
    
    @try {
        
        NSLog(@"ItemsViewController:updateStaticItemData:For IndexPath Section->[%d],Row->[%d]",cIndexPath.section, cIndexPath.row);
        
        hasUncommitedChanges = [self.tblItems hasUncommittedUpdates];
        
        if (! hasUncommitedChanges){
        
                [self.tblItems performBatchUpdates:^{
                 
                  //Update Static Item Data
                  if (invItem){
                      
                      ItemCellTableView *cell = [self.tblItems cellForRowAtIndexPath:cIndexPath];
                      
                      if (cell){
                          
                          if (! cell.tag){
                              cell.tag = cIndexPath.section ;
                          }
                          
                          INVDResponse *invResponse =  [[INVDResponse alloc] initWithDictionary: invItem.response ];
                          
                          if (invResponse){
                              
                            
                              NSString    *itemTypeName   = nil,
                                          *itemName       = nil,
                                          *itemDamageType = nil,
                                          *itemScreenShot = nil,
                                          *objDamageType  = nil;
                              
                              double t = 0;
                              int    i = 0;
                              
                              itemTypeName   =  [invResponse itemTypeDisplayName];
                              
                              itemScreenShot = [invResponse screenshot];
                              
                              if (itemTypeName){
                                  [cell.lblItemType setText:itemTypeName];
                              }
                              
                              if (itemScreenShot){
                                  [cell.lblMisc setText:itemScreenShot];
                                  
                                  /*if (cIndexPath.row == 0){
                                      
                                      if (!self.imgItemScreenShot.image){
                                          
                                          NSString *bURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,itemScreenShot];
                                          NSURL *ssURL= [[NSURL alloc] initWithString:bURL];
                                          
                                              if (ssURL){
                                                  
                                                  [self.imgItemScreenShot setImageWithURL:ssURL];
                                                  
                                                  [self.tblItems selectRowAtIndexPath:cIndexPath
                                                                             animated:NO
                                                                       scrollPosition:UITableViewScrollPositionNone];
                                              }
                                          
                                      }
                                  }*/
                              }
                              
                              t = [invResponse defaultDamageType];
                              i= (int) t;
                              
                              objDamageType =  [NSString stringWithFormat:@"%d",i];
                              
                              if (objDamageType){
                              
                                  itemDamageType = [Utilities decodeDamageType:objDamageType.intValue];
                              
                                  if (itemDamageType){
                                      [cell.lblDamageType setText:itemDamageType];
                                      
                                      if ([cell.lblDamageType.text isEqualToString:@"Arc"]){
                                          [cell.lblDamageType setTextColor:[UIColor cyanColor]];
                                      }
                                      if ([cell.lblDamageType.text isEqualToString:@"Solar"]){
                                          [cell.lblDamageType setTextColor:[UIColor systemYellowColor]];
                                      }
                                      if ([cell.lblDamageType.text isEqualToString:@"Void"]){
                                          [cell.lblDamageType setTextColor:[UIColor systemPurpleColor]];
                                      }
                                      if ([cell.lblDamageType.text isEqualToString:@"Stasis"]){
                                          [cell.lblDamageType setTextColor:[UIColor systemBlueColor]];
                                      }
                                  }
                              }
                              
                              INVDDisplayProperties *invDisplayProps = (INVDDisplayProperties* )invResponse.displayProperties;
                              
                              NSString *imageName     = nil,
                                       *baseURL       = nil,
                                       *emblem        = nil;
                              
                              NSURL    *imageURL      = nil,
                                       *emblemURL     = nil;
                              
                              
                              if (invDisplayProps){
                                  if (invDisplayProps.hasIcon){
                                      
                                      emblem =  invDisplayProps.icon;
                                      
                                      imageName = invResponse.iconWatermark;
                                      
                                      if (emblem){
                                          baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,emblem];
                                          emblemURL = [[NSURL alloc] initWithString:baseURL];
                                          if (emblemURL){
                                              [cell.imgItem setImageWithURL:emblemURL];
                                          }
                                      }
                                      
                                      if (imageName){
                                          baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
                                          imageURL = [[NSURL alloc] initWithString:baseURL];
                                          if (imageURL){
                                              [cell.imgCareer setImageWithURL:imageURL];
                                              [cell.imgCareer setAlpha:0.7];
                                          }
                                      }
                                      
                                  }
                                  
                                  itemName = [invDisplayProps name];
                                  [cell.lblItemName setText:itemName];
                              }
                              
                          }
                      }
                      
               
               }
                
                  //Update Instanced Item data
                  if (instanceBase){
                    
                    ItemCellTableView *cell = [self.tblItems cellForRowAtIndexPath:cIndexPath];
                    if (instanceBase){
                        
                        NSDictionary *response = (NSDictionary *)[instanceBase response];
                        
                        if (response){
                            
                            NSDictionary *instance = (NSDictionary*) [response objectForKey:@"instance"];
                            
                            if (instance){
                                NSDictionary *data = (NSDictionary*) [instance objectForKey:@"data"];
                                
                                if (data){
                                    NSDictionary *pStat = (NSDictionary*) [data objectForKey:@"primaryStat"] ;
                                    
                                    if (pStat){
                                        NSObject *objValue =   [pStat objectForKey:@"value"];
                                        if (objValue){
                                            [cell.lblPowerLevel setText:[NSString stringWithFormat:@"%@",objValue]];
                                        }
                                    }
                                }
                            }
                        }
                    }
                  }
                
                 
                }
              completion:^(BOOL finished) {
                    if (finished){
                        
                        NSArray<NSIndexPath *> *visibleIndexPaths = [self.tblItems indexPathsForVisibleRows];
                        
                        [self.tblItems reloadRowsAtIndexPaths:visibleIndexPaths
                                              withRowAnimation:UITableViewRowAnimationNone];
                        NSLog(@"ItemsViewController:updateStaticItemData:tblItems:performBatchUpdates:finished!");
                    }
               }];
    
        }else{
            NSLog(@"ItemsViewController:updateStaticItemData:tblItems has uncommited changes, waiting to be done...");
        }
            
      
    } @catch (NSException *exception) {
        NSLog(@"ItemsViewController:updateStaticItemData:Exception->%@",exception.description);
    } @finally {
        invItem = nil;
    }
    
}

-(void) updateStaticItemData:(int) bucketIndex usingitemIndex:(int) itemIndex usingStaticBaseItem:(INVDDestinyInventoryBaseClass *) anyStaticItem {
    
    INVDDestinyInventoryBaseClass *invItem  = anyStaticItem;
    
    BOOL hasUncommitedChanges = NO,
         performUpdates       = NO;
    
     
    @try {
        
        hasUncommitedChanges = [self.tblItems hasUncommittedUpdates];
                
        NSIndexPath *cIndexPath = nil;
       
        if (! hasUncommitedChanges){
             
                NSIndexPath *iPath = [NSIndexPath indexPathForRow:itemIndex inSection:bucketIndex];
                
                if (iPath){
                     cIndexPath = iPath;
                    
                     ItemCellTableView *Ocell = [self.tblItems cellForRowAtIndexPath:cIndexPath];
                    
                    if (Ocell){
                        
                        //Determine if cell has alreay been updated with item static harsh
                        if (Ocell.lblHash.text.length == 0){
                            NSLog(@"ItemsViewController:updateStaticItemData:Index[%d] Not set:performUpdates = YES", itemIndex);
                            performUpdates = YES;
                        }
                        else{
                            
                            INVDResponse *invResponse =  [[INVDResponse alloc] initWithDictionary: invItem.response ];
                            
                            NSString *strHashKey  = nil;
                            
                            if (invResponse){
                                NSNumber *objHash = [NSNumber numberWithDouble:[invResponse hash]];
                                
                                if (objHash){
                                    strHashKey = [objHash stringValue];
                                }
                            }
                            
                            if ([Ocell.lblHash.text isEqualToString:strHashKey]){
                                NSLog(@"ItemsViewController:updateStaticItemData:Index[%d] Harsh[%@]:Set:performUpdates = NO", itemIndex,strHashKey);
                                performUpdates = NO;
                            }
                        }
                        
                    }
                 }
                
            if (hasUncommitedChanges){
                NSLog(@"updateStaticItemData:For IndexPath Section->[%d],Row->[%d] returning due to hasUncommitedChanges",cIndexPath.section, cIndexPath.row);
                
                return;
            }
 
            [self.tblItems performBatchUpdates:^{
                
                if (invItem){
                    
                    ItemCellTableView *cell = [self.tblItems cellForRowAtIndexPath:cIndexPath];
                    if (cell){
                        
                        INVDResponse *invResponse =  [[INVDResponse alloc] initWithDictionary: invItem.response ];
                        
                        if (! cell.tag){
                            [cell setTag:cIndexPath.section];
                        }
                        
                        if (invResponse){
                        
                            NSString    *itemTypeName   = nil,
                                        *itemName       = nil,
                                        *itemDamageType = nil,
                                        *itemScreenShot = nil,
                                        *objDamageType  = nil,
                                        *strHashKey     = nil,
                                        *strCharacterId = nil;
                            
                            double t = 0;
                            int    i = 0;
                            
                            
                            NSNumber *objHash = [NSNumber numberWithDouble:[invResponse hash]];
                            
                            if (self.selectedChar){
                                strCharacterId = self.selectedChar;
                                [cell.lblCharacterId setText:strCharacterId];
                            }
                            
                            if (invItem.message){
                                
                                switch([invItem.message integerValue]){
                                    case 0:
                                        [cell.btnLockAction setImage:[UIImage systemImageNamed:@"lock.open"] forState:UIControlStateNormal];
                                        break;
                                    case 1:
                                        [cell.btnLockAction setImage:[UIImage systemImageNamed:@"lock"] forState:UIControlStateNormal];
                                        break;
                                }
                            }
                            
                            if (cell.lblHash.text.length == 0){
                                strHashKey = [objHash stringValue];
                                [cell.lblHash setText:strHashKey];
                                NSLog(@"updateStaticItemData:Setting Harsh[%@] For IndexPath Section->[%d],Row->[%d]",strHashKey,cIndexPath.section, cIndexPath.row);
                            }
                            
                            itemTypeName   =  [invResponse itemTypeDisplayName];
                            
                            itemScreenShot = [invResponse screenshot];
                            
                            if (itemTypeName){
                                [cell.lblItemType setText:itemTypeName];
                            }
                            
                            if (itemScreenShot){
                                [cell.lblMisc setText:itemScreenShot];
                                
                               /* if (cIndexPath.row == 0){
                                    
                                    if (!self.imgItemScreenShot.image){
                                        
                                        NSString *bURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,itemScreenShot];
                                        NSURL *ssURL= [[NSURL alloc] initWithString:bURL];
                                        
                                            if (ssURL){
                                                
                                                [self.imgItemScreenShot setImageWithURL:ssURL];
                                                
                                                [self.tblItems selectRowAtIndexPath:cIndexPath
                                                                            animated:NO
                                                                    scrollPosition:UITableViewScrollPositionNone];
                                            }
                                        
                                    }
                                }*/
                            }
                            
                            t = [invResponse defaultDamageType];
                            i= (int) t;
                            
                            objDamageType =  [NSString stringWithFormat:@"%d",i];
                            
                            if (objDamageType){
                            
                                itemDamageType = [Utilities decodeDamageType:objDamageType.intValue];
                            
                                if (itemDamageType){
                                    [cell.lblDamageType setText:itemDamageType];
                                    
                                    if ([cell.lblDamageType.text isEqualToString:@"Arc"]){
                                        [cell.lblDamageType setTextColor:[UIColor cyanColor]];
                                    }
                                    if ([cell.lblDamageType.text isEqualToString:@"Solar"]){
                                        [cell.lblDamageType setTextColor:[UIColor systemYellowColor]];
                                    }
                                    if ([cell.lblDamageType.text isEqualToString:@"Void"]){
                                        [cell.lblDamageType setTextColor:[UIColor systemPurpleColor]];
                                    }
                                    if ([cell.lblDamageType.text isEqualToString:@"Stasis"]){
                                        [cell.lblDamageType setTextColor:[UIColor systemBlueColor]];
                                    }
                                    
                                    if ([itemDamageType isEqualToString:@"None"]){
                                        [cell.lblDamageType setText:@""];
                                    }
                                }
                            }
                            
                            INVDDisplayProperties *invDisplayProps = (INVDDisplayProperties* )invResponse.displayProperties;
                            
                            NSString *imageName     = nil,
                                    *baseURL       = nil,
                                    *emblem        = nil;
                            
                            NSURL    *imageURL      = nil,
                                    *emblemURL     = nil;
                            
                            if (invDisplayProps){
                                if (invDisplayProps.hasIcon){
                                    
                                    emblem =  invDisplayProps.icon;
                                    
                                    imageName = invResponse.iconWatermark;
                                    
                                    if (emblem){
                                        baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,emblem];
                                        emblemURL = [[NSURL alloc] initWithString:baseURL];
                                        if (emblemURL){
                                            [cell.imgItem setImageWithURL:emblemURL];
                                        }
                                    }
                                    
                                    if (imageName){
                                        baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
                                        imageURL = [[NSURL alloc] initWithString:baseURL];
                                        if (imageURL){
                                            [cell.imgCareer setImageWithURL:imageURL];
                                            [cell.imgCareer setAlpha:0.7];
                                        }
                                    }
                                    
                                }
                                
                                itemName = [invDisplayProps name];
                                [cell.lblItemName setText:itemName];
                            }
                            
                        }
                    }
                    
            
            }
        
            
            }
            completion:^(BOOL finished) {
                
               
                        if (finished){
                            NSArray<NSIndexPath *> *visibleIndexPaths = [self.tblItems indexPathsForVisibleRows];
                            
                            [self.tblItems reloadRowsAtIndexPaths:visibleIndexPaths
                                                  withRowAnimation:UITableViewRowAnimationNone];
                            
                            NSLog(@"WItemsViewController:updateStaticItemData:tblItems:performBatchUpdates:finished!");
                        }
                        
           
               }];
    
        }else{
            NSLog(@"ItemsViewController:updateStaticItemData:tblItems has uncommited changes, waiting to be done...");
        }
            
      
    } @catch (NSException *exception) {
        NSLog(@"ItemsViewController:updateStaticItemData:Exception->%@",exception.description);
    } @finally {
        invItem = nil;
    }
    
}
    
 
    
-(void) registerNotifications{

    NSLog(@"1:ItemsViewController:registerNotifications...");
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedStaticItemNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        
        NSIndexPath *currentIndexPath = nil;
        
        NSString *strHashKey    = nil,
                 *strIdx        = nil,
                 *strLocked     = nil,
                 *strClassName  = nil;
        
        BOOL performUpdate = NO;
        
        INVDDestinyInventoryBaseClass *invItem  = nil;
        
        NSDictionary *userInfo = nil;
        
        ItemCellTableView *cell = nil;
        
        int
            currentSection = 1,
            currentIndex   = -1;
        
        @try {
            
            invItem  = (INVDDestinyInventoryBaseClass*) [note object];
            
            userInfo = [note userInfo];
            
            if (userInfo){
                strHashKey = [userInfo objectForKey:@"itemHashKey"];
                
                currentIndexPath = [userInfo objectForKey:@"CurrentIndexPath"];
                
                strIdx  =  [userInfo objectForKey:@"CurrentIndex"];
                
                cell =  [userInfo objectForKey: @"CurrentCell"];
                
                strLocked = [userInfo objectForKey: @"LockState"];
                
                strClassName = [userInfo objectForKey:@"ClassName"];
                
                if (strLocked){
                    [invItem setMessage:strLocked];
                }
                
                if (currentIndexPath){
                    currentSection = currentIndexPath.section;
                }
    
            }
            
            if (strHashKey != nil && invItem != nil){
                performUpdate = YES;
                
                currentIndex = [strIdx intValue];
            }
             
            if (performUpdate){
               
                if (! [appDelegate.destinyInventoryItemDefinitions.allKeys containsObject:strHashKey] ){
                    
                    if (invItem){
                        
                        INVDResponse *itemResponse = [[INVDResponse alloc] initWithDictionary:[invItem response]];
                        
                        
                        if (itemResponse){
                            [appDelegate.destinyInventoryItemDefinitions setValue:itemResponse forKey:strHashKey];
                            
                            [self updateStaticItemData:currentSection
                                        usingitemIndex:currentIndex
                                   usingStaticBaseItem:invItem];
                            
                        }
                        
                    }
                    
                    
                    
                }
                
            }
            
            
        } @catch (NSException *exception) {
            NSLog(@"ItemsViewController:kDestinyLoadedStaticItemNotification:Exception->%@",exception.description);
        } @finally {
            
            currentIndexPath = nil;
            
            strHashKey    = nil;
            
            performUpdate = NO;
            
            invItem  = nil;
            
            userInfo = nil;
            
        }
        
        
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedInstancedItemNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        
        NSMutableDictionary *cData = nil;
        
        NSDictionary *userInfo = nil;
        
        NSIndexPath *currentIndexPath = nil;
        
        NSString *strHashKey     = nil,
                 *strInstanceKey = nil,
                 *strIdx         = nil,
                 *strClassName   = nil,
                 *strSection     = nil;
        
        INSTBaseClass *instanceBase = nil;
        
        BOOL performUpdate = NO;
        
        ItemCellTableView *cell = nil;
        
        int currentBucketIndex = -1,
            currentIndex       = -1;
        
        @try {
            
            cData = (NSMutableDictionary*) [note object];
            
            userInfo = [note userInfo];
            
            if (userInfo){
                strHashKey = [userInfo objectForKey:@"itemHashKey"];
                strInstanceKey = [userInfo objectForKey:@"itemInstanceId"];
                currentIndexPath = [userInfo objectForKey:@"CurrentIndexPath"];
                strIdx  =  [userInfo objectForKey:@"CurrentIndex"];
                strSection = [userInfo objectForKey:@"CurrentSection"];
                cell =  [userInfo objectForKey: @"CurrentCell"];
                strClassName = [userInfo objectForKey:@"ClassName"];
                
                if (currentIndexPath){
                    currentBucketIndex = currentIndexPath.section;
                    currentIndex = currentIndexPath.row;
                }
            }
            
            if (strHashKey != nil && strInstanceKey != nil && cData != nil){
                performUpdate = YES;
                
                currentIndex = [strIdx intValue];
                currentBucketIndex = [strSection intValue];
            }
            
            if (performUpdate){
                
                instanceBase  = (INSTBaseClass*) cData;
                
                if (! self->instanceData){
                    self->instanceData = [[NSMutableDictionary alloc] init];
                }
                
                if (! [self->instanceData.allKeys containsObject:strHashKey]){
                    
                    NSLog(@"ItemsViewController:kDestinyLoadedInstancedItemNotification:Adding->%@ to instanceData...",strHashKey);
                    [self->instanceData setValue:instanceBase forKey:strHashKey];
                    [self updateInstancedItemData:currentBucketIndex
                                   usingItemIndex:currentIndex
                               usingInstancedItem:instanceBase
                                 usingInstancedId:strInstanceKey];
                }
                 else{
                    
                     
                     if ([strClassName isEqualToString:@"ItemsViewController"]){
                         NSLog(@"ItemsViewController:kDestinyLoadedInstancedItemNotification:Refreshing UI [%@] For Data on [%d] Index",strHashKey,currentIndex);
                         
                        // [self->destItemData setValue:instanceBase forKey:strHashKey];
                         
                         [self updateInstancedItemData:currentBucketIndex
                                        usingItemIndex:currentIndex
                                    usingInstancedItem:instanceBase
                                      usingInstancedId:strInstanceKey];
                     }
                        
                 }
                
                
            }
            
            
        } @catch (NSException *exception) {
            NSLog(@"ItemsViewController:kDestinyLoadedInstancedItemNotification:Exception->%@",exception.description);
        } @finally {
            
            cData = nil;
            
            userInfo = nil;
            
            currentIndexPath = nil;
            
            strHashKey     = nil;
            strInstanceKey = nil;
            
            instanceBase = nil;
            
            performUpdate = NO;
        }
        
    }];
    
}

-(void) refreshItems:(NSString *) itemHash{
 
    
    NSArray<NSIndexPath*> *deletedRows  = nil;
    
    NSIndexPath *selectedRow = nil;
    
    NSString
            *weaponHashFilter = nil,
            *bucketHashFilter = nil,
            *primaryBucketKey = nil,
            *energyBucketKey  = nil,
            *heavyBucketKey   = nil,
            *ghostBucketKey   = nil,
            *artBucketKey     = nil;
    
    NSPredicate *bPredicate = nil;
    
    NSArray *primaryFilteredResult = nil,
            *energyFilteredResult  = nil,
            *heavyFilteredResult   = nil,
            *ghostFilteredResult   = nil,
            *artFilteredResult     = nil;
 
    @try {
        
        //self->itemBuckets = [cBucketDef copy];
       // self->destItemData = [cBucket copy];
          
        
 
        [self->destItemData removeObjectForKey:itemHash];
     
        selectedRow  =  [self.tblItems indexPathForSelectedRow];
        
        if (selectedRow){
         
          deletedRows = [[NSArray<NSIndexPath*> alloc] initWithObjects:selectedRow, nil];
            
         //Need to remove table cell
         
            [self.tblItems beginUpdates];
            
            NSLog(@"ItemsViewController:refreshItems:Removing Actioned Item from UI");
            
            [self.tblItems deleteRowsAtIndexPaths:deletedRows
                               withRowAnimation:UITableViewRowAnimationFade];
            
            [self.tblItems endUpdates];
            [self.tblItems reloadData];
        
          NSLog(@"ItemsViewController:refreshItems:finished!");
        }
        
        
        
    } @catch (NSException *exception) {
        NSLog(@"ItemsViewController:refreshItems::Exception->%@",exception.description);
    } @finally {
        selectedRow = nil;
        deletedRows = nil;
    }
}



-(void) loadVaultItems{
 
    NSString *message   = @"3:ItemsViewController:loadVaultItems:Invoked by GuardianViewController...",
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
        isLostItems = NO;
        isVaultItems = YES;
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
            
            self->itemBuckets = [vArray copy];
            self->destItemData = [vData copy];
            
            for(int idx = 0 ;idx < vArray.count; idx ++){
                    
                NSString *vKey = [vArray objectAtIndex:idx];
                
                INVCItems *cFItem = (INVCItems *) [vData objectForKey:vKey];
            
                int fIdx = [vData.allKeys indexOfObject:cFItem];
                
                if (cFItem){
                    

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

-(void) loadInventories{
    
    NSString *message   = @"3:ItemsViewController:loadInventories:Invoked by GuardianViewController...",
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
        isLostItems = NO;
        isVaultItems = NO;
        isInventoryItems = YES;
        
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
                
                NSString *bucketFilter = [NSString stringWithFormat:@"%@",sectionKey];
               
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
                                    NSLog(@"ItemsViewController:loadInventories:APICall to getInstancedItem:For->%@",strHashKey);
                                    
                                    [NetworkAPISingleClient getInstancedItem:strInstanceId completionBlock:^(NSArray *values){
                                            
                                        if (values){
                                            
                                            INSTBaseClass *instanceBase = (INSTBaseClass*) [values firstObject];
                                                    
                                            NSString *strIDX = [NSString stringWithFormat:@"%d",fIdx],
                                                     *strSDX = [NSString stringWithFormat:@"%d",idx];
                                                
                                            NSDictionary *callerInfo = [[NSDictionary alloc]
                                                            initWithObjectsAndKeys:@"ItemsViewController",@"ClassName",
                                                                                    @"loadInventories",@"MethodName",
                                                                                    strIDX,@"CurrentIndex",
                                                                                    strSDX,@"CurrentSection",
                                                                                    strHashKey, @"itemHashKey",
                                                                                    strInstanceId, @"itemInstanceId",nil];
                                                    
                                            [[NSNotificationCenter defaultCenter]
                                                postNotificationName:kDestinyLoadedInstancedItemNotification
                                                                object:instanceBase
                                                            userInfo:callerInfo];
                                                    
                                      NSLog(@"ItemsViewController:loadInventories:kDestinyLoadedInstancedItemNotification:Raised->%@",strHashKey);
                                                
                                                
                                     }
                                                
                                    }
                                    andErrorBlock:^(NSError *exception){
                                     NSLog(@"ItemsViewController:loadInventories:getInstancedItem:Exception->%@",exception.description);
                                     }];
                                    
                                }
                            }
                            
                        }
                        
                    }
                    
                    self->itemBuckets = [cBucketDef copy];
                    self->destItemData = [cBucket copy];
                }
                 
            }
            
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
    NSLog(@"Profile Timer Stopped");
    self.timer = nil;
}


-(void) startTimer{
    

    double interval = 5;
    
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]
                                              interval:interval target:self
                                              selector:@selector(timerFireMethod:)
                                              userInfo:nil
                                               repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
    
        [self.loop addTimer:self.timer forMode:NSDefaultRunLoopMode];
 
    
}




- (void)timerFireMethod:(NSTimer *)t{
    
    NSString *message         = @"";
    
    @try {
        
            
       //TODO:something
            
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
       
        
    }
    
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    WeaponDetailsViewController *weaponsDetailsVC = nil;
    ArmorDetailsViewController  *armorDetailsVC = nil;
    
    ItemCellTableView *selectedCell = nil;
    
    INSTBaseClass *itemResponse = nil;
    
    NSString *weaponKey   = nil,
             *compareKey  = nil,
             *instanceKey = nil;
    
    @try {
        
     
        selectedCell = (ItemCellTableView*) sender;
        
        if (selectedCell){
            
            weaponKey = selectedCell.lblHash.text;
            instanceKey = selectedCell.lblInstanceId.text;
            
            if (instanceKey.length == 0){
                instanceKey = [self resolveItemInstanceId:weaponKey
                                       withItemCollection:self->destItemData];
                
                if (instanceKey.length > 0){
                    [selectedCell.lblInstanceId setText:instanceKey];
                }
            }
            
            if (weaponKey){
                
                
                compareKey = [self resolveItemInstanceId:weaponKey
                                     withItemCollection:self->destItemData];
                
                if (![instanceKey isEqualToString:compareKey] ){
                    NSLog(@"ItemsVC:prepareForSegue:Setting MatchFrom=%@, To=%@",instanceKey,compareKey);
                    [selectedCell.lblInstanceId setText:compareKey];
                    
                }
                
                
                itemResponse =  (INSTBaseClass*) [self->instanceData objectForKey:weaponKey];
                
                if (! itemResponse){
                    
                    NSIndexPath *indexPath  =   [self.tblItems indexPathForCell:selectedCell];
                    NSString *itemKey = nil,
                             *bkey    = nil;
                    
                    if (indexPath){
                        
                       bkey =  [self->itemBuckets objectAtIndex:indexPath.section];
                        
                        itemKey = [NSString stringWithFormat:@"%@_%@",bkey, weaponKey];
                        
                        itemResponse =  (INSTBaseClass*) [self->destItemData objectForKey:itemKey];
                        
                    }
                    
                  
                    
                }
                
                
            }
        }
        
        if ([segue.destinationViewController isKindOfClass:[ArmorDetailsViewController class]]){
            armorDetailsVC = (ArmorDetailsViewController*) segue.destinationViewController;
            
            if (itemResponse){
                
                [armorDetailsVC loadArmorDetail:itemResponse
                            withArmorCell:selectedCell
                            charactersData:self.destChars];
                
            }
            
        }
      
        if ([segue.destinationViewController isKindOfClass:[WeaponDetailsViewController class]]){
            weaponsDetailsVC = (WeaponDetailsViewController *) segue.destinationViewController;
            
            if (itemResponse){
                
                [weaponsDetailsVC loadWeaponDetail:itemResponse
                            withWeaponCell:selectedCell
                            charactersData:self.destChars];
                
            }
        }
        
        
   
        
    } @catch (NSException *exception) {
        NSLog(@"ItemsVC:prepareForSegue:Exception=%@",exception.description);
    } @finally {
        armorDetailsVC = nil;
        weaponsDetailsVC = nil;
        selectedCell = nil;
        
        itemResponse = nil;
        weaponKey   = nil;
        instanceKey = nil;
    }
    
}


-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ItemCellTableView *selectedCell = (ItemCellTableView*) [tableView cellForRowAtIndexPath:indexPath];
    
    [selectedCell.layer setMasksToBounds:NO];
    [selectedCell.layer setCornerRadius:0];
    [selectedCell.layer setBorderWidth:1];
    [selectedCell.layer setShadowOffset: CGSizeMake(0, 0)];
    [selectedCell.layer setBorderColor:[UIColor clearColor].CGColor];
    
}

 
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *selectedTitle        = nil,
             *selectedScreenShot   = nil,
             *selectedItemHash     = nil,
             *selectedItemInstance = nil,
             *selectedDescription  = nil,
             *strHashKey           = nil,
             *strInstanceKey       = nil,
             *strBucketKey         = nil;
    
    ItemCellTableView *selectedCell = nil;
    
    @try {
        
        selectedCell = (ItemCellTableView*) [tableView cellForRowAtIndexPath:indexPath];
        
        if(selectedCell){
            
            strHashKey     = [selectedCell.lblHash text];
            strInstanceKey = [selectedCell.lblInstanceId text];
            
            if (strInstanceKey.length == 0){
                strInstanceKey = [self resolveItemInstanceId:strHashKey
                                          withItemCollection:self->destItemData];
                
                if (strInstanceKey.length > 0){
                    
                    [selectedCell.lblInstanceId setText:strInstanceKey];
                }
                
            }
            
            
            selectedTitle = selectedCell.lblItemName.text;
            
            [self.navigationItem setTitle:selectedTitle];
            
            selectedScreenShot = [selectedCell.lblMisc text];
            
            selectedItemHash = [selectedCell.lblHash text];
            
            selectedItemInstance = [selectedCell.lblInstanceId text];
            
            selectedDescription = [selectedCell.lblItemType text];
            
            if ([selectedScreenShot length] > 0){
                 
                 [self.lblItemDescription setText:@""];
                
                  NSString *baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,selectedScreenShot];
                  NSURL *ssURL= [[NSURL alloc] initWithString:baseURL];
                
                    if (ssURL){
                        [self.imgItemScreenShot setImageWithURL:ssURL];
                    }
                
              
            }
            else{
                if (selectedDescription){
                    
                    [self.imgItemScreenShot setImage:nil];
                    
                    if (![selectedTitle isEqualToString:selectedDescription]){
                      [self.lblItemDescription setText:selectedDescription];
                    }
                }
            }
            
            
            if(selectedCell && (selectedCell.layer.borderColor != [UIColor systemOrangeColor].CGColor) ){
                
         
                [selectedCell.layer setBorderWidth:3];
                [selectedCell.layer setShadowOffset: CGSizeMake(-1, 1)];
                [selectedCell.layer setBorderColor:[UIColor systemOrangeColor].CGColor];
                
                if (!self.segCategories.isEnabled){
                    [self.segCategories setEnabled:YES];
                    [self.segCategories setTintColor:[UIColor whiteColor]];
                    [self.segCategories setHighlighted:YES];
                }
                
                
                
            }
            
            NSLog(@"ItemsVC:didSelectRow=%@ Section->[%d],Row->[%d],Static Hash->[%@],Instance->[%@]",
                  selectedCell.lblItemName.text, indexPath.section,indexPath.row,selectedItemHash,selectedItemInstance);
            
            
                
              strBucketKey =   [self->itemBuckets
                 objectAtIndex:indexPath.section];
         
              
            if ([strBucketKey isEqualToString:@"1498876634"] ||
                [strBucketKey isEqualToString:@"2465295065"] ||
                [strBucketKey isEqualToString:@"953998645"] ){
                //Weapons:Kinetic, Energy, Power
                
                NSLog(@"ItemsVC:didSelectRowAtIndexPath:Weapons->%@",strBucketKey);
                [self performSegueWithIdentifier:@"segInvWeaponDetail"
                                          sender:selectedCell];
                
            }
            
            
          if ([strBucketKey isEqualToString:@"3448274439"] ||
              [strBucketKey isEqualToString:@"3551918588"] ||
              [strBucketKey isEqualToString:@"14239492"] ||
              [strBucketKey isEqualToString:@"20886954"] ||
              [strBucketKey isEqualToString:@"1585787867"]){
              //Armor: //Helmet,Gauntlets,Chest ,Legs, Class
              NSLog(@"ItemsVC:didSelectRowAtIndexPath:Armor->%@",strBucketKey);
              [self performSegueWithIdentifier:@"segInvArmorDetail"
                                        sender:selectedCell];
          }
            
            
          if ([strBucketKey isEqualToString:@"375726501"]  ||
              [strBucketKey isEqualToString:@"4023194814"] ||
              [strBucketKey isEqualToString:@"1506418338"] ||
              [strBucketKey isEqualToString:@"2025709351"] ||
              [strBucketKey isEqualToString:@"1585787867"] ||
              [strBucketKey isEqualToString:@"4274335291"] ||
              [strBucketKey isEqualToString:@"284967655"]  ||
              [strBucketKey isEqualToString:@"4292445962"] ||
              [strBucketKey isEqualToString:@"3683254069"]){
              //General:  //Engrams, Ghosts, Artifact, Vehicle,Clan Banner,Ships, Finishers, Emblems
              NSLog(@"ItemsVC:didSelectRowAtIndexPath:General->%@",strBucketKey);
          }
 
            
          if ([strBucketKey isEqualToString:@"1469714392"] ||
              [strBucketKey isEqualToString:@"3313201758"] ||
              [strBucketKey isEqualToString:@"3054419239"]){
              //INventory:Consumables, Mofifications,Emotes
              NSLog(@"ItemsVC:didSelectRowAtIndexPath:Inventory->%@",strBucketKey);
          }
            
            if ([strBucketKey isEqualToString:@"138197802"] ){
                //Vault:General
                NSLog(@"ItemsVC:didSelectRowAtIndexPath:Vault:General->%@",strBucketKey);
            }
              
   
              if ([strBucketKey containsString:@"215593132"] ||
                  [strBucketKey containsString:@"3161908920"] ||
                  [strBucketKey containsString:@"1367666825"]){
                  //Postmaster: ////Lost Items, messages, special orders
                  NSLog(@"ItemsVC:didSelectRowAtIndexPath:Postmaster->%@",strBucketKey);
              }
              
            
         }
         
    }
    @catch (NSException *exception) {
        NSLog(@"ItemsViewController:tableView:didSelectRowAtIndexPath:Exception->%@",exception.description);
    }
    @finally {
        
        selectedTitle      = nil;
        selectedScreenShot = nil;
        selectedItemHash   = nil;
        selectedItemInstance = nil;
        
        selectedCell = nil;
    }
    
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        NSInteger size = self->RowHeight;
        
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
 
    NSInteger size = 2.0f;//90;
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSInteger size = self->HeaderHeight;
    
    return size;
}

-(NSString *) resolveItemInstanceId:(NSString *) staticKey withItemCollection:(NSMutableDictionary *) anyCollection{
    
    
    NSString *charFilter =  nil,
             *strInstanceHashKey = nil;
   
    NSPredicate *bPredicate = nil;
  
    NSArray *filteredItems = nil;
    
    NSArray<NSDictionary *> *fItems =   nil;
    
    NSMutableDictionary *filteredCharWeaponsData = nil;
    
    INVCItems* fObject  = nil;
    
    @try {
        
          charFilter = [NSString stringWithFormat:@"%@", staticKey];
       
          bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",charFilter];
      
          filteredItems = [anyCollection.allKeys filteredArrayUsingPredicate:bPredicate];
        
          fItems =   [anyCollection objectsForKeys:filteredItems notFoundMarker:anyCollection];
        
          filteredCharWeaponsData = [[NSMutableDictionary alloc] initWithCapacity:fItems.count];
        
        if (filteredItems.count == 1){
            
            filteredCharWeaponsData = (NSMutableDictionary*) [fItems firstObject];
            
            if (filteredCharWeaponsData){
             
                fObject  = (INVCItems*) filteredCharWeaponsData;
                
                if (fObject){
                
                    strInstanceHashKey = [fObject itemInstanceId];
                     
                    NSLog(@"ItemsVC:resolveItemInstanceId:For StaticHash=[%@] with InstanceHash=[%@]",staticKey,strInstanceHashKey);
                }
            }
        }
        
        
    } @catch (NSException *exception) {
        NSLog(@"ItemsVC:resolveItemInstanceId:Exception=%@",exception.description);
    } @finally {
        
        charFilter =  nil;
        bPredicate = nil;
        filteredItems = nil;
        fItems =   nil;
        filteredCharWeaponsData = nil;
        fObject  = nil;
        
    }
    return strInstanceHashKey;
}



-(void) handleLongPress:(UILongPressGestureRecognizer *) recognize{
    
    //NSLog(@"ItemsViewController:handleLongPress:Invoked...");
    
    ItemCellTableView *cCell = nil;
    
    BOOL processRequest = NO;
    @try {
        
        
        switch(recognize.state){
            case UIGestureRecognizerStateEnded:
                NSLog(@"ItemsViewController:UIGestureRecognizerStateEnded:Detected...");
                break;
            case UIGestureRecognizerStateBegan:
                NSLog(@"ItemsViewController:UIGestureRecognizerStateBegan:Detected...");
                processRequest = YES;
                break;
            case UIGestureRecognizerStateChanged:
                NSLog(@"ItemsViewController:UIGestureRecognizerStateChanged:Detected...");
                break;
            case UIGestureRecognizerStateCancelled:
                NSLog(@"ItemsViewController:UIGestureRecognizerStateCancelled:Detected...");
                break;
            case UIGestureRecognizerStatePossible:
                NSLog(@"ItemsViewController:UIGestureRecognizerStatePossible:Detected...");
                break;
            case UIGestureRecognizerStateFailed:
                NSLog(@"ItemsViewController:UIGestureRecognizerStateFailed:Detected...");
                break;
        }
        
       
        
        if (processRequest){
            
            NSIndexPath *selectedIndexPath = [self.tblItems indexPathForSelectedRow];
            
            if (selectedIndexPath){
            
                cCell = (ItemCellTableView*) [self.tblItems cellForRowAtIndexPath:selectedIndexPath];
               
                NSString
                        *strCharKey  = [cCell.lblCharacterId text],
                        *strStaticKey = [cCell.lblHash text],
                        *strHashKey = [cCell.lblInstanceId text];
                
                if (cCell){
                    

                        
                NSLog(@"handleLongPress:For %@ IndexPath Section->[%d],Row->[%d]",strHashKey,selectedIndexPath.section, selectedIndexPath.row);
                
                    if ([strHashKey length] == 0){
                        
                        strHashKey =  [self resolveItemInstanceId:strStaticKey
                                               withItemCollection:self->destItemData];
                        
                        [cCell.lblInstanceId setTag:strHashKey];
                       
                    }
                    
                    if (self->isLostItems){
                      [cCell pullFromPostMaster:cCell];
                    }
                    
                    if (self->isInventoryItems){
                         [cCell pullFromVaultAction:self.destChars];
                    }
                    
                    if (self->isGeneralItems){
                         [cCell transferItemAction:self.destChars];
                    }
                    
               }
               
            }
            
        }
        
    } @catch (NSException *exception) {
        NSLog(@"WeaponsTableViewController:handleLongPress:Exception->%@",exception.description);
    } @finally {
         cCell = nil;
        
         processRequest = NO;
    }
    
    

}

-(void) initTableView{
    
    NSString *message =  @"2:ItemsViewController:initTableView...";
    @try {
        
        
        if (! self.tblItems){
            self.tblItems = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, self.imgItemScreenShot.frame.size.height,
                                                                          self.view.frame.size.width, self.view.frame.size.height)];
            
            self.tblItems.contentInset = UIEdgeInsetsMake(0, self.imgItemScreenShot.frame.size.height, self.view.frame.size.height-20, 0);
            
            [self.view addSubview:self.tblItems];
        }
        
        [self.tblItems registerNib:[UINib nibWithNibName:@"ItemCellTableView"
                                                  bundle:nil]
            forCellReuseIdentifier:@"ItemCellTableView"];
         
        
        [self.tblItems setDelegate:self];
        [self.tblItems setDataSource:self];
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        
        longPress.minimumPressDuration = 2.0;
        [self.tblItems addGestureRecognizer:longPress];
        
      }
        @catch (NSException *exception) {
            message = [exception description];
        }
        @finally {
            
            if ([message length] > 0){
                NSLog(@"%@",message);
            }
           
            message =  @"";
            
        }
    
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title = @"Equipped Inventory";
    
    NSInteger defaultTotal = 10;
  
    if (self.destEquippedItemsBuckets){
        
       NSString *sectionKey = [self.destEquippedItemsBuckets objectAtIndex:section];
        
        if (sectionKey){
            
            if ( appDelegate.destinyInventoryBucketDefinitions){
            
                DestinyInventoryBucketDefinition *ibucDef = [appDelegate.destinyInventoryBucketDefinitions objectForKey:sectionKey];
                
                if (ibucDef){
                    
                    
                    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",sectionKey];
                    
                    NSArray *filteredItems = [self->destItemData.allKeys filteredArrayUsingPredicate:bPredicate];
                    
                    BCKDisplayProperties *dispProps = (BCKDisplayProperties*) [ibucDef displayProperties];
                    if (dispProps){
                        
                        if ([dispProps.name isEqualToString:@"Lost Items"] || [dispProps.name isEqualToString:@"Messages"] ||
                            [dispProps.name isEqualToString:@"Special Orders"]){
                            defaultTotal = 20;
                        }
                        
                        if ([dispProps.name isEqualToString:@"Consumables"] || [dispProps.name isEqualToString:@"Modifications"]){
                            defaultTotal = 50;
                        }
                        
                        if ([dispProps.name isEqualToString:@"Quests"]){
                            defaultTotal = 60;
                        }
                        
                        if ([dispProps.name containsString:@"Weapons"]){
                            defaultTotal = 60;
                        }
                        
                        if (self.isVaultItems){
                            title = [NSString stringWithFormat:@"%@: [%lu]",dispProps.name,(unsigned long)filteredItems.count];
                        }else{
                        title = [NSString stringWithFormat:@"%@->%@: [%lu/%d]",self->currentClass,dispProps.name,(unsigned long)filteredItems.count,defaultTotal];
                        }
                    }
                }
            
           }
        
      }
    }
    
     
    
    return title;
}
 
 
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSString *message   = nil;
    static NSString *cellId = @"ItemCellTableView";
    ItemCellTableView *gCell = nil;
    @try {
        
        
        gCell = (ItemCellTableView*) [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        
        if (gCell){
      
            if (self.isVaultItems){
                [gCell.btnSendVault setHidden:YES];
            }
            
           
     }
        
    } @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        gCell = nil;
        
    }
 
}
 
 

 
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ItemCellTableView *cell = nil;
    
    static NSString *cellId = @"ItemCellTableView";
    
    INVCItems *invItem = nil;
    
    NSString *strKey = nil;
    
    BOOL callStaticItemAPI    = YES,
         callInstancedItemAPI = YES,
         performStaticUpdates = YES,
         performInstanceUpdates = YES,
         performMatch           = NO;
    
    INVDDestinyInventoryBaseClass *staticBase = nil;
    
    INSTBaseClass *instanceBase = nil;
     
    @try {
        
        [UIView setAnimationsEnabled:NO];
        cell = (ItemCellTableView*) [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        
        if (! cell){
            cell = [[ItemCellTableView alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:cellId];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
         
        }
     
        [cell setParentTableView:self.tblItems];
        [cell setParentViewController:self];
        
        NSLog(@"ItemsViewController:cellForRowAtIndexPath:Section->%d,Row->%d,",indexPath.section,indexPath.row);
        
        NSString *sectionKey = [self->itemBuckets objectAtIndex:indexPath.section];
        
      if (sectionKey){
            
            NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",sectionKey];
            
            NSArray *filteredItems = [self->destItemData.allKeys filteredArrayUsingPredicate:bPredicate];
           
           //Filtered items for all chars
      if (filteredItems){
            
            NSString *itemKey = [filteredItems objectAtIndex:indexPath.row];
            
        if (itemKey){
                //Check if static item already been processe before making API call
                INVCItems *item = (INVCItems *) [self->destItemData objectForKey:itemKey];
            
                /*
                    @property (nonatomic, assign) double quantity;
                    @property (nonatomic, assign) double state;
                    @property (nonatomic, strong) NSArray *tooltipNotificationIndexes;
                    @property (nonatomic, assign) BOOL lockable;
                    @property (nonatomic, assign) BOOL isWrapper;
                    @property (nonatomic, assign) double itemHash;
                    @property (nonatomic, assign) double bindStatus;
                    @property (nonatomic, assign) double dismantlePermission;
                    @property (nonatomic, assign) double location;
                    @property (nonatomic, strong) NSString *itemInstanceId;
                    @property (nonatomic, assign) double bucketHash;
                    @property (nonatomic, assign) double transferStatus;
                    @property (nonatomic, assign) double versionNumber;
                    */
                
        if (item){
                    
             NSNumber *objHashId  = [[NSNumber alloc] initWithDouble:item.itemHash],
                      *objBckId   = [[NSNumber alloc] initWithDouble:item.bucketHash];
                        
             NSString *strHashKey = [NSString stringWithFormat:@"%@",objHashId],
                      *strBckKey  = [NSString stringWithFormat:@"%@",objBckId],
                      *strInstanceId = item.itemInstanceId;
                        
            if (cell){
                            
                if (! cell.tag){
                    [cell.lblCharacterId setText:self.selectedChar];
                    [cell.imgBackground setHidden:YES];
                    [cell setTag:indexPath.section];
                }
                
                if (appDelegate.destinyInventoryBucketDefinitions){
                            
                    DestinyInventoryBucketDefinition  *buckDef =  [appDelegate.destinyInventoryBucketDefinitions objectForKey:strBckKey];
                                
                if (buckDef){
                    
                    callStaticItemAPI = NO;
                    
                    if ([buckDef.displayProperties.name isEqualToString:@"Kinetic Weapons"]){
                        [cell.imgBackground setImage:[UIImage imageNamed:@"primaryAmmo.png"]];
                        [cell.imgBackground setHidden:NO];
                    }
                        
                    if ([buckDef.displayProperties.name isEqualToString:@"Energy Weapons"]){
                        [cell.imgBackground setImage:[UIImage imageNamed:@"energyAmmo.png"]];
                        [cell.imgBackground setHidden:NO];
                    }
                        
                    if ([buckDef.displayProperties.name isEqualToString:@"Power Weapons"]){
                        [cell.imgBackground setImage:[UIImage imageNamed:@"heavyAmmo.png"]];
                        [cell.imgBackground setHidden:NO];
                    }
                        
                  }
                                
                }
                
                
                /*
                 
                 
                 Valid Enum Values

                 None: 0
                 Locked: 1
                 If this bit is set, the item has been "locked" by the user and cannot be deleted. You may want to represent this visually with a "lock" icon.
                 Tracked: 2
                 If this bit is set, the item is a quest that's being tracked by the user. You may want a visual indicator to show that this is a tracked quest.
                 Masterwork: 4
                 If this bit is set, the item has a Masterwork plug inserted. This usually coincides with having a special "glowing" effect applied to the item's icon.
                 Crafted: 8
                 If this bit is set, the item has been 'crafted' by the player. You may want to represent this visually with a "crafted" icon overlay.
                 HighlightedObjective: 16
                 If this bit is set, the item has a 'highlighted' objective. You may want to represent this with an orange-red icon border color.
                 
                 */
                
                [cell.imgCrafted setHidden:YES];
                
                [cell.imgMaster setAlpha:0];
                [cell.imgMaster setHidden:YES];
                
                [cell.imgItem.layer setMasksToBounds:NO];
                [cell.imgItem.layer setBorderWidth:0];
                [cell.imgItem.layer setBorderColor:[UIColor clearColor].CGColor];
                
                NSNumber *objLocked = [NSNumber numberWithDouble:item.state];
                
                switch (objLocked.integerValue) {
                            case 0:
                                [cell.btnLockAction setImage:[UIImage systemImageNamed:@"lock.open"]
                                                    forState:UIControlStateNormal];
                                                       
                                break;
                            case 1:
                                [cell.btnLockAction setImage:[UIImage systemImageNamed:@"lock"]
                                                    forState:UIControlStateNormal];
                                                    
                                break;
                            case 2://tracked
                                break;
                            case 4://Masterwork
                                                   
                                [cell.imgItem.layer setMasksToBounds:YES];
                                [cell.imgItem.layer setBorderWidth:2];
                                [cell.imgItem.layer setShadowOffset: CGSizeMake(-1, 1)];
                                [cell.imgItem.layer setBorderColor:[UIColor yellowColor].CGColor];
                        
                                [cell.imgMaster setAlpha:0.3];
                                [cell.imgMaster setHidden:NO];
                                                   
                                break;
                                                   
                            case 5://Masterwork + locked
                                [cell.btnLockAction setImage:[UIImage systemImageNamed:@"lock"]
                                                    forState:UIControlStateNormal];
                                                   
                                [cell.imgItem.layer setMasksToBounds:YES];
                                [cell.imgItem.layer setBorderWidth:2];
                                [cell.imgItem.layer setShadowOffset: CGSizeMake(-1, 1)];
                                [cell.imgItem.layer setBorderColor:[UIColor yellowColor].CGColor];
                        
                                [cell.imgMaster setAlpha:0.3];
                                [cell.imgMaster setHidden:NO];
                                                   
                            break;
                            case 8://Crafted
                                [cell.imgCrafted setHidden:NO];
                            break;
                            case 12://bitmask ItemState ["Masterwork", "Crafted"]
                                                   
                                [cell.imgCrafted setHidden:NO];
                                [cell.imgItem.layer setMasksToBounds:YES];
                                [cell.imgItem.layer setBorderWidth:2];
                                [cell.imgItem.layer setShadowOffset: CGSizeMake(-1, 1)];
                                [cell.imgItem.layer setBorderColor:[UIColor yellowColor].CGColor];
                        
                                [cell.imgMaster setAlpha:0.3];
                                [cell.imgMaster setHidden:NO];
                                                   
                            break;
                            case 16://red bar
                                                   
                                [cell.imgItem.layer setMasksToBounds:YES];
                                [cell.imgItem.layer setBorderWidth:2];
                                [cell.imgItem.layer setShadowOffset: CGSizeMake(-1, 1)];
                                [cell.imgItem.layer setBorderColor:[UIColor orangeColor].CGColor];
                                                   
                            break;
                    }
                

                
                if (appDelegate.destinyInventoryItemDefinitions){
                    
                    NSDictionary *itemObj = (NSDictionary *)[appDelegate.destinyInventoryItemDefinitions objectForKey:strHashKey];
                    
                    INVDResponse *itemDef = nil;
                    
                    if ([itemObj isKindOfClass:[INVDResponse class]]){
                        itemDef = (INVDResponse*) itemObj;
                    }
                    
                    if ([itemObj isKindOfClass:[INVDDestinyInventoryBaseClass class]]){
                        INVDDestinyInventoryBaseClass *itemDefBase =
                        (INVDDestinyInventoryBaseClass*) itemObj;
                        
                        itemDef = [[INVDResponse alloc] initWithDictionary:itemDefBase.response];
                    }
                    
                    if (itemDef){
                        
                        callInstancedItemAPI = NO;
                        
                        NSString *itemTypeName   = nil,
                                 *itemName       = nil,
                                 *itemDamageType = nil,
                                 *itemScreenShot = nil,
                                 *objDamageType  = nil,
                                 *strHashKey     = nil;
                            
                        double t = 0;
                        int    i = 0;
                        
                        BOOL showDescription = NO;
                        
                         
                        NSNumber *objHash = [NSNumber numberWithDouble:[itemDef hash]];
                            
                            strHashKey = [objHash stringValue];
                        
                        if ([strHashKey isEqualToString:@"0"]){
                            
                            NSNumber *oHash = [NSNumber numberWithDouble:[item itemHash]];
                            
                            strHashKey = [oHash stringValue];
                            
                            NSLog(@"ItemsTableViewController:cellForRowAtIndexPath:HashKey=0,Section->%d,Row->%d:Exiting",
                                 indexPath.section,indexPath.row);
                           // return cell;
                        }
                        
                      
                        
                        [cell.lblHash setText:strHashKey];
                            
                            itemTypeName   =  [itemDef itemTypeDisplayName];
                      
                            itemScreenShot = [itemDef screenshot];
                            
                         
                            if (itemTypeName){
                                [cell.lblItemType setText:itemTypeName];
                                
                                if ([itemTypeName containsString:@"Engram"]){
                                    showDescription = YES;
                                }
                                
                                if ([itemTypeName isEqualToString:@"Redeemable"]){
                                  
                                    showDescription = YES;
                                }
                                
                                if ([itemTypeName isEqualToString:@"Finisher"]){
                                  
                                    showDescription = YES;
                                }
                                
                                if ([itemTypeName isEqualToString:@"Finisher Collection"]){
                                    
                                    showDescription = YES;
                                }
                            }
                            
                            if (itemScreenShot){
                                [cell.lblMisc setText:itemScreenShot];
                                
                            }
                            
                            t = [itemDef defaultDamageType];
                            i= (int) t;
                            
                            objDamageType =  [NSString stringWithFormat:@"%d",i];
                            
                       
                            [cell.imgItemBurn setHidden:YES];
                            if (objDamageType){
                            
                                itemDamageType = [Utilities decodeDamageType:objDamageType.intValue];
                            
                                if (itemDamageType){
                                    
                                    [cell.lblDamageType setTextColor:[UIColor lightGrayColor]];
                                    [cell.lblDamageType setText:itemDamageType];
                                    
                                    if ([itemDamageType isEqualToString:@"Arc"]){
                                        [cell.imgItemBurn setHidden:NO];
                                        [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_arc.png"]];
                                        [cell.lblDamageType setText:@"Damage"];
                                    }
                                    if ([cell.lblDamageType.text isEqualToString:@"Solar"]){
                                        [cell.imgItemBurn setHidden:NO];
                                        [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_solar.png"]];
                                        [cell.lblDamageType setText:@"Damage"];
                                    }
                                    if ([cell.lblDamageType.text isEqualToString:@"Void"]){
                                        [cell.imgItemBurn setHidden:NO];
                                        [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_void.png"]];
                                        [cell.lblDamageType setText:@"Damage"];
                                    }
                                    if ([cell.lblDamageType.text isEqualToString:@"Stasis"]){
                                        [cell.imgItemBurn setHidden:NO];
                                        [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_stasis.png"]];
                                        [cell.lblDamageType setText:@"Damage"];
                                    }
                                    
                                    if ([cell.lblDamageType.text isEqualToString:@"Kinetic"]){
                                        [cell.imgItemBurn setHidden:NO];
                                        [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_kinetic.png"]];
                                        [cell.lblDamageType setText:@"Damage"];
                                    }
                                    
                                    if ([itemDamageType isEqualToString:@"None"]){
                                        [cell.lblDamageType setText:@""];
                                        
                                        NSNumber *objQuantity = [NSNumber numberWithDouble:[item quantity]];
                                        
                                        if (objQuantity){
                                            
                                            NSString *strQuantity = [objQuantity stringValue];
                                            [cell.lblPowerLevel setText:strQuantity];
                                        }
                                    }
                                }
                            }
                            
                            INVDDisplayProperties *invDisplayProps = (INVDDisplayProperties* )itemDef.displayProperties;
                                
                            NSString *imageName     = nil,
                                     *baseURL       = nil,
                                     *emblem        = nil,
                                     *strDesc       = nil;
                            
                            NSURL   *imageURL      = nil,
                                    *emblemURL      = nil;
                            
                            if (invDisplayProps){
                                
                                if (invDisplayProps.hasIcon){
                                    
                                    emblem =  invDisplayProps.icon;
                                    strDesc = invDisplayProps.displayPropertiesDescription;
                                    imageName = itemDef.iconWatermark;
                                    
                                    
                                    
                                    if (emblem){
                                        baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,emblem];
                                        emblemURL = [[NSURL alloc] initWithString:baseURL];
                                        if (emblemURL){
                                            [cell.imgItem setImageWithURL:emblemURL];
                                        }
                                    }
                                    
                                    if (imageName){
                                        baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
                                        imageURL = [[NSURL alloc] initWithString:baseURL];
                                        if (imageURL){
                                            [cell.imgCareer setImageWithURL:imageURL];
                                            [cell.imgCareer setAlpha:0.7];
                                        }
                                    }
                                    
                                    if (! itemScreenShot){
                                        [cell.lblMisc setText:emblem];
                                    }
                                }
                                
                                itemName = [invDisplayProps name];
                                [cell.lblItemName setText:itemName];
                                
                                if (showDescription){
                                    [cell.lblItemType setHidden:YES];
                                    [cell.lblItemType setText:strDesc];
                                }
                                
                                NSLog(@"ItemsTableViewController:cellForRowAtIndexPath:Name->%@,Section->%d,Row->%d,",
                                    itemName, indexPath.section,indexPath.row);
                            }
                            
                            if (self->instanceData){
                                
                            INSTBaseClass *instanceBase = [self->instanceData objectForKey:strHashKey];
                                
                            if (instanceBase){
                                callInstancedItemAPI = NO;
                             NSDictionary *response = (NSDictionary *)[instanceBase response];
                            
                             if (response){
                                
                                 if (cell.lblInstanceId.text.length > 0){
                                     performInstanceUpdates = NO;
                                     
                                     
                                     NSLog(@"ItemsVC:cellForRow:anyInstancedId=[%@],cell.lblInstanceId=[%@]",
                                           strInstanceId,cell.lblInstanceId.text);
                                     
                                     if (![cell.lblInstanceId.text isEqual:strInstanceId]){
                                         performMatch = YES;
                                         NSLog(@"ItemsVC:Need to perform Match!");
                                     }
                                     
                                 }else{
                                    
                                     [cell.lblInstanceId setText:strInstanceId];
                                 }
                                 
                                 NSDictionary *instance = (NSDictionary*) [response objectForKey:@"instance"],
                                               *itemD   = (NSDictionary*) [response objectForKey:@"item"];
                                
                                 if (performMatch){
                                     
                                     NSDictionary *iDD = (NSDictionary*) [itemD objectForKey:@"data"];
                                     
                                     if (iDD){
                                         
                                         NSString *iInstanceID = [iDD objectForKey:@"itemInstanceId"];
                                         
                                         if (![cell.lblInstanceId.text isEqualToString:iInstanceID] &&
                                             [strInstanceId isEqualToString:iInstanceID]){
                                             
                                             [cell.lblInstanceId setText:iInstanceID];
                                             
                                              NSLog(@"ItemVC:updateInstancedItemData:Udate to Match[%@] ",iInstanceID);
                                             
                                         }
                                         
                                     }
                                     
                                 }
                                 
                                 if (performInstanceUpdates){
                                     
                                     
                                 if (instance){
                                    NSDictionary *data = (NSDictionary*) [instance objectForKey:@"data"];
                                    
                                    if (data){
                                        
                                        NSNumber *objIsEquipped = [data objectForKey:@"isEquipped"];
                                        
                                        if (objIsEquipped){
                                            
                                            BOOL isEquipped = [objIsEquipped boolValue];
                                            
                                            [cell.layer setMasksToBounds:NO];
                                            [cell.layer setCornerRadius:0];
                                            [cell.layer setBorderWidth:1];
                                            [cell.layer setShadowOffset: CGSizeMake(0, 0)];
                                            [cell.layer setBorderColor:[UIColor clearColor].CGColor];
                                            
                                            if (isEquipped){
                                                    
                                                [cell.layer setMasksToBounds:YES];
                                                [cell.layer setCornerRadius:5];
                                                [cell.layer setBorderWidth:3];
                                                [cell.layer setShadowOffset: CGSizeMake(-1, 1)];
                                                [cell.layer setBorderColor:[UIColor whiteColor].CGColor];

                                            }
                                                
                                        }
                                        
                                        NSDictionary *pStat = (NSDictionary*) [data objectForKey:@"primaryStat"] ;
                                        
                                        if (pStat){
                                            NSObject *objValue =   [pStat objectForKey:@"value"];
                                            if (objValue){
                                                [cell.lblPowerLevel setText:[NSString stringWithFormat:@"%@",objValue]];
                                            }
                                               
                                           }
                                        }
                                    }
                               
                                 }
                             }
                           }

                          }
                         }
                        else
                        {
                        NSLog(@"ItemsViewController:cellForRowAtIndexPath:Unable to find destinyInventoryItemDefinition for[%@]",strHashKey);
                        
                        [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinyInventoryItemDefinition" staticHashId:strHashKey completionBlock:^(NSArray *values) {
                            
                            if (values){
                                
                            NSLog(@"ItemsViewController:retrieveStaticEntityDefinitionByManifestType:Received->%@",strHashKey);
                                    
                            INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                            
                            NSNumber *objLocked = [NSNumber numberWithDouble:item.state];
                                
                            NSString *strIDX = [NSString stringWithFormat:@"%d",indexPath.row],
                                     *strSDX = [NSString stringWithFormat:@"%d",indexPath.section],
                                     *strLocked =  [objLocked stringValue];
                                
                            NSDictionary *callerInfo = [[NSDictionary alloc]
                                                initWithObjectsAndKeys:@"WeaponsViewController",@"ClassName",
                                                @"getStaticItem",@"MethodName",
                                                strIDX,@"CurrentIndex",
                                                strSDX,@"CurrentSection",
                                                strLocked, @"LockState",
                                                cell,@"CurrentCell",
                                                strHashKey, @"itemHashKey",nil];
                                    
                            [[NSNotificationCenter defaultCenter]
                                    postNotificationName:kDestinyLoadedStaticItemNotification
                                                    object:invItem
                                                    userInfo:callerInfo];
                                
                            NSLog(@"ItemsViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Raised->%@",strHashKey);
                            
                            }
                            
                        }
                        andErrorBlock:^(NSError *exception) {
                        NSLog(@"ItemsViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Exception->%@",exception.description);
                        }];
                                
                    }
                        
                }
                            
            }
                        
                        
        }
        else{
            NSLog(@"ItemsViewController:cellForRowAtIndexPath:Nothing found%@",sectionKey);
        }
           
        }
      }
      else{
          NSLog(@"ItemsViewController:cellForRowAtIndexPath:Nothing found%@",sectionKey);
      }
              
      }
        
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception.description);
    }
    @finally {
        [UIView setAnimationsEnabled:YES];
    }
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger iRows = 0,
              iSection = section;
    
    NSString *sectionKey  = nil;
    
 
        
        @try {
            
           
            if (self.isVaultItems){
                
                
                sectionKey = [self.destVaultItemsBuckets objectAtIndex:iSection];
                
                if (sectionKey){
                    
                    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",sectionKey];
                    
                    NSArray *filteredItems = nil;
                    
                    if (self.destVaultItems){
                        filteredItems =  [self.destVaultItems.allKeys filteredArrayUsingPredicate:bPredicate];
                    }else{
                        filteredItems =  [self->destItemData.allKeys filteredArrayUsingPredicate:bPredicate];
                    }
                   
                 
                    if (filteredItems){
                        iRows = filteredItems.count;
                    }
                      
                }
                
            }
            else{
                
                sectionKey = [self->itemBuckets objectAtIndex:iSection];
                
                if (sectionKey){
                    
                    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",sectionKey];
                    
                    NSArray *filteredItems = [self->destItemData.allKeys filteredArrayUsingPredicate:bPredicate];
                   
                   //Filtered items for all chars
                    if (filteredItems){
                        iRows = filteredItems.count;
                    }
                      
                }
                
            }
            
            
        } @catch (NSException *exception) {
            NSLog(@"numberOfRowsInSection:Exception->%@",exception.description);
        } @finally {
            
        }
      
      
 
    return iRows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger iSections = 1;
 
    if (! self.isVaultItems){
        if (self.destEquippedItemsBuckets){
            iSections = self.destEquippedItemsBuckets.count;
        }
    }else{
        
        if (self.destVaultItemsBuckets){
            iSections = self.destVaultItemsBuckets.count;
        }
        
    }
    
    return iSections;

}



- (IBAction)categoryChangedAction:(UISegmentedControl *)sender {
    
    @try {
        
        WeaponsTableViewController *wVC = nil;
        
        switch (sender.selectedSegmentIndex) {
            case 0:
                
                wVC =   [self.storyboard instantiateViewControllerWithIdentifier:@"sbWeapons"];
                
                if (wVC){
                    [self presentViewController:wVC
                                       animated:YES completion:^{
                        
                        
                    }];
                }
                break;
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
        }
        
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    
}

-(void) closeAction{
    
    
    NSLog(@"ItemsViewController:closeAction:Invoked...");
     
    [self.navigationController dismissViewControllerAnimated:NO completion:^{
    
        NSLog(@"ItemsViewController:closeAction:Completed...");
        
        GuardianViewController *gVC = nil;
        
        if (! self.parentVC){
            NSLog(@"ItemsViewController:closeAction:Not Parent VC Detected:exiting...");
            return;
            
        }
        
        if ([self.parentVC isKindOfClass:[GuardianViewController class]]){
            
            gVC = (GuardianViewController *) self.parentVC;
            
            if (gVC){
               // [gVC refreshCharacterEquipment];
                
                self.parentVC = nil;
            }
            
            
            if (self->cImage){
                self->cImage = nil;
                [self.navigationItem setTitleView:nil];
            }
        }
        
    }];
    
}

 
@end
