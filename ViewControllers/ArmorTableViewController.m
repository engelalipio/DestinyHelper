//
//  ArmorTableViewController.m
//  DestinyHelper
//
//  Created by Bertle on 3/19/21.
//  Copyright © 2021 Agile Mobile Solutions. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "ArmorTableViewController.h"
#import "ItemCellTableView.h"
#import "AppDelegate.h"
#import "DataModels.h"
#import "INVDDisplayProperties.h"
#import "Utilities.h"
#import "Constants.h"
#import "NetworkAPISingleClient+Definition.h"
#import "NetworkAPISingleClient+LinkedProfiles.h"

@interface ArmorTableViewController ()
{
    AppDelegate *appDelegate;
    
    NSMutableArray *helmets,
                    *gauntles,
                    *chestArmor,
                    *legArmor,
                    *classArmor;
    
    NSMutableDictionary *instanceData;
}
@end

@implementation ArmorTableViewController

@synthesize destArmor = _destArmor;
@synthesize selectedChar = _selectedChar;
@synthesize selectedMembership = _selectedMembership;
@synthesize destArmorBuckets = _destArmorBuckets;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    UIBarButtonItem *btnClose =  [[UIBarButtonItem alloc] init];
    
    
    if (btnClose){
        [btnClose setTitle:@"Close"];
        [btnClose setTarget:self];
        [btnClose setAction:@selector(closeAction)];
    }

    self.navigationItem.rightBarButtonItem = btnClose;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self->appDelegate = [AppDelegate currentDelegate];
    
    [self initTableView];
    
    [self registerNotifications];
    
}


-(void) registerNotifications{

    NSLog(@"1:ArmorViewController:registerNotifications...");
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedStaticItemNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        
        NSIndexPath *currentIndexPath = nil;
        
        NSString *strHashKey    = nil,
                 *strIdx        = nil,
                 *strSdx        = nil,
                 *strLocked     = nil,
                 *strClassName  = nil;
        
        BOOL performUpdate = NO;
        
        INVDDestinyInventoryBaseClass *invItem  = nil;
        
        NSDictionary *userInfo = nil;
        
        ItemCellTableView *cell = nil;
        
        int currentIndex = -1;
        
        NSNumber *objHashItem = nil;
        
        @try {
            
            invItem  = (INVDDestinyInventoryBaseClass*) [note object];
            
            userInfo = [note userInfo];
            
            if (userInfo){
                objHashItem = [userInfo objectForKey:@"itemHashKey"];
                
                if (objHashItem){
                    strHashKey = [NSString stringWithFormat:@"%@",objHashItem];
                }
                
                currentIndexPath = [userInfo objectForKey:@"CurrentIndexPath"];
                
                strIdx  =  [userInfo objectForKey:@"CurrentIndex"];
                
                strSdx = [userInfo objectForKey:@"CurrentSection"];
                
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
               
                if (! [appDelegate.destinyInventoryItemDefinitions.allKeys containsObject:strHashKey] ){
                    
                    if (invItem){
                        
                        INVDResponse *itemResponse = [[INVDResponse alloc] initWithDictionary:[invItem response]];
                        
                        
                        if (itemResponse){
                            [appDelegate.destinyInventoryItemDefinitions setValue:itemResponse forKey:strHashKey];
                            
                            [self updateStaticItemData:[strIdx integerValue] tableSection:[strSdx integerValue] usingStaticBaseItem:invItem];
                        }
                        
                    }
                    
                    
                    
                }
                
            }
            
            
        } @catch (NSException *exception) {
            NSLog(@"ArmorViewController:kDestinyLoadedStaticItemNotification:Exception->%@",exception.description);
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
                *strSdx         = nil,
                 *strIdx         = nil;
        
        INSTBaseClass *instanceBase = nil;
        
        BOOL performUpdate = NO;
        
        ItemCellTableView *cell = nil;
        
        int currentIndex = -1,
            currentSection = -1;
        
        @try {
            
            cData = (NSMutableDictionary*) [note object];
            
            userInfo = [note userInfo];
            
            
            if (userInfo){
                strHashKey = [userInfo objectForKey:@"itemHashKey"];
                strInstanceKey = [userInfo objectForKey:@"itemInstanceId"];
                currentIndexPath = [userInfo objectForKey:@"CurrentIndexPath"];
                strIdx  =  [userInfo objectForKey:@"CurrentIndex"];
                strSdx = [userInfo objectForKey:@"CurrentSection"];
            }
            
            if (strHashKey != nil && strInstanceKey != nil && cData != nil){
                performUpdate = YES;
                
                currentIndex = [strIdx intValue];
                currentSection = [strSdx intValue];
            }
            
            if (performUpdate){
                
                instanceBase  = (INSTBaseClass*) cData;
                
                if (! self->instanceData){
                    self->instanceData = [[NSMutableDictionary alloc] init];
                }
                
                if (! [self->instanceData.allKeys containsObject:strHashKey]){
                    NSLog(@"ArmorViewController:kDestinyLoadedInstancedItemNotification:Adding->%@ to instanceData...",strHashKey);
                    [self->instanceData setValue:instanceBase forKey:strHashKey];
                    [self updateInstancedItemData:[strIdx integerValue] tableSection:[strSdx integerValue]
                               usingInstancedItem:instanceBase
                                 usingInstancedId:strInstanceKey];
                }
                 
                
            }
            
            
        } @catch (NSException *exception) {
            NSLog(@"ArmorViewController:kDestinyLoadedInstancedItemNotification:Exception->%@",exception.description);
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


-(void) loadArmor{
    
    NSArray *armorBuckets = nil;
    
    NSMutableDictionary *charArmor = nil;
    
    NSString *selectedCharacter = nil;
    
    BOOL loadData = NO;
    @try {
        
        [self.tableView.refreshControl beginRefreshing];
        
        if (! self->appDelegate){
            self->appDelegate = [AppDelegate currentDelegate];
        }
    
        if (self.selectedChar){
            selectedCharacter = self.selectedChar;
            
            //[self setTitle:selectedCharacter];
            NSLog(@"2:ArmorTableViewController:loadWeapons:Selected Character->[%d]",selectedCharacter);
        }
        
       if (self.destArmorBuckets){
           armorBuckets = self.destArmorBuckets;
           NSLog(@"1:ArmorTableViewController:loadWeapons:Armor Buckets Count->[%d]",armorBuckets.count);
       }
       
        if (self.destArmor){
            charArmor = self.destArmor;
            NSLog(@"2:ArmorTableViewController:loadWeapons:Character Weapons Count->[%d]",charArmor.count);
            loadData = YES;
        }
        
        if (loadData){
            
            if (! self->instanceData){
                self->instanceData = [[NSMutableDictionary alloc] initWithCapacity:charArmor.count];
            }
            
            [self.tableView reloadData];
            
            if ([self.tableView.refreshControl isRefreshing]){
                [self.tableView.refreshControl endRefreshing];
            }
            
            return;
            
            dispatch_queue_t instancedWeaponQueue ;
            
            instancedWeaponQueue = dispatch_queue_create("com.ams.DestinyHelper.instancedArmorQueue", NULL);
             
            dispatch_async(instancedWeaponQueue, ^{
                
                NSLog(@"[instancedArmorQueue Queue Async ->com.ams.DestinyHelper.instancedArmorQueue Started...]");
                
              
                
                for( NSString *strFullKey in self.destArmor.allKeys){
                    
                    INVCItems *item = [self.destArmor objectForKey:strFullKey];
                    
                    if (item){
                        NSNumber *objHashId  = [[NSNumber alloc] initWithDouble:item.itemHash];
                        
                        NSString *strHashKey = [NSString stringWithFormat:@"%@",objHashId];
                        
                        INVDResponse *itemDef =   [self->appDelegate.destinyInventoryItemDefinitions objectForKey:strHashKey];
                        
                        
                         if (! [self->appDelegate.destinyInventoryItemDefinitions.allKeys containsObject:strHashKey]){
                        
                        [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinyInventoryItemDefinition" staticHashId:strHashKey completionBlock:^(NSArray *values) {
                            
                            if (values){
                                
                            NSLog(@"ArmorTableViewController:loadWeapons:static:Received->%@",strHashKey);
                                    
                            INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                            
                            
                            NSNumber *objLocked = [NSNumber numberWithDouble:item.state];
                                
                            NSString *strLocked = nil;
                                
                            strLocked = [objLocked stringValue];
                            
                                [self->appDelegate.destinyInventoryItemDefinitions setObject:invItem forKey:strHashKey];
                            }
                            
                        } andErrorBlock:^(NSError *exception) {
                            NSLog(@"ArmorViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Exception->%@",exception.description);
                        }];
                            
                        }
                        
                        if (item.itemInstanceId){
                
                            
                            if (![self->instanceData.allKeys containsObject:strHashKey]){
                            
                            [NetworkAPISingleClient getInstancedItem:item.itemInstanceId completionBlock:^(NSArray *values){
                            
                                if (values){
                                
                                INSTBaseClass *instanceBase = (INSTBaseClass*) [values firstObject];
                                    
                                
                                 [self->instanceData setObject:instanceBase forKey:strHashKey];
                                    
                                    
                                }
                                
                            }andErrorBlock:^(NSError *exception){
                                NSLog(@"ArmorViewController:NetworkAPISingleClient:getInstancedItem:Exception->%@",exception.description);
                            }];
                                
                            }
                        }
                        
                    }
                    
                }
                    
                
                NSLog(@"[instancedArmorQueue Queue Async ->com.ams.DestinyHelper.instancedArmorQueue Done!]");
                
            });
            
          
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"ArmorTableViewController:loadWeapons:Exception->%@",exception.description);
    }
    @finally {
        
    }
    
}


- (void)closeAction {
    
    NSLog(@"ArmorViewController:closeAction:Invoked...");
    
    [self dismissViewControllerAnimated:NO completion:^{
        NSLog(@"ArmorViewController:closeAction:Completed...");
    }];
        
    
}

-(void) initTableView{
    
    NSString *message =  @"2:ArmorTableViewController:initTableView...";
    @try {
        
        
        if (! self.tableView){
            self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f,
                                                                          self.view.frame.size.width, self.view.frame.size.height)];
            
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.view.frame.size.height-20, 0);
            
           
        }
        
        [self.tableView registerNib:[UINib nibWithNibName:@"ItemCellTableView"
                                                  bundle:nil]
            forCellReuseIdentifier:@"ItemCellTableView"];
        
        [self.tableView setDelegate:self];
        [self.tableView setDataSource:self];
        
        [self.refreshControl addTarget:self action:@selector(loadArmor)
                      forControlEvents:UIControlEventValueChanged];
         
        

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

-(void) updateInstancedItemData:(int) itemIndex
                   tableSection:(int) itemSection
             usingInstancedItem:(INSTBaseClass *) anyInstancedItem
               usingInstancedId:(NSString *) anyInstancedId {
    

    INSTBaseClass *instanceBase  = nil;
    
    BOOL hasUncommitedChanges = NO,
         performUpdates = NO;
    
    NSArray<NSIndexPath *> *visibleIndexPaths = nil;
    
    @try {
        instanceBase = (INSTBaseClass *) anyInstancedItem ;
       
       
        hasUncommitedChanges = [self.tableView hasUncommittedUpdates];
        
        visibleIndexPaths =  [self.tableView indexPathsForVisibleRows];
        
        NSIndexPath *cIndexPath = nil;
      
        if (!hasUncommitedChanges){
            
            //for (int idx = 0; idx < visibleIndexPaths.count ; idx++ ) {
              
                NSIndexPath *iPath = [NSIndexPath indexPathForRow:itemIndex inSection:itemSection];
                
                if (iPath){
                   // if (idx == itemIndex){
                        performUpdates = YES;
                        cIndexPath = iPath;
                      //  break;
                }
                
           // }
            
  
        }
        else{
           
          NSLog(@"ArmorViewController:updateInstancedItemData:itemIndex [%d] returning to due hasUncommitedChanges", itemIndex);
          return;

        }
        
        if (performUpdates){
        
        [self.tableView performBatchUpdates:^{
            
            [self.tableView beginUpdates];
            
            
            if (instanceBase){
                
                ItemCellTableView *cell = [self.tableView cellForRowAtIndexPath:cIndexPath];
                
                NSLog(@"ArmorViewController:updateInstancedItemData:For IndexPath Section->[%d],Row->[%d]",cIndexPath.section, cIndexPath.row);
                
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
                                
                                NSNumber *objIsEquipped = [data objectForKey:@"isEquipped"];
                                
                                if (objIsEquipped){
                                    
                                    BOOL isEquipped = [objIsEquipped boolValue];
                                    
                                    [cell.layer setMasksToBounds:NO];
                                    [cell.layer setCornerRadius:0];
                                    [cell.layer setBorderWidth:1];
                                    [cell.layer setShadowOffset: CGSizeMake(0, 0)];
                                    [cell.layer setBorderColor:[UIColor darkGrayColor].CGColor];
                                    
                                      if (isEquipped){
                                          
                                        [cell.layer setMasksToBounds:YES];
                                        [cell.layer setCornerRadius:5];
                                        [cell.layer setBorderWidth:2];
                                        [cell.layer setShadowOffset: CGSizeMake(-1, 1)];
                                        [cell.layer setBorderColor:[UIColor systemOrangeColor].CGColor];
                                          
                                        [cell setHighlighted:YES];
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
            [self.tableView endUpdates];
        }
        completion:^(BOOL finished) {
            if (finished){
                NSLog( @"ArmorViewController:updateInstancedItemData:performBatchUpdates:finished!");
            }
        }];
            
        }
        else{
            NSLog(@"ArmorViewController:updateInstancedItemData has uncommited changes, waiting...");
        }
        
        
    } @catch (NSException *exception) {
        NSLog(@"ArmorViewController:updateInstancedItemData:Exception->%@",exception.description);
    } @finally {
        instanceBase = nil;
        hasUncommitedChanges = NO;
    }
}


-(void) updateStaticItemData:(int) itemIndex  tableSection:(int) itemSection usingStaticBaseItem:(INVDDestinyInventoryBaseClass *) anyStaticItem {
    
    INVDDestinyInventoryBaseClass *invItem  = anyStaticItem;
    
    BOOL hasUncommitedChanges = NO,
         performUpdates       = NO;
    
    NSArray<NSIndexPath *> *visibleIndexPaths = nil;
    
    @try {
        
        hasUncommitedChanges = [self.tableView hasUncommittedUpdates];
        
        visibleIndexPaths =  [self.tableView indexPathsForVisibleRows];
        
        NSIndexPath *cIndexPath = nil;
        
       
        if (! hasUncommitedChanges){
            
           
           // for (int idx = 0; idx < visibleIndexPaths.count ; idx++ ) {
              
                NSIndexPath *iPath = [NSIndexPath indexPathForRow:itemIndex inSection:itemSection];
                
                if (iPath){
                    //if (idx == itemIndex){
                        performUpdates = YES;
                        cIndexPath = iPath;
                    //    break;
                   // }
                }
                
            //}
            
            if (hasUncommitedChanges){
                performUpdates = NO;
                NSLog(@"updateStaticItemData:For IndexPath Section->[%d],Row->[%d] returning due to hasUncommitedChanges",cIndexPath.section, cIndexPath.row);
            }
 
            [self.tableView performBatchUpdates:^{
               // [self.tblItems beginUpdates];
                if (invItem){
                    
                    ItemCellTableView *cell = [self.tableView cellForRowAtIndexPath:cIndexPath];
                    
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
                                
                            }
                            
                            t = [invResponse defaultDamageType];
                            i= (int) t;
                            
                            objDamageType =  [NSString stringWithFormat:@"%d",i];
                            
                            if (objDamageType){
                            
                                itemDamageType = [Utilities decodeDamageType:objDamageType.intValue];
                            
                                if (itemDamageType){
                                    [cell.lblDamageType setTextColor:[UIColor lightGrayColor]];
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
                        NSLog(@"ArmorViewController:updateStaticItemData:performBatchUpdates:finished!");
                    }
            }];
    
           /* if (! hasUncommitedChanges){
                [self.tableView beginUpdates];
                 [self.tableView reloadRowsAtIndexPaths:visibleIndexPaths withRowAnimation:UITableViewRowAnimationNone];
                [self.tableView endUpdates];
            }*/
            
        }else{
            NSLog(@"ArmorViewController:updateStaticItemData has uncommited changes, waiting to be done...");
        }
            
      
    } @catch (NSException *exception) {
        NSLog(@"ArmorViewController:updateStaticItemData:Exception->%@",exception.description);
    } @finally {
        invItem = nil;
    }
    
}

 


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger sections = 0;
    
    if (self.destArmorBuckets){
        sections = [self.destArmorBuckets count];
    }
    
    return sections;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *title = nil,
             *bucketHash = nil;
    
    [tableView refreshControl];
    
    int TotalArmor  = 10,
       CurrentArmor = 0;
    
    DestinyInventoryBucketDefinition *buckDef = nil;
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
        
        @try {
            
            switch (section) {
                case 0:
                    CurrentArmor = [self->helmets count];
                    break;
                case 1:
                    CurrentArmor = [self->gauntles count];
                    break;
                case 2:
                    CurrentArmor = [self->chestArmor count];
                    break;
                case 3:
                    CurrentArmor = [self->legArmor count];
                    break;
                case 4:
                    CurrentArmor = [self->classArmor count];
                    break;
            }
            
            bucketHash = [self.destArmorBuckets objectAtIndex:section];
            
            if (appDelegate.destinyInventoryBucketDefinitions){
                
                buckDef =  [appDelegate.destinyInventoryBucketDefinitions objectForKey:bucketHash];
                if (buckDef){
                    title  = [NSString stringWithFormat:@"%@: [%d/%d]",[buckDef.displayProperties name],CurrentArmor
                              ,TotalArmor];
                }
                
            }
            
        } @catch (NSException *exception) {
            NSLog(@"titleForHeaderInSection:Exception->%@",exception.description);
        } @finally {
            bucketHash = nil;
            buckDef = nil;
            CurrentArmor = 0;
            TotalArmor = 0;
        }
        
   
    
    return title;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 0,
              hRows = 0,
              gRows = 0,
              cRows = 0,
              lRows = 0,
              aRows = 0;
    
    NSArray *armorArray = [[NSArray alloc] initWithObjects:@"1498876634",@"2465295065",@"953998645",nil];
    
    NSString *strLookupKey = @"%@_%@";
    
    if (self.destArmor){
        
        
        @try {
            
            if (! self->helmets){
                self->helmets = [[NSMutableArray alloc] init];
            }
            else{
                if (section == 0){
                    if ([self->helmets count] > 0){
                        rows = [self->helmets count];
                        return rows;
                    }
                }
            }
            
            if (! self->gauntles){
                self->gauntles = [[NSMutableArray alloc] init];
            }else{
                if (section == 1){
                    if ([self->gauntles count] > 0){
                    rows = [self->gauntles count];
                    return rows;
                    }
                }
            }
            
            if (! self->chestArmor){
                self->chestArmor = [[NSMutableArray alloc] init];
            }else{
                if (section == 2){
                    if ([self->chestArmor count] > 0){
                    rows = [self->chestArmor count];
                    return rows;
                    }
                }
            }
            
            if (! self->legArmor){
                self->legArmor = [[NSMutableArray alloc] init];
            }else{
                if (section == 3){
                    if ([self->legArmor count] > 0){
                    rows = [self->legArmor count];
                    return rows;
                    }
                }
            }
            
            if (! self->classArmor){
                self->classArmor = [[NSMutableArray alloc] init];
            }else{
                if (section == 4){
                    if ([self->classArmor count] > 0){
                    rows = [self->classArmor count];
                    return rows;
                    }
                }
            }
            
            if (self.destArmorBuckets){
                armorArray = self.destArmorBuckets;
            }
            
            strLookupKey = [NSString stringWithFormat:strLookupKey,self.selectedChar,[armorArray objectAtIndex:section]];
            
            
            for (NSString *armorKey in self.destArmor.allKeys ) {
                 
                if ([armorKey containsString:strLookupKey]){
                    
                    switch (section) {
                        case 0:
                          
                            [self->helmets addObject:armorKey];
                            hRows +=1;
                            break;
                            
                        case 1:
                            [self->gauntles addObject:armorKey];
                            gRows +=1;
                            break;
                            
                        case 2:
                            [self->chestArmor addObject:armorKey];
                            cRows +=1;
                            break;
                            
                        case 3:
                            [self->legArmor addObject:armorKey];
                            lRows +=1;
                            break;
                        case 4:
                            [self->classArmor addObject:armorKey];
                            aRows +=1;
                            break;
                    }
                    
                }
            }
            
            switch (section) {
                case 0:
                  
                    rows = hRows;
                    break;
                    
                case 1:
                   
                    rows = gRows;
                    break;
                    
                case 2:
                    
                    rows = cRows;
                    break;
                case 3:
                    
                    rows = lRows;
                    break;
                case 4:
                    
                    rows = aRows;
                    break;
            }
            
        }
        @catch (NSException *exception) {
            NSLog(@"numberOfRowsInSection:Exception->%@",exception.description);
        } @finally {
            strLookupKey = nil;
            armorArray = nil;
        }
        
    }
    
    return rows;
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        NSInteger size = 120;
     
    return size;
}
/*
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSString *message   = nil;
    static NSString *cellId = @"ItemCellTableView";
    ItemCellTableView *gCell = nil;
    @try {
        
        
        //gCell = (ItemCellTableView*) [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        
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
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  
    ItemCellTableView *cell = nil;
    
    static NSString *cellId = @"ItemCellTableView";
    
  
    NSString *strFullKey = nil,
             *strLookUpKey = nil,
             *strBucketKey = nil;
    
    INVDDestinyInventoryBaseClass *staticBase = nil;
    
    INSTBaseClass *instanceBase = nil;
    
    NSMutableArray *groupItems = nil;
     
    @try {
        
        cell = (ItemCellTableView*) [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        
        //cell = (ItemCellTableView*) [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (! cell){
            cell = [[ItemCellTableView alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:cellId];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
         
        }
        
        [cell setParentTableView:self.tableView];
        [cell setParentViewController:self];
        
     
        NSLog(@"ArmorTableViewController:cellForRowAtIndexPath:Section->%d,Row->%d,",indexPath.section,indexPath.row);

        if (! self->helmets || (! self->gauntles) || (! self->chestArmor) || (! self->chestArmor) || (! self->legArmor) || (! self->classArmor)  ){
            
            strBucketKey = [self.destArmorBuckets objectAtIndex:indexPath.section];
              
            strLookUpKey = [NSString stringWithFormat:@"%@_%@",self.selectedChar,strBucketKey];
              
              groupItems = [[NSMutableArray alloc] init];
              
              for (NSString *itemKey in self.destArmor.allKeys) {
                  
                  if ([itemKey containsString:strLookUpKey]){
                      [groupItems addObject:itemKey];
                  }
                  
              }
              
              strFullKey = [groupItems objectAtIndex:indexPath.row];
        }
        
        switch (indexPath.section) {
            case 0:
                
                if (self->helmets){
                    strFullKey = [self->helmets objectAtIndex:indexPath.row];
                }
                 
                break;
                
            case 1:
                
                if (self->gauntles){
                    strFullKey = [self->gauntles objectAtIndex:indexPath.row];
                }
              
                
                break;
                
            case 2:
                
                if (self->chestArmor){
                    strFullKey = [self->chestArmor objectAtIndex:indexPath.row];
                }
                
                break;
            case 3:
                
                if (self->legArmor){
                    strFullKey = [self->legArmor objectAtIndex:indexPath.row];
                }
                
                break;
            case 4:
                
                if (self->classArmor){
                    strFullKey = [self->classArmor objectAtIndex:indexPath.row];
                }
                
                break;
        }
        
        
        if (self.destArmor){
        
            
            INVCItems *item = [self.destArmor objectForKey:strFullKey];
            
            
            if (item){
            
                NSNumber *objHashId  = [[NSNumber alloc] initWithDouble:item.itemHash];
                
                NSString *strHashKey = [NSString stringWithFormat:@"%@",objHashId];
                
                if (cell){
                    
                    [cell.lblCharacterId setText:self.selectedChar];
                    
                    if (appDelegate.destinyInventoryItemDefinitions){
                        
                        INVDResponse *itemDef =   [appDelegate.destinyInventoryItemDefinitions objectForKey:strHashKey];
                        
                        
                        if (itemDef){
                           
                        
                            NSString    *itemTypeName   = nil,
                                        *itemName       = nil,
                                        *itemDamageType = nil,
                                        *itemScreenShot = nil,
                                        *objDamageType  = nil,
                                        *strHashKey     = nil;
                            
                            double t = 0;
                            int    i = 0;
                            
                  
                            NSNumber *objHash = [NSNumber numberWithDouble:[itemDef hash]];
                            
                            strHashKey = [objHash stringValue];
                            [cell.lblHash setText:strHashKey];
                               
                            
                            itemTypeName   =  [itemDef itemTypeDisplayName];
                            
                            itemScreenShot = [itemDef screenshot];
                            
                            if (itemTypeName){
                                [cell.lblItemType setText:itemTypeName];
                            }
                            
                            if (itemScreenShot){
                                [cell.lblMisc setText:itemScreenShot];
                                
                            }
                            
                            t = [itemDef defaultDamageType];
                            i= (int) t;
                            
                            objDamageType =  [NSString stringWithFormat:@"%d",i];
                            
                            if (objDamageType){
                            
                                itemDamageType = [Utilities decodeDamageType:objDamageType.intValue];
                            
                                if (itemDamageType){
                                    
                                    [cell.lblDamageType setTextColor:[UIColor lightGrayColor]];
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
                            
                          
                            INVDDisplayProperties *invDisplayProps = (INVDDisplayProperties* )itemDef.displayProperties;
                             
                            NSString *imageName     = nil,
                                    *baseURL       = nil,
                                    *emblem        = nil;
                            
                            NSURL    *imageURL      = nil,
                                    *emblemURL     = nil;
                            
                            if (invDisplayProps){
                                
                                
                                
                                if (invDisplayProps.hasIcon){
                                    
                                    emblem =  invDisplayProps.icon;
                                    
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
                                    
                                }
                                
                                itemName = [invDisplayProps name];
                                [cell.lblItemName setText:itemName];
                            }
                            
                            if (self->instanceData){
                                
                                INSTBaseClass *instanceBase = [self->instanceData objectForKey:strHashKey];
                                
                                if (instanceBase){
                                   
                                    NSDictionary *response = (NSDictionary *)[instanceBase response];
                                    
                                    if (response){
                                        
                                        NSDictionary *instance = (NSDictionary*) [response objectForKey:@"instance"];
                                        
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
                                                    [cell.layer setBorderColor:[UIColor darkGrayColor].CGColor];
                                                    
                                                      if (isEquipped){
                                                          
                                                        [cell.layer setMasksToBounds:YES];
                                                        [cell.layer setCornerRadius:5];
                                                        [cell.layer setBorderWidth:2];
                                                        [cell.layer setShadowOffset: CGSizeMake(-1, 1)];
                                                        [cell.layer setBorderColor:[UIColor systemOrangeColor].CGColor];
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
                                else{
                                    
                                                                        
                                    [NetworkAPISingleClient getInstancedItem:item.itemInstanceId completionBlock:^(NSArray *values){
                                    
                                        if (values){
                                        
                                            INSTBaseClass *instanceBase = (INSTBaseClass*) [values firstObject];
                                                
                                            NSString *strIDX = nil,
                                                     *strSDX = nil;
                                               
                                            strIDX = [NSString stringWithFormat:@"%d",indexPath.row];
                                            strSDX = [NSString stringWithFormat:@"%d",indexPath.section];
                                            
                                                
                                            NSDictionary *callerInfo = [[NSDictionary alloc]
                                                            initWithObjectsAndKeys:@"ArmorViewController",@"ClassName",
                                                                                    @"getInstancedItem",@"MethodName",
                                                                                    strIDX,@"CurrentIndex",
                                                                                    strSDX,@"CurrentSection",
                                                                                    strHashKey, @"itemHashKey",
                                                                                    item.itemInstanceId, @"itemInstanceId",nil];
                                                
                                            [[NSNotificationCenter defaultCenter]
                                                    postNotificationName:kDestinyLoadedInstancedItemNotification
                                                                    object:instanceBase
                                                                    userInfo:callerInfo];
                                                
                                NSLog(@"ArmorViewController:NetworkAPISingleClient:kDestinyLoadedInstancedItemNotification:Raised->%@",strHashKey);
                                            
                                            
                                        }
                                        
                                    }andErrorBlock:^(NSError *exception){
                                        NSLog(@"ArmorViewController:NetworkAPISingleClient:getInstancedItem:Exception->%@",exception.description);
                                    }];
 
                                    
                                }
                              
                            }
                            
                        }
                        else{
                            NSLog(@"ArmorTableViewController:cellForRowAtIndexPath:Unable to find destinyInventoryItemDefinition for[%@]",strHashKey);
                            
                            
                            [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinyInventoryItemDefinition" staticHashId:strHashKey completionBlock:^(NSArray *values) {
                                
                                if (values){
                                  
                                NSLog(@"ArmorTableViewController:retrieveStaticEntityDefinitionByManifestType:Received->%@",strHashKey);
                                      
                                INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                                
                                
                                NSNumber *objLocked = [NSNumber numberWithDouble:item.state];
                                    
                                NSString *strIDX = nil,
                                         *strSDX = nil,
                                         *strLocked = nil;
                                   
                                   
                                strIDX = [NSString stringWithFormat:@"%d",indexPath.row];
                                strSDX = [NSString stringWithFormat:@"%d",indexPath.section];
                                    
                                strLocked = [objLocked stringValue];
                                    
                                NSDictionary *callerInfo = [[NSDictionary alloc]
                                                  initWithObjectsAndKeys:@"ArmorViewController",@"ClassName",
                                                  @"getStaticItem",@"MethodName",
                                                  strIDX,@"CurrentIndex",
                                                  strSDX,@"CurrentSection",
                                                  strLocked, @"LockState",
                                                  strHashKey, @"itemHashKey",nil];
                                      
                                [[NSNotificationCenter defaultCenter]
                                        postNotificationName:kDestinyLoadedStaticItemNotification
                                                      object:invItem
                                                        userInfo:callerInfo];
                                    
                                NSLog(@"ArmorViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Raised->%@",strHashKey);
                                
                                }
                                
                            } andErrorBlock:^(NSError *exception) {
                             NSLog(@"ArmorViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Exception->%@",exception.description);
                            }];
                             
                        }
                        
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
 

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
