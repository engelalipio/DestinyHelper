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
#import "DataModels.h"
#import "Constants.h"
#import "ItemCellTableView.h"
#import "Utilities.h"
#import "INVDDisplayProperties.h"
#import "INVDResponse.h"
#import "WeaponsTableViewController.h"
@interface ItemsViewController ()
{
    AppDelegate *appDelegate;
    
    NSMutableDictionary *destItemData,
                        *instanceData,
                        *destCharData,
                        *bucketsData;
    
    ITMEBaseClass *equipedItems;
    
    NSMutableArray *itemBuckets;
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    appDelegate = [AppDelegate currentDelegate];
    
    [self registerNotifications];
    [self initTableView];
  
}


-(void) updateInstancedItemData:(int) itemIndex
             usingInstancedItem:(INSTBaseClass *) anyInstancedItem
               usingInstancedId:(NSString *) anyInstancedId {
    

    INSTBaseClass *instanceBase  = nil;
    
    BOOL hasUncommitedChanges = NO,
         performUpdates = NO;
    
    NSArray<NSIndexPath *> *visibleIndexPaths = nil;
    
    @try {
        instanceBase = (INSTBaseClass *) anyInstancedItem ;
       
       
        hasUncommitedChanges = [self.tblItems hasUncommittedUpdates];
        
        visibleIndexPaths =  [self.tblItems indexPathsForVisibleRows];
        
        NSIndexPath *cIndexPath = nil;
      
        if (!hasUncommitedChanges){
            
            //for (int idx = 0; idx < visibleIndexPaths.count ; idx++ ) {
              
                NSIndexPath *iPath = [NSIndexPath indexPathForRow:itemIndex inSection:0];
                
                if (iPath){
                   // if (idx == itemIndex){
                        performUpdates = YES;
                        cIndexPath = iPath;
                      //  break;
                }
                
           // }
            
  
        }
        else{
           
                NSLog(@"ItemsViewController:updateInstancedItemData:itemIndex [%d] returning to due hasUncommitedChanges", itemIndex);
                return;

        }
        
        if (performUpdates){
        
        [self.tblItems performBatchUpdates:^{
            
            [self.tblItems beginUpdates];
            
            
            if (instanceBase){
                
                ItemCellTableView *cell = [self.tblItems cellForRowAtIndexPath:cIndexPath];
                
                NSLog(@"ItemsViewController:updateInstancedItemData:For IndexPath Section->[%d],Row->[%d]",cIndexPath.section, cIndexPath.row);
                
                if (anyInstancedId){
                    [cell.lblInstanceId setText:anyInstancedId];
                }
                
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
            [self.tblItems endUpdates];
        }
        completion:^(BOOL finished) {
            if (finished){
                NSLog( @"ItemsViewController:updateInstancedItemData:tblItems:performBatchUpdates:finished!");
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
                  [self.tblItems beginUpdates];
                  //Update Static Item Data
                  if (invItem){
                      
                      ItemCellTableView *cell = [self.tblItems cellForRowAtIndexPath:cIndexPath];
                      
                      if (cell){
                          
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
                                  
                                  if (cIndexPath.row == 0){
                                      
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
                                  }
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
                
                  [self.tblItems endUpdates];
                }
              completion:^(BOOL finished) {
                    if (finished){
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

-(void) updateStaticItemData:(int) itemIndex usingStaticBaseItem:(INVDDestinyInventoryBaseClass *) anyStaticItem {
    
    INVDDestinyInventoryBaseClass *invItem  = anyStaticItem;
    
    BOOL hasUncommitedChanges = NO,
         performUpdates       = NO;
    
    NSArray<NSIndexPath *> *visibleIndexPaths = nil;
    
    @try {
        
        hasUncommitedChanges = [self.tblItems hasUncommittedUpdates];
        
        visibleIndexPaths =  [self.tblItems indexPathsForVisibleRows];
        
        NSIndexPath *cIndexPath = nil;
        
       
        if (! hasUncommitedChanges){
            
           
           // for (int idx = 0; idx < visibleIndexPaths.count ; idx++ ) {
              
                NSIndexPath *iPath = [NSIndexPath indexPathForRow:itemIndex inSection:0];
                
                if (iPath){
                    //if (idx == itemIndex){
                        performUpdates = YES;
                        cIndexPath = iPath;
                    //    break;
                   // }
                }
                
            //}
            
            if (hasUncommitedChanges){
                NSLog(@"updateStaticItemData:For IndexPath Section->[%d],Row->[%d] returning due to hasUncommitedChanges",cIndexPath.section, cIndexPath.row);
            }
 
            [self.tblItems performBatchUpdates:^{
               // [self.tblItems beginUpdates];
                if (invItem){
                    
                    ItemCellTableView *cell = [self.tblItems cellForRowAtIndexPath:cIndexPath];
                    
                    //NSIndexPath *cIndexPath = [self.tblItems indexPathForCell:cell];
                    
                    if (cell){
                        
                        INVDResponse *invResponse =  [[INVDResponse alloc] initWithDictionary: invItem.response ];
                        
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
                                NSLog(@"updateStaticItemData:For %@ IndexPath Section->[%d],Row->[%d]",strHashKey,cIndexPath.section, cIndexPath.row);
                            }
                            
                            itemTypeName   =  [invResponse itemTypeDisplayName];
                            
                            itemScreenShot = [invResponse screenshot];
                            
                            if (itemTypeName){
                                [cell.lblItemType setText:itemTypeName];
                            }
                            
                            if (itemScreenShot){
                                [cell.lblMisc setText:itemScreenShot];
                                
                                if (cIndexPath.row == 0){
                                    
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
                                }
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
             //   [self.tblItems endUpdates];
            
            }
              completion:^(BOOL finished) {
                    if (finished){
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
        
        int currentIndex = -1;
        
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
    
            }
            
            if (strHashKey != nil && invItem != nil){
                performUpdate = YES;
                
                currentIndex = [strIdx intValue];
            }
             
            if (performUpdate){
               
                if (! self->destItemData){
                    self->destItemData = [[NSMutableDictionary alloc] init];
                }
                
                if (! [self->destItemData.allKeys containsObject:strHashKey]){
                    NSLog(@"ItemsViewController:kDestinyLoadedStaticItemNotification:Adding->%@ to destItemData on [%d] Index",strHashKey,currentIndex);
                    [self->destItemData setValue:invItem forKey:strHashKey];
                    [self updateStaticItemData:currentIndex usingStaticBaseItem:invItem];
                }
                else{
                    
                    if ([strClassName isEqualToString:@"ItemCellViewController"]){
                        NSLog(@"ItemsViewController:kDestinyLoadedStaticItemNotification:Refreshing UI [%@] For Data on [%d] Index",strHashKey,currentIndex);
                        
                        [self->destItemData setValue:invItem forKey:strHashKey];
                        [self updateStaticItemData:currentIndex usingStaticBaseItem:invItem];
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
                 *strIdx         = nil;
        
        INSTBaseClass *instanceBase = nil;
        
        BOOL performUpdate = NO;
        
        ItemCellTableView *cell = nil;
        
        int currentIndex = -1;
        
        @try {
            
            cData = (NSMutableDictionary*) [note object];
            
            userInfo = [note userInfo];
            
            
            if (userInfo){
                strHashKey = [userInfo objectForKey:@"itemHashKey"];
                strInstanceKey = [userInfo objectForKey:@"itemInstanceId"];
                currentIndexPath = [userInfo objectForKey:@"CurrentIndexPath"];
                strIdx  =  [userInfo objectForKey:@"CurrentIndex"];
                cell =  [userInfo objectForKey: @"CurrentCell"];
            }
            
            if (strHashKey != nil && strInstanceKey != nil && cData != nil){
                performUpdate = YES;
                
                currentIndex = [strIdx intValue];
            }
            
            if (performUpdate){
                
                instanceBase  = (INSTBaseClass*) cData;
                
                if (! self->instanceData){
                    self->instanceData = [[NSMutableDictionary alloc] init];
                }
                
                if (! [self->instanceData.allKeys containsObject:strHashKey]){
                    NSLog(@"ItemsViewController:kDestinyLoadedInstancedItemNotification:Adding->%@ to instanceData...",strHashKey);
                    [self->instanceData setValue:instanceBase forKey:strHashKey];
                    [self updateInstancedItemData:currentIndex usingInstancedItem:instanceBase usingInstancedId:strInstanceKey];
                }
                 else{
                        
                    // [self.tblItems reloadData];
                       /* NSString *message = [cell.lblHash text];
                        
                        if ([message isEqualToString:strHashKey] ){
                            NSLog(@"ItemsViewController:kDestinyLoadedInstancedItemNotification:Refreshing UI For Instanced Data [%@]...",strHashKey);
                            [self updateInstancedItemData:currentIndex usingInstancedItem:instanceBase];
                        }*/
                        
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

-(void) refreshItems{
 
    self->equipedItems = nil;
    
    [self loadItems];
}

-(void) loadItems{
 
    NSString *message   = @"3:ItemsViewController:loadItems:Invoked by GuardianViewController...",
             *strMID    = @"",
             *strCharID = @"";
    
    NSDictionary        *chars = nil,
                        *equip = nil,
                        *cChar = nil,
                        *eData = nil;
    
    ITMEBaseClass *itemsBase = nil;
    
    @try {
        NSLog(@"%@",message);
         
        strMID = self.selectedMembership;
        strCharID = self.selectedChar;
        
        if (! appDelegate){
            appDelegate = [AppDelegate currentDelegate];
        }
        
        chars = self.destChars;
        if (chars){
            
            cChar = [chars objectForKey:strCharID];
            
            if (cChar){
                
                //try equipment first
                equip = [cChar objectForKey:@"equipment"];
                if (! equip){
                    //check inventory next
                    equip = [cChar objectForKey:@"inventory"];
                }
                
                if (equip){
                    
                    eData = [equip objectForKey:@"data"];
                    
                    if (eData){
                        
                        itemsBase = [[ITMEBaseClass alloc] initWithDictionary:eData];
                        
                        if (itemsBase){
                            
                            if (! self->equipedItems){
                                self->equipedItems = itemsBase;
                                
                                if (itemsBase.items){
                                    if (! self->itemBuckets){
                                        self->itemBuckets = [[NSMutableArray alloc] init];
                                    }
                                    
                                    for (int idx = 0; idx < itemsBase.items.count; idx++) {
                                        
                                        ITMEItems *invItem = (ITMEItems*) [itemsBase.items objectAtIndex:idx];
                                        
                                        if (invItem){
                                            NSNumber *bHash = [[NSNumber alloc] initWithDouble:invItem.bucketHash],
                                                     *iHash = [[NSNumber alloc] initWithDouble:invItem.itemHash],
                                                     *bLocked = [[NSNumber alloc] initWithDouble:invItem.state];
                                            
                                            NSString *strHash = [bHash stringValue],
                                                     *strIHash = [iHash stringValue],
                                                     *strInstanceId = [invItem itemInstanceId],
                                                     *strIDX = [NSString stringWithFormat:@"%d",idx],
                                                     *strLocked = [bLocked stringValue];
                                            
                                            if (![self->itemBuckets containsObject:strHash]){
                                                [self->itemBuckets addObject:strHash];
                                            }
                                          
                                          if (appDelegate.destinyInventoryBucketDefinitions){
                                              
                                                if (!self->bucketsData){
                                                    self->bucketsData = [[NSMutableDictionary alloc] init];
                                                }
                                              
                                                if (![self->bucketsData.allKeys containsObject:strHash]){
                                                  
                                                    DestinyInventoryBucketDefinition *bDef = [appDelegate.destinyInventoryBucketDefinitions objectForKey:strHash];
                                                    
                                                    if (bDef){
                                                        [self->bucketsData setValue:bDef forKey:strHash];
                                                    }
                                                    
                                                }
                                            }
                                            
                                            [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinyInventoryItemDefinition" staticHashId:strIHash completionBlock:^(NSArray *values) {
                                                
                                                if (values){
                                                  
                                                NSLog(@"ItemsViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Received->%@",strHash);
                                                      
                                                INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                                                
                                                NSDictionary *callerInfo = [[NSDictionary alloc]
                                                                  initWithObjectsAndKeys:@"ItemsViewController",@"ClassName",
                                                                  @"getStaticItem",@"MethodName",
                                                                  strIDX,@"CurrentIndex",
                                                                  strLocked, @"LockState",
                                                                  strIHash, @"itemHashKey",nil];
                                                      
                                                [[NSNotificationCenter defaultCenter]
                                                        postNotificationName:kDestinyLoadedStaticItemNotification
                                                                      object:invItem
                                                                        userInfo:callerInfo];
                                                    
                                                NSLog(@"ItemsViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Raised->%@",strIHash);
                                                
                                                }
                                                
                                            } andErrorBlock:^(NSError *exception) {
                                             NSLog(@"ItemsViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Exception->%@",exception.description);
                                            }];
                                            
                                            
                                            [NetworkAPISingleClient getInstancedItem:strInstanceId completionBlock:^(NSArray *values){
                                            
                                                if (values){
                                                
                                                INSTBaseClass *instanceBase = (INSTBaseClass*) [values firstObject];
                                                    
                                                NSDictionary *callerInfo = [[NSDictionary alloc]
                                                                initWithObjectsAndKeys:@"ItemsViewController",@"ClassName",
                                                                                        @"getInstancedItem",@"MethodName",
                                                                                        strIDX,@"CurrentIndex",
                                                                                        strIHash, @"itemHashKey",
                                                                                        strInstanceId, @"itemInstanceId",nil];
                                                    
                                                [[NSNotificationCenter defaultCenter]
                                                        postNotificationName:kDestinyLoadedInstancedItemNotification
                                                                        object:instanceBase
                                                                        userInfo:callerInfo];
                                                    
                                                    NSLog(@"ItemsViewController:getInstancedItem:loadItems:Raised->%@",strIHash);
                                                    
                                                }
                                                
                                            }andErrorBlock:^(NSError *exception){
                                                NSLog(@"ItemsViewController:getInstancedItem:loadItems:Exception->%@",exception.description);
                                            }];
                                            
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

 
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *selectedTitle        = nil,
             *selectedScreenShot   = nil,
             *selectedItemHash     = nil,
             *selectedItemInstance = nil;
    
    ItemCellTableView *selectedCell = nil;
    
    @try {
        
        selectedCell = (ItemCellTableView*) [tableView cellForRowAtIndexPath:indexPath];
        
        if(selectedCell){
            selectedTitle = selectedCell.lblItemName.text;
            
            [self setTitle:selectedTitle];
            
            selectedScreenShot = [selectedCell.lblMisc text];
            
            selectedItemHash = [selectedCell.lblHash text];
            
            selectedItemInstance = [selectedCell.lblInstanceId text];
            
            if (selectedScreenShot){
                 
                  NSString *baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,selectedScreenShot];
                  NSURL *ssURL= [[NSURL alloc] initWithString:baseURL];
                
                    if (ssURL){
                        [self.imgItemScreenShot setImageWithURL:ssURL];
                      }
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
        NSInteger size = 120;
     
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
   // return CGFLOAT_MIN;
    NSInteger size = 2.0f;//90;
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSInteger size = 25.0f;//90;
    
    return size;
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
  
     
    
    /*if (self->itemBuckets){
        
       NSString *sectionKey = [self->itemBuckets objectAtIndex:section];
        
        if (sectionKey){
            
            if ( appDelegate.destinyInventoryBucketDefinitions){
            
                DestinyInventoryBucketDefinition *ibucDef = [appDelegate.destinyInventoryBucketDefinitions objectForKey:sectionKey];
                
                if (ibucDef){
                    
                    BCKDisplayProperties *dispProps = (BCKDisplayProperties*) [ibucDef displayProperties];
                    if (dispProps){
                        title = dispProps.name;
                    }
                }
            
           }
        
      }
    }*/
    
    
    return title;
}
 
/*
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSString *message   = nil;
    static NSString *cellId = @"ItemCellTableView";
    ItemCellTableView *gCell = nil;
    @try {
        
        
        gCell = (ItemCellTableView*) [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        
        if (gCell){
        
            message = [gCell.lblItemName text];
            
            if ([message isEqualToString:@"Item Name"]){
                [gCell.lblPowerLevel setText:@""];
                [gCell.lblItemName setText:@"Loading..."];
                [gCell.lblDamageType setTextColor:[UIColor whiteColor]];
                [gCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            }
           
     }
        
    } @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        gCell = nil;
        
    }
 
}*/




 
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ItemCellTableView *cell = nil;
    
    static NSString *cellId = @"ItemCellTableView";
    
    ITMEItems *invItem = nil;
    
    NSString *strKey = nil;
    
    BOOL callStaticItemAPI    = YES,
         callInstancedItemAPI = YES;
    
    INVDDestinyInventoryBaseClass *staticBase = nil;
    
    INSTBaseClass *instanceBase = nil;
     
    @try {
        
        cell = (ItemCellTableView*) [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        
        if (! cell){
            cell = [[ItemCellTableView alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:cellId];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
         
        }
     
        [cell setParentTableView:self.tblItems];
        [cell setParentViewController:self];
        
        NSLog(@"ItemsViewController:cellForRowAtIndexPath:Section->%d,Row->%d,",indexPath.section,indexPath.row);
        
        
        if (self->itemBuckets){
            strKey = [self->itemBuckets objectAtIndex:indexPath.section];
        }
        
        if (self->equipedItems){
            
            invItem = (ITMEItems*) [self->equipedItems.items objectAtIndex:indexPath.row];
            if (invItem){
                
                NSNumber *objHashId  = [[NSNumber alloc] initWithDouble:invItem.itemHash];
                
                NSString *strHashKey = [objHashId stringValue];
                
                //Check if static item already been processe before making API call
                if (self->destItemData){
                    
                    if ([self->destItemData.allKeys containsObject:strHashKey]){
                        
                        callStaticItemAPI = NO;
                        NSLog(@"ItemsViewController:cellForRowAtIndexPath:Static Item for [%@] already retrieved...",strHashKey);
                        
                        staticBase = [self->destItemData objectForKey:strHashKey];
                        
                        if (cell){
                            
                            [cell.lblCharacterId setText:self.selectedChar];
                            
                            INVDResponse *invResponse =  [[INVDResponse alloc] initWithDictionary: staticBase.response ];
                            
                            if (invResponse){
                               
                            
                                NSString    *itemTypeName   = nil,
                                            *itemName       = nil,
                                            *itemDamageType = nil,
                                            *itemScreenShot = nil,
                                            *objDamageType  = nil,
                                            *strHashKey     = nil;
                                
                                double t = 0;
                                int    i = 0;
                                
                                NSNumber *objHash = [NSNumber numberWithDouble:[invResponse hash]];
                                
                                strHashKey = [objHash stringValue];
                                [cell.lblHash setText:strHashKey];
                                   
                                
                                itemTypeName   =  [invResponse itemTypeDisplayName];
                                
                                itemScreenShot = [invResponse screenshot];
                                
                                if (itemTypeName){
                                    [cell.lblItemType setText:itemTypeName];
                                }
                                
                                if (itemScreenShot){
                                    [cell.lblMisc setText:itemScreenShot];
                                    
                                    if (indexPath.row == 0){
                                        
                                        if (!self.imgItemScreenShot.image){
                                            
                                            NSString *bURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,itemScreenShot];
                                            NSURL *ssURL= [[NSURL alloc] initWithString:bURL];
                                            
                                                if (ssURL){
                                                    [self.imgItemScreenShot setImageWithURL:ssURL];
                                                    
                                            }
                                        }
                                    }
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
                
                
                //Check if instanced item already been processe before making API call
                if (self->instanceData){
                    
                    if ([self->instanceData.allKeys containsObject:strHashKey]){
                        
                        callInstancedItemAPI = NO;
                        NSLog(@"ItemsViewController:cellForRowAtIndexPath:Instanced Item for [%@] already retrieved...",strHashKey);
                        
                        instanceBase = (INSTBaseClass*) [self->instanceData objectForKey:strHashKey];
                        
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
                
                //[cell.lblHash setHidden:NO];
                
                callStaticItemAPI = NO;
                callInstancedItemAPI = NO;
                
                if (callStaticItemAPI){
                    [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinyInventoryItemDefinition" staticHashId:strHashKey completionBlock:^(NSArray *values) {
                        
                        if (values){
                          
                        NSLog(@"ItemsViewController:NetworkAPISingleClient:retrieveStaticEntityDefinitionByManifestType:Received->%@",strHashKey);
                              
                        INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                            
                        [cell.lblHash setText:strHashKey];
                            
                        NSDictionary *callerInfo = [[NSDictionary alloc]
                                          initWithObjectsAndKeys:@"ItemsViewController",@"ClassName",
                                          @"getInstancedItem",@"MethodName",
                                          indexPath,@"CurrentIndexPath",
                                          cell,@"CurrentCell",
                                          strHashKey, @"itemHashKey",nil];
                              
                        [[NSNotificationCenter defaultCenter]
                                postNotificationName:kDestinyLoadedStaticItemNotification
                                              object:invItem
                                                userInfo:callerInfo];
                            
                            NSLog(@"ItemsViewController:NetworkAPISingleClient:kDestinyLoadedStaticItemNotification:Raised->%@",strHashKey);
                        
                        }
                        
                    } andErrorBlock:^(NSError *exception) {
                     NSLog(@"ItemsViewController:NetworkAPISingleClient:retrieveStaticEntityDefinitionByManifestType:Exception->%@",exception.description);
                    }];
                }
                
                if (callInstancedItemAPI){
                    if (invItem.itemInstanceId){
            
                        [NetworkAPISingleClient getInstancedItem:invItem.itemInstanceId completionBlock:^(NSArray *values){
                        
                            if (values){
                            
                            INSTBaseClass *instanceBase = (INSTBaseClass*) [values firstObject];
                                
                            [cell.lblHash setText:strHashKey];
                                
                            NSDictionary *callerInfo = [[NSDictionary alloc]
                                            initWithObjectsAndKeys:@"ItemsViewController",@"ClassName",
                                                                    @"getInstancedItem",@"MethodName",
                                                                    indexPath,@"CurrentIndexPath",
                                                                    cell,@"CurrentCell",
                                                                    strHashKey, @"itemHashKey",
                                                                    invItem.itemInstanceId, @"itemInstanceId",nil];
                                
                            [[NSNotificationCenter defaultCenter]
                                    postNotificationName:kDestinyLoadedInstancedItemNotification
                                                    object:instanceBase
                                                    userInfo:callerInfo];
                                
                                NSLog(@"ItemsViewController:NetworkAPISingleClient:kDestinyLoadedInstancedItemNotification:Raised->%@",strHashKey);
                                
                            }
                            
                        }andErrorBlock:^(NSError *exception){
                            NSLog(@"ItemsViewController:NetworkAPISingleClient:getInstancedItem:Exception->%@",exception.description);
                        }];
                    }
                }
            }
            
        }
        
    } @catch (NSException *exception) {
        NSLog(@"%@",exception.description);
    } @finally {
       
    }
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger tRows = 0,
              iRows = 0;
    
    if (self->equipedItems){
        tRows = self->equipedItems.items.count;
        iRows = tRows;
        NSString *sectionKey = [self->itemBuckets objectAtIndex:section];
        
       /* if (sectionKey){
            
            for (int iSection = 0 ; iSection < tRows; iSection++) {
                
                
                ITMEItems *invItem = [self->equipedItems.items objectAtIndex:iSection];
                
                if (invItem){
                    NSNumber *bHash = [[NSNumber alloc] initWithDouble:invItem.bucketHash ];
                    
                    NSString *strHash = [bHash stringValue];
                    
                    if ([strHash isEqualToString:sectionKey]){
                        iRows+=1;
                    }
            }
         }
        
      }*/
    }
    return iRows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger iSections = 1;
    
  /*  if (self->itemBuckets){
        iSections = self->itemBuckets.count;
    }
    */
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

- (IBAction)closeAction:(UIBarButtonItem *)sender {
    
    
    [self dismissViewControllerAnimated:NO completion:nil];
    NSLog(@"ItemsViewController:closeAction:Invoked...");

    
}
@end
