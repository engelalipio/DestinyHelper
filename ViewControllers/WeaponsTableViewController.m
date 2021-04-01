//
//  WeaponsTableViewController.m
//  DestinyHelper
//
//  Created by Bertle on 3/19/21.
//  Copyright © 2021 Agile Mobile Solutions. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "WeaponsTableViewController.h"
#import "ItemCellTableView.h"
#import "AppDelegate.h"
#import "DataModels.h"
#import "INVDDisplayProperties.h"
#import "Utilities.h"
#import "Constants.h"
#import "NetworkAPISingleClient+Definition.h"
#import "NetworkAPISingleClient+LinkedProfiles.h"
#import "ItemCollectionView.h"
#import "ItemTableViewCell.h"
#import "ItemCollectionViewCell.h"
@interface WeaponsTableViewController ()
{
    AppDelegate *appDelegate;
    
    NSMutableArray *primaryWeapons,
                   *energyWeapons,
                   *powerWeapons;
    
    NSMutableDictionary *instanceData;
    
    NSInteger sharedSection ;
    
    BOOL useCView;
}

@property (nonatomic, strong) NSMutableArray *primaryWeaponsArray;
@property (nonatomic, strong) NSMutableArray *energyWeaponsArray;
@property (nonatomic, strong) NSMutableArray *heavyWeaponsArray;
@property (nonatomic, strong) NSArray *colorArray;

@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;

@end

@implementation WeaponsTableViewController

@synthesize destWeapons = _destWeapons;
@synthesize selectedChar = _selectedChar;
@synthesize selectedMembership = _selectedMembership;
@synthesize destWeaponBuckets = _destWeaponBuckets;

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
    
 
    self->useCView = NO;
    
    self->appDelegate = [AppDelegate currentDelegate];
    
    [self initTableView];
    
    [self registerNotifications];
    
}


- (void)closeAction {
    
    NSLog(@"WeaponsViewController:closeAction:Invoked...");
    
    [self dismissViewControllerAnimated:NO completion:^{
        NSLog(@"WeaponsViewController:closeAction:Completed...");
    }];
        
    
}

-(void) registerNotifications{

    NSLog(@"1:WeaponsViewController:registerNotifications...");
    
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
            NSLog(@"WeaponsViewController:kDestinyLoadedStaticItemNotification:Exception->%@",exception.description);
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
                    NSLog(@"WeaponsViewController:kDestinyLoadedInstancedItemNotification:Adding->%@ to instanceData...",strHashKey);
                    [self->instanceData setValue:instanceBase forKey:strHashKey];
                    [self updateInstancedItemData:[strIdx integerValue] tableSection:[strSdx integerValue]
                               usingInstancedItem:instanceBase
                                 usingInstancedId:strInstanceKey];
                }
                 
                
            }
            
            
        } @catch (NSException *exception) {
            NSLog(@"WeaponsViewController:kDestinyLoadedInstancedItemNotification:Exception->%@",exception.description);
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


- (IBAction)toggleTableAction:(UISegmentedControl *)sender {
    
   
    switch (sender.selectedSegmentIndex) {
        case 0:
            self->useCView = NO;
            
            break;
            
        case 1:
            self->useCView = YES;
            [self prepareCollection];
            break;
    }
    
    
    if (! [self.tableView hasUncommittedUpdates]){
        [self.tableView reloadData];
      
    }

    
}

-(void) viewDidLayoutSubviews{
    if (! self->useCView){
     //   [self prepareCollection];
    }
}

-(void) loadWeapons{
    
    NSArray *weaponBuckets = nil;
    
    NSMutableDictionary *charWeapons = nil;
    
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
            NSLog(@"2:WeaponsTableViewController:loadWeapons:Selected Character->[%d]",selectedCharacter);
        }
        
       if (self.destWeaponBuckets){
           weaponBuckets = self.destWeaponBuckets;
           NSLog(@"1:WeaponsTableViewController:loadWeapons:Weapon Buckets Count->[%d]",weaponBuckets.count);
       }
       
        if (self.destWeapons){
            charWeapons = self.destWeapons;
            NSLog(@"2:WeaponsTableViewController:loadWeapons:Character Weapons Count->[%d]",charWeapons.count);
            loadData = YES;
        }
        
        
        if (loadData){
            
            if (! self->instanceData){
                self->instanceData = [[NSMutableDictionary alloc] initWithCapacity:charWeapons.count];
            }
            
            
            [self.tableView reloadData];
            
            if ([self.tableView.refreshControl isRefreshing]){
                [self.tableView.refreshControl endRefreshing];
            }
            
            return;
            
            dispatch_queue_t instancedWeaponQueue ;
            
            instancedWeaponQueue = dispatch_queue_create("com.ams.DestinyHelper.instancedWeaponsQueue", NULL);
             
            dispatch_async(instancedWeaponQueue, ^{
                
                NSLog(@"[instancedWeaponsQueue Queue Async ->com.ams.DestinyHelper.instancedWeaponsQueue Started...]");
                
                for( NSString *strFullKey in self.destWeapons.allKeys){
                    
                    INVCItems *item = [self.destWeapons objectForKey:strFullKey];
                    
                    if (item){
                        NSNumber *objHashId  = [[NSNumber alloc] initWithDouble:item.itemHash];
                        
                        NSString *strHashKey = [NSString stringWithFormat:@"%@",objHashId];
                        
                        INVDResponse *itemDef =   [self->appDelegate.destinyInventoryItemDefinitions objectForKey:strHashKey];
                        
                         if (! [self->appDelegate.destinyInventoryItemDefinitions.allKeys containsObject:strHashKey]){
                        
                        [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinyInventoryItemDefinition" staticHashId:strHashKey completionBlock:^(NSArray *values) {
                            
                            if (values){
                                
                            NSLog(@"WeaponsTableViewController:loadWeapons:static:Received->%@",strHashKey);
                                    
                            INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                            
                            
                            NSNumber *objLocked = [NSNumber numberWithDouble:item.state];
                                
                            NSString *strLocked = nil;
                                
                            strLocked = [objLocked stringValue];
                            
                                [self->appDelegate.destinyInventoryItemDefinitions setObject:invItem forKey:strHashKey];
                            }
                            
                        } andErrorBlock:^(NSError *exception) {
                            NSLog(@"WeaponsViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Exception->%@",exception.description);
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
                                NSLog(@"WeaponsViewController:NetworkAPISingleClient:getInstancedItem:Exception->%@",exception.description);
                            }];
                                
                            }
                        }
                        
                    }
                    
                }
                    
                
                NSLog(@"[instancedWeaponsQueue Queue Async ->com.ams.DestinyHelper.instancedWeaponsQueue Done!]");
                
            });
            
          
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"WeaponsTableViewController:loadWeapons:Exception->%@",exception.description);
    }
    @finally {
        
    }
    
}

-(void) prepareCollection{
    
    const NSInteger numberOfTableViewRows = 2;
    const NSInteger numberOfCollectionViewCells = 10;
    
    NSInteger nOfWeaponBuckets = numberOfTableViewRows;
    
    if (self.destWeaponBuckets){
        nOfWeaponBuckets = [self.destWeaponBuckets count];
    }
    
    if ( self.primaryWeaponsArray && self.energyWeaponsArray && self.heavyWeaponsArray ){
        return;
    }
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:nOfWeaponBuckets];
    
    for (NSInteger tableViewRow = 0; tableViewRow < nOfWeaponBuckets; tableViewRow++)
    {
    
        switch (tableViewRow) {
            case 0:
                
                if (self->primaryWeapons)
                {
                    NSMutableArray *pWArray  = [NSMutableArray arrayWithCapacity:[self->primaryWeapons count]];
                    for (NSString *pKey in self->primaryWeapons) {
                        
                        [pWArray addObject:pKey];
                        
                    }
                    self.primaryWeaponsArray = [NSMutableArray arrayWithArray:pWArray];
                }
                
                break;
                
            case 1:
                
                if (self->energyWeapons)
                {
                    NSMutableArray *eWArray  = [NSMutableArray arrayWithCapacity:[self->energyWeapons count]];
                    for (NSString *pKey in self->energyWeapons) {
                        
                        [eWArray addObject:pKey];
                        
                    }
                    self.energyWeaponsArray = [NSMutableArray arrayWithArray:eWArray];
                }
                
                break;
                
            case 2:
                
                if (self->powerWeapons)
                {
                    NSMutableArray *pWArray  = [NSMutableArray arrayWithCapacity:[self->powerWeapons count]];
                    for (NSString *pKey in self->powerWeapons) {
                        
                        [pWArray addObject:pKey];
                        
                    }
                    self.heavyWeaponsArray = [NSMutableArray arrayWithArray:pWArray];
                }
                
                break;
        }
        
        

    }
    
   // self.colorArray = [NSArray arrayWithArray:mutableArray];
    
    self.contentOffsetDictionary = [NSMutableDictionary dictionary];
    
    NSArray<NSIndexPath*> *vIndexes = [self.tableView indexPathsForVisibleRows];
    
    if (vIndexes){
        
        if (vIndexes.count < self.destWeaponBuckets.count){
            
            NSIndexSet *iSet = [[NSIndexSet alloc] initWithIndex:2];
            [self.tableView reloadSections:iSet withRowAnimation:UITableViewRowAnimationAutomatic];
            
        }
    }
     
  
    
}

 

-(void) initTableView{
    
    NSString *message =  @"2:WeaponsTableViewController:initTableView...";
    @try {
        
        
        if (! self.tableView){
            self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f,
                                                                          self.view.frame.size.width, self.view.frame.size.height)];
            
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.view.frame.size.height-20, 0);
        }
        
        [self.tableView registerNib:[UINib nibWithNibName:@"ItemCellTableView"
                                                  bundle:nil]
            forCellReuseIdentifier:@"ItemCellTableView"];
        
        if (self->useCView){
            
            [self.tableView registerNib:[UINib nibWithNibName:@"ItemTableViewCell"
                                                      bundle:nil]
                forCellReuseIdentifier:@"CellIdentifier"];
            
            
        }
        
        [self.tableView setDelegate:self];
        [self.tableView setDataSource:self];
        
        [self.refreshControl addTarget:self action:@selector(loadWeapons)
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
           
          NSLog(@"WeaponsViewController:updateInstancedItemData:itemIndex [%d] returning to due hasUncommitedChanges", itemIndex);
          return;

        }
        
        if (performUpdates){
        
        [self.tableView performBatchUpdates:^{
            
            [self.tableView beginUpdates];
            
            
            if (instanceBase){
                
                ItemCellTableView *cell = [self.tableView cellForRowAtIndexPath:cIndexPath];
                
                ItemTableViewCell *cCell = [self.tableView cellForRowAtIndexPath:cIndexPath];
                
                if (self->useCView){
                    [cCell setHidden:NO];
                    [cell setHidden:YES];
                }else{
                    [cCell setHidden:YES];
                    [cell setHidden:NO];
                }
                
    NSLog(@"WeaponsViewController:updateInstancedItemData:For IndexPath Section->[%d],Row->[%d]",cIndexPath.section, cIndexPath.row);
                
                if (anyInstancedId){
                    [cell.lblInstanceId setText:anyInstancedId];
                    [cCell.lblInstanceId setText:anyInstancedId];
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
                                    [cell.layer setBorderColor:[UIColor clearColor].CGColor];
                                    
                                    [cCell.layer setMasksToBounds:NO];
                                    [cCell.layer setCornerRadius:0];
                                    [cCell.layer setBorderWidth:1];
                                    [cCell.layer setShadowOffset: CGSizeMake(0, 0)];
                                    [cCell.layer setBorderColor:[UIColor clearColor].CGColor];
                                    
                                      if (isEquipped){
                                          
                                        [cell.layer setMasksToBounds:YES];
                                        [cell.layer setCornerRadius:5];
                                        [cell.layer setBorderWidth:3];
                                        [cell.layer setShadowOffset: CGSizeMake(-1, 1)];
                                        [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
                                          
                                          [cCell.layer setMasksToBounds:YES];
                                          [cCell.layer setCornerRadius:5];
                                          [cCell.layer setBorderWidth:3];
                                          [cCell.layer setShadowOffset: CGSizeMake(-1, 1)];
                                          [cCell.layer setBorderColor:[UIColor whiteColor].CGColor];
                                          
                                        [cell setHighlighted:YES];
                                          
                                        [cCell setHighlighted:YES];
                                      }
                                       
                                }
                              
                                
                                NSDictionary *pStat = (NSDictionary*) [data objectForKey:@"primaryStat"] ;
                                
                                if (pStat){
                                    NSObject *objValue =   [pStat objectForKey:@"value"];
                                    if (objValue){
                                        [cell.lblPowerLevel setText:[NSString stringWithFormat:@"%@",objValue]];
                                        [cCell.lblPowerLevel setText:[NSString stringWithFormat:@"%@",objValue]];
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
                NSLog( @"WeaponsViewController:updateInstancedItemData:performBatchUpdates:finished!");
            }
        }];
            
        }
        else{
            NSLog(@"WeaponsViewController:updateInstancedItemData has uncommited changes, waiting...");
        }
        
        
    } @catch (NSException *exception) {
        NSLog(@"WeaponsViewController:updateInstancedItemData:Exception->%@",exception.description);
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
                    
                    ItemTableViewCell *cCell = [self.tableView cellForRowAtIndexPath:cIndexPath];
                    
                    if (self->useCView){
                        [cCell setHidden:NO];
                        [cell setHidden:YES];
                    }else{
                        [cCell setHidden:YES];
                        [cell setHidden:NO];
                    }
                    
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
                                [cCell.lblCharacterId setText:strCharacterId];
                            }
                            
                            if (invItem.message){
                                
                                switch([invItem.message integerValue]){
                                    case 0:
                                        [cell.btnLockAction setImage:[UIImage systemImageNamed:@"lock.open"] forState:UIControlStateNormal];
                                        
                                        [cCell.btnLockAction setImage:[UIImage systemImageNamed:@"lock.open"] forState:UIControlStateNormal];
                                        break;
                                    case 1:
                                        [cell.btnLockAction setImage:[UIImage systemImageNamed:@"lock"]
                                                            forState:UIControlStateNormal];
                                        
                                        [cCell.btnLockAction setImage:[UIImage systemImageNamed:@"lock"]
                                                            forState:UIControlStateNormal];
                                        break;
                                }
                            }
                            
                            if (cell.lblHash.text.length == 0){
                                strHashKey = [objHash stringValue];
                                [cell.lblHash setText:strHashKey];
                                NSLog(@"updateStaticItemData:For %@ IndexPath Section->[%d],Row->[%d]",strHashKey,cIndexPath.section, cIndexPath.row);
                            }
                            
                            if (cCell.lblHash.text.length == 0){
                                strHashKey = [objHash stringValue];
                                [cCell.lblHash setText:strHashKey];
                                NSLog(@"updateStaticItemData:For %@ IndexPath Section->[%d],Row->[%d]",strHashKey,cIndexPath.section, cIndexPath.row);
                            }
                            
                            itemTypeName   =  [invResponse itemTypeDisplayName];
                            
                            itemScreenShot = [invResponse screenshot];
                            
                            if (itemTypeName){
                                [cell.lblItemType setText:itemTypeName];
                                [cCell.lblItemType setText:itemTypeName];
                            }
                            
                            if (itemScreenShot){
                                [cell.lblMisc setText:itemScreenShot];
                                [cCell.lblMisc setText:itemScreenShot];
                            }
                            
                            t = [invResponse defaultDamageType];
                            i= (int) t;
                            
                            objDamageType =  [NSString stringWithFormat:@"%d",i];
                            
                            if (objDamageType){
                            
                                itemDamageType = [Utilities decodeDamageType:objDamageType.intValue];
                            
                                if (itemDamageType){
                                    [cell.lblDamageType setTextColor:[UIColor lightGrayColor]];
                                    [cell.lblDamageType setText:itemDamageType];
                                    

                                    if ([itemDamageType isEqualToString:@"Arc"]){
                                        //[cell.lblDamageType setTextColor:[UIColor cyanColor]];
                                        [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_arc.png"]];
                                        [cell.lblDamageType setText:@"Damage"];
                                    }
                                    if ([cell.lblDamageType.text isEqualToString:@"Solar"]){
                                        //[cell.lblDamageType setTextColor:[UIColor systemYellowColor]];
                                        [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_solar.png"]];
                                        [cell.lblDamageType setText:@"Damage"];
                                    }
                                    if ([cell.lblDamageType.text isEqualToString:@"Void"]){
                                        //[cell.lblDamageType setTextColor:[UIColor systemPurpleColor]];
                                        [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_void.png"]];
                                        [cell.lblDamageType setText:@"Damage"];
                                    }
                                    if ([cell.lblDamageType.text isEqualToString:@"Stasis"]){
                                       // [cell.lblDamageType setTextColor:[UIColor systemBlueColor]];
                                        [cell.lblDamageType setText:@"Damage"];
                                    }
                                    
                                    if ([cell.lblDamageType.text isEqualToString:@"Kinetic"]){
                                       // [cell.lblDamageType setTextColor:[UIColor systemBlueColor]];
                                        [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_kinetic.png"]];
                                        [cell.lblDamageType setText:@"Damage"];
                                    }
                                    
                                    if ([itemDamageType isEqualToString:@"None"]){
                                        [cell.lblDamageType setText:@""];
                                    }
                                    
                                    if ([itemDamageType isEqualToString:@"None"]){
                                        [cell.lblDamageType setText:@""];
                                        [cCell.lblDamageType setText:@""];
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
                                            [cCell.imgItem setImageWithURL:emblemURL];
                                        }
                                    }
                                    
                                    if (imageName){
                                        baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
                                        imageURL = [[NSURL alloc] initWithString:baseURL];
                                        if (imageURL){
                                            [cell.imgCareer setImageWithURL:imageURL];
                                            [cell.imgCareer setAlpha:0.7];
                                            
                                            [cCell.imgCareer setImageWithURL:imageURL];
                                            [cCell.imgCareer setAlpha:0.7];
                                        }
                                    }
                                    
                                }
                                
                                itemName = [invDisplayProps name];
                                [cell.lblItemName setText:itemName];
                                [cCell.lblItemName setText:itemName];
                            }
                            
                        }
                    }
                    
            
            }
             //   [self.tblItems endUpdates];
            
            }
              completion:^(BOOL finished) {
                    if (finished){
                        NSLog(@"WeaponsViewController:updateStaticItemData:performBatchUpdates:finished!");
                    }
            }];
    
           /* if (! hasUncommitedChanges){
                [self.tableView beginUpdates];
                 [self.tableView reloadRowsAtIndexPaths:visibleIndexPaths withRowAnimation:UITableViewRowAnimationNone];
                [self.tableView endUpdates];
            }*/
            
        }else{
            NSLog(@"WeaponsViewController:updateStaticItemData has uncommited changes, waiting to be done...");
        }
            
      
    } @catch (NSException *exception) {
        NSLog(@"WeaponsViewController:updateStaticItemData:Exception->%@",exception.description);
    } @finally {
        invItem = nil;
    }
    
}

 


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger sections = 0;
    
    if (self->useCView){
        //sections = 1;
        sections = [self.destWeaponBuckets count];
    }
    else{
    
        if (self.destWeaponBuckets){
            sections = [self.destWeaponBuckets count];
        }
    }
    
    
    
    return sections;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *title = nil,
             *bucketHash = nil;
    
    [tableView refreshControl];
    
    int TotalWeapons  = 10,
       CurrentWeapons = 0;
    
    DestinyInventoryBucketDefinition *buckDef = nil;
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
      
        @try {
            
            switch (section) {
                case 0:
                    CurrentWeapons = [self->primaryWeapons count];
                    break;
                case 1:
                    CurrentWeapons = [self->energyWeapons count];
                    break;
                case 2:
                    CurrentWeapons = [self->powerWeapons count];
                    break;
            }
            
            bucketHash = [self.destWeaponBuckets objectAtIndex:section];
            
            if (appDelegate.destinyInventoryBucketDefinitions){
                
                buckDef =  [appDelegate.destinyInventoryBucketDefinitions objectForKey:bucketHash];
                if (buckDef){
                    title  = [NSString stringWithFormat:@"%@: [%d/%d]",[buckDef.displayProperties name],CurrentWeapons,TotalWeapons];
                }
                
            }
            
        } @catch (NSException *exception) {
            NSLog(@"titleForHeaderInSection:Exception->%@",exception.description);
        } @finally {
            bucketHash = nil;
            buckDef = nil;
            CurrentWeapons = 0;
            TotalWeapons = 0;
        }
        
   
    
    return title;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 0,
              pRows = 0,
              sRows = 0,
              hRows = 0;
    
    NSArray *weaponsArray = [[NSArray alloc] initWithObjects:@"1498876634",@"2465295065",@"953998645",nil];
    
    NSString *strLookupKey = @"%@_%@";
    

   /* if (self->useCView){
        rows = 1;
        return rows;
    }*/
    
    if (self.destWeapons){
        
        
        @try {
            
            if (! self->primaryWeapons){
                self->primaryWeapons = [[NSMutableArray alloc] init];
            }
            else{
                if (section == 0){
                    if ([self->primaryWeapons count] > 0){
                        rows = [self->primaryWeapons count];
                        
                        if (self->useCView){
                            rows = 1;
                        }
                        
                        return rows;
                    }
                }
            }
            
            if (! self->energyWeapons){
                self->energyWeapons = [[NSMutableArray alloc] init];
            }else{
                if (section == 1){
                    if ([self->energyWeapons count] > 0){
                    rows = [self->energyWeapons count];
                        
                        
                        if (self->useCView){
                            rows = 1;
                        }
                        
                    return rows;
                    }
                }
            }
            
            if (! self->powerWeapons){
                self->powerWeapons = [[NSMutableArray alloc] init];
            }else{
                if (section == 2){
                    if ([self->powerWeapons count] > 0){
                    rows = [self->powerWeapons count];
                        
                        
                        if (self->useCView){
                            rows = 1;
                        }
                        
                    return rows;
                    }
                }
            }
            
            if (self.destWeaponBuckets){
                weaponsArray = self.destWeaponBuckets;
            }
            
            strLookupKey = [NSString stringWithFormat:strLookupKey,self.selectedChar,[weaponsArray objectAtIndex:section]];
            
            
            for (NSString *weaponKey in self.destWeapons.allKeys ) {
                 
                if ([weaponKey containsString:strLookupKey]){
                    
                    switch (section) {
                        case 0:
                          
                            [self->primaryWeapons addObject:weaponKey];
                            pRows +=1;
                            break;
                            
                        case 1:
                            [self->energyWeapons addObject:weaponKey];
                            sRows +=1;
                            break;
                            
                        case 2:
                            [self->powerWeapons addObject:weaponKey];
                            hRows +=1;
                            break;
                    }
                    
                }
            }
            
            switch (section) {
                case 0:
                  
                    rows = pRows;
                    
                    if (self->useCView){
                        rows = 1;
                    }
                    break;
                    
                case 1:
                   
                    rows = sRows;
                    
                    if (self->useCView){
                        rows = 1;
                    }
                    break;
                    
                case 2:
                    
                    rows = hRows;
                    
                    if (self->useCView){
                        rows = 1;
                    }
                    break;
            }
            
        }
        @catch (NSException *exception) {
            NSLog(@"numberOfRowsInSection:Exception->%@",exception.description);
        } @finally {
            strLookupKey = nil;
            weaponsArray = nil;
        }
        
    }
    

    
    return rows;
}



-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ItemCollectionView *customCV = (ItemCollectionView*) collectionView;
    
    NSInteger cSection = 0,
              cRow     = indexPath.row;
    
    NSIndexPath *cIndexPath = nil;
    
    
    if (customCV){
        cIndexPath = [customCV indexPath];
        
        if (cIndexPath.section){
            cSection = cIndexPath.section;
            //self->sharedSection = cSection;
        }
    }
    
    NSLog(@"Clicked Section->[%d],] Row->[%d]",cSection, cRow);
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    if (cell){
        
        if (cell.layer.borderColor == [UIColor systemOrangeColor].CGColor){
            
            [cell.layer setBorderWidth:0];
            [cell.layer setBorderColor:[UIColor clearColor].CGColor];
            
        }
        else{
        
        [cell.layer setBorderWidth:3];
        [cell.layer setBorderColor:[UIColor systemOrangeColor].CGColor];
        }
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *collectionViewArray  = nil;
    
    NSInteger items = 0;
    
   /* if (self.colorArray){
        
        collectionViewArray  = self.colorArray[[(ItemCollectionView *)collectionView indexPath].row];
    }*/
    
    switch (section) {
        case 0:
            
            if (self.primaryWeaponsArray){
               items = [self.primaryWeaponsArray count];
            }
            
            break;
            
        case 1:
            
            if (self.energyWeaponsArray){
                 items = [self.energyWeaponsArray count];
            }
            
            break;
        case 2:
            
            if (self.heavyWeaponsArray){
                items = [self.heavyWeaponsArray count];
            }
            
            break;
    }
    
   /* if (collectionViewArray){
        items = collectionViewArray.count;
    }*/
   
    return items;
     
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ItemCollectionView *customCV = (ItemCollectionView*) collectionView;

    [collectionView registerNib:[UINib nibWithNibName:@"ItemCollectionViewCell" bundle:nil]
     forCellWithReuseIdentifier:@"ItemCollectionViewCell"];
     
    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCollectionViewCell"
                                                                           forIndexPath:indexPath];;
    
    NSString *strFullKey   = nil,
             *strBucketKey = nil,
             *strBKey      = nil;
    
    
    NSInteger cSection = 0,
              cRow = indexPath.row;
    
    NSIndexPath *cIndexPath = nil;
    
 
        
        if (customCV){
            cIndexPath = [customCV indexPath];
            
            if (cIndexPath.section){
                cSection = cIndexPath.section;
                //self->sharedSection = cSection;
            }
        }
  
    
    NSLog(@"Weapons:collectionView:cellForRowAtIndexPath:Section->%d,Row->%d,",cSection,cRow);
    
    if (cell){
    
        
        @try {
            
            switch (cSection) {
                case 0:
                    
                    if (self->primaryWeapons){
                        strFullKey = [self->primaryWeapons objectAtIndex:cRow];
                       
                    }
                    strBucketKey = [self.destWeaponBuckets objectAtIndex:cSection];
                    break;
                    
                case 1:
                    
                    if (self->energyWeapons){
                        strFullKey = [self->energyWeapons objectAtIndex:cRow];
                    }
                    strBucketKey = [self.destWeaponBuckets objectAtIndex:cSection];
                    break;
                case 2:
                    
                    if (self->powerWeapons){
                        strFullKey = [self->powerWeapons objectAtIndex:cRow];
                    }
                    strBucketKey = [self.destWeaponBuckets objectAtIndex:cSection];
                    break;
            }
            
        } @catch (NSException *exception) {
            NSLog(@"Weapons:collectionView:cellForRowAtIndexPath:Exception->%@",exception.description);
            return cell;
        } @finally {
            
        }
        

 
       /* if (! indexPath.section){
            strBucketKey = [self.destWeaponBuckets objectAtIndex:0];
        }
        else{
            strBucketKey = [self.destWeaponBuckets objectAtIndex:indexPath.section];
        }*/
        
        
        if (self.destWeapons){
        
            
            INVCItems *item = [self.destWeapons objectForKey:strFullKey];
            
           /* if (! indexPath.section){
                strBucketKey = [self.destWeaponBuckets objectAtIndex:0];
            }else{
                strBucketKey = [self.destWeaponBuckets objectAtIndex:indexPath.section];
            }*/
             
            
            if (item){
                
                NSNumber *objBHash  = [NSNumber numberWithDouble:[item bucketHash]];
                
                strBKey = [NSString stringWithFormat:@"%@", objBHash];
                
                if ([strBKey isEqualToString:strBucketKey]){
                    
                    if (appDelegate.destinyInventoryBucketDefinitions){
                        [appDelegate.destinyInventoryBucketDefinitions objectForKey:strBucketKey];
                        
                        
                        DestinyInventoryBucketDefinition *buckDef =  [appDelegate.destinyInventoryBucketDefinitions objectForKey:strBucketKey];
                        
                        if (buckDef){
                            
                            if ([buckDef.displayProperties.name isEqualToString:@"Kinetic Weapons"]){
                                [cell.imgBackground setImage:[UIImage imageNamed:@"primaryAmmo.png"]];
                            }
                            
                            if ([buckDef.displayProperties.name isEqualToString:@"Energy Weapons"]){
                                [cell.imgBackground setImage:[UIImage imageNamed:@"energyAmmo.png"]];
                            }
                            
                            if ([buckDef.displayProperties.name isEqualToString:@"Power Weapons"]){
                                [cell.imgBackground setImage:[UIImage imageNamed:@"heavyAmmo.png"]];
                            }
                            
                            
                        }
                        
                    }
                    
                }
                
                NSNumber *objHashId  = [[NSNumber alloc] initWithDouble:item.itemHash];
                
                NSString *strHashKey = [NSString stringWithFormat:@"%@",objHashId];
                
                if (appDelegate.destinyInventoryItemDefinitions){
                    
                    INVDResponse *itemDef =   [appDelegate.destinyInventoryItemDefinitions objectForKey:strHashKey];
                    
                    if (itemDef){
                        
                        INVDDisplayProperties *invDisplayProps = (INVDDisplayProperties* )itemDef.displayProperties;
                         
                        NSString *imageName    = nil,
                                *baseURL       = nil,
                                *emblem        = nil;
                        
                        NSURL    *imageURL      = nil,
                                *emblemURL      = nil;
                        
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
                        }
                        
                        double t = [itemDef defaultDamageType];
                        int i= (int) t;
                        
                        NSString *objDamageType =  [NSString stringWithFormat:@"%d",i];
                        
                        if (objDamageType){
                        
                           NSString *itemDamageType = [Utilities decodeDamageType:objDamageType.intValue];
                        
                            if (itemDamageType){
                                
                                [cell.lblDamageType setTextColor:[UIColor lightGrayColor]];
                                [cell.lblDamageType setText:itemDamageType];
                                
                                if ([cell.lblDamageType.text isEqualToString:@"Arc"]){
                                    [cell.lblDamageType setTextColor:[UIColor cyanColor]];
                                    
                                    [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_arc.png"]];
                                }
                                if ([cell.lblDamageType.text isEqualToString:@"Solar"]){
                                    [cell.lblDamageType setTextColor:[UIColor systemYellowColor]];
                                    
                                    [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_solar.png"]];
                                }
                                if ([cell.lblDamageType.text isEqualToString:@"Void"]){
                                    [cell.lblDamageType setTextColor:[UIColor systemPurpleColor]];
                                    
                                    [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_void.png"]];
                                }
                                if ([cell.lblDamageType.text isEqualToString:@"Stasis"]){
                                    [cell.lblDamageType setTextColor:[UIColor systemBlueColor]];
                                }
                                
                                if ([cell.lblDamageType.text isEqualToString:@"Kinetic"]){
                                    [cell.lblDamageType setTextColor:[UIColor whiteColor]];
                                    [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_kinetic.png"]];
                                }
                                
                                if ([itemDamageType isEqualToString:@"None"]){
                                    [cell.lblDamageType setText:@""];
                                    
                                   
                                }
                                
                                [cell.lblDamageType setHidden:YES];
                            }
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
                            else{
                                
                                                                    
                                [NetworkAPISingleClient getInstancedItem:item.itemInstanceId completionBlock:^(NSArray *values){
                                
                                    if (values){
                                    
                                        INSTBaseClass *instanceBase = (INSTBaseClass*) [values firstObject];
                                            
                                        NSString *strIDX = nil,
                                                 *strSDX = nil;
                                           
                                        strIDX = [NSString stringWithFormat:@"%d",cRow];
                                        strSDX = [NSString stringWithFormat:@"%d",cSection];
                                        
                                            
                                        NSDictionary *callerInfo = [[NSDictionary alloc]
                                                        initWithObjectsAndKeys:@"WeaponsViewController",@"ClassName",
                                                                                @"getInstancedItem",@"MethodName",
                                                                                strIDX,@"CurrentIndex",
                                                                                strSDX,@"CurrentSection",
                                                                                strHashKey, @"itemHashKey",
                                                                                item.itemInstanceId, @"itemInstanceId",nil];
                                            
                                        [[NSNotificationCenter defaultCenter]
                                                postNotificationName:kDestinyLoadedInstancedItemNotification
                                                                object:instanceBase
                                                                userInfo:callerInfo];
                                            
                            NSLog(@"WeaponsViewController:NetworkAPISingleClient:kDestinyLoadedInstancedItemNotification:Raised->%@",strHashKey);
                                        
                                        
                                    }
                                    
                                }andErrorBlock:^(NSError *exception){
                                    NSLog(@"WeaponsViewController:NetworkAPISingleClient:getInstancedItem:Exception->%@",exception.description);
                                }];

                                
                            }
                          
                        }
                        
                    }
                }
            }
        }
        
        
    }
    
    return cell;
}

#pragma mark - UIScrollViewDelegate Methods

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
    
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    
    ItemCollectionView *collectionView = (ItemCollectionView *)scrollView;
    NSInteger index = collectionView.indexPath.row;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        NSInteger size = 120;
    
    if (self->useCView){
        size = 220;
    }
    
    return size;
}
 
-(void) tableView:(UITableView *)tableView willDisplayCell:(ItemTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
   
    ItemTableViewCell *cCell = nil;
    
    if (self->useCView){
        
        cCell = (ItemTableViewCell*) cell;
        
        if (cCell){
        
            [cCell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
            NSInteger index = cCell.collectionView.indexPath.row;
            
         
            CGFloat horizontalOffset = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
            
            UICollectionView *cView = (UICollectionView*) [cCell collectionView];
          
            if (cView){
                [cView setContentOffset:CGPointMake(horizontalOffset, 0)];
            }
        }
       
    }
    
 
}
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  
    ItemCellTableView *cell = nil;
    
    ItemTableViewCell *cCell = nil;
    
    static NSString *cellId         = @"ItemCellTableView",
                    *CellIdentifier = @"CellIdentifier";
    
  
    NSString *strFullKey = nil,
             *strLookUpKey = nil,
             *strBucketKey = nil;
    
    INVDDestinyInventoryBaseClass *staticBase = nil;
    
    INSTBaseClass *instanceBase = nil;
    
    NSMutableArray *groupItems = nil;
     
    @try {
        
            NSLog(@"WeaponsTableViewController:cellForRowAtIndexPath:Section->%d,Row->%d,",indexPath.section,indexPath.row);
        
            //self->sharedSection = indexPath.section;
        
                cCell = (ItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
                if (!cCell){
                    cCell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
        
                cell = (ItemCellTableView*) [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
            
                if (! cell){
                    cell = [[ItemCellTableView alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:cellId];
                    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                 
                }
        
                [cCell setParentTableView:self.tableView];
                [cCell setParentViewController:self];
                
                [cell setParentTableView:self.tableView];
                [cell setParentViewController:self];
        
        
        
       
                if (! self->primaryWeapons || (! self->energyWeapons) || (! self->powerWeapons) ){
                    
                    strBucketKey = [self.destWeaponBuckets objectAtIndex:indexPath.section];
                      
                    strLookUpKey = [NSString stringWithFormat:@"%@_%@",self.selectedChar,strBucketKey];
                      
                      groupItems = [[NSMutableArray alloc] init];
                      
                      for (NSString *itemKey in self.destWeapons.allKeys) {
                          
                          if ([itemKey containsString:strLookUpKey]){
                              [groupItems addObject:itemKey];
                          }
                          
                      }
                      
                      strFullKey = [groupItems objectAtIndex:indexPath.row];
                }
                
                switch (indexPath.section) {
                    case 0:
                        
                        if (self->primaryWeapons){
                            strFullKey = [self->primaryWeapons objectAtIndex:indexPath.row];
                        }
                         
                        break;
                        
                    case 1:
                        
                        if (self->energyWeapons){
                            strFullKey = [self->energyWeapons objectAtIndex:indexPath.row];
                        }
                      
                        
                        break;
                        
                    case 2:
                        
                        if (self->powerWeapons){
                            strFullKey = [self->powerWeapons objectAtIndex:indexPath.row];
                        }
                        
                        break;
                }
                
                if (self.destWeapons){
                
                    
                    INVCItems *item = [self.destWeapons objectForKey:strFullKey];
                    
                    
                    if (item){
                        
                      
                        
                        NSNumber *objHashId  = [[NSNumber alloc] initWithDouble:item.itemHash],
                                 *objBckId   = [[NSNumber alloc] initWithDouble:item.bucketHash];
                        
                        NSString *strHashKey = [NSString stringWithFormat:@"%@",objHashId],
                                 *strBckKey  = [NSString stringWithFormat:@"%@",objBckId];
                        
                        if (cell){
                            
                            [cell.lblCharacterId setText:self.selectedChar];
                            
                            if (appDelegate.destinyInventoryBucketDefinitions){
                                
                              DestinyInventoryBucketDefinition  *buckDef =  [appDelegate.destinyInventoryBucketDefinitions objectForKey:strBckKey];
                                if (buckDef){
                                    
                                    if (buckDef){
                                        
                                        if ([buckDef.displayProperties.name isEqualToString:@"Kinetic Weapons"]){
                                            [cell.imgBackground setImage:[UIImage imageNamed:@"primaryAmmo.png"]];
                                        }
                                        
                                        if ([buckDef.displayProperties.name isEqualToString:@"Energy Weapons"]){
                                            [cell.imgBackground setImage:[UIImage imageNamed:@"energyAmmo.png"]];
                                        }
                                        
                                        if ([buckDef.displayProperties.name isEqualToString:@"Power Weapons"]){
                                            [cell.imgBackground setImage:[UIImage imageNamed:@"heavyAmmo.png"]];
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                            
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
                                            
                                            if ([itemDamageType isEqualToString:@"Arc"]){
                                                //[cell.lblDamageType setTextColor:[UIColor cyanColor]];
                                                [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_arc.png"]];
                                                [cell.lblDamageType setText:@"Damage"];
                                            }
                                            if ([cell.lblDamageType.text isEqualToString:@"Solar"]){
                                                //[cell.lblDamageType setTextColor:[UIColor systemYellowColor]];
                                                [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_solar.png"]];
                                                [cell.lblDamageType setText:@"Damage"];
                                            }
                                            if ([cell.lblDamageType.text isEqualToString:@"Void"]){
                                                //[cell.lblDamageType setTextColor:[UIColor systemPurpleColor]];
                                                [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_void.png"]];
                                                [cell.lblDamageType setText:@"Damage"];
                                            }
                                            if ([cell.lblDamageType.text isEqualToString:@"Stasis"]){
                                               // [cell.lblDamageType setTextColor:[UIColor systemBlueColor]];
                                                [cell.lblDamageType setText:@"Damage"];
                                            }
                                            
                                            if ([cell.lblDamageType.text isEqualToString:@"Kinetic"]){
                                               // [cell.lblDamageType setTextColor:[UIColor systemBlueColor]];
                                                [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_kinetic.png"]];
                                                [cell.lblDamageType setText:@"Damage"];
                                            }
                                            
                                            if ([itemDamageType isEqualToString:@"None"]){
                                                [cell.lblDamageType setText:@""];
                                            }
                                        }
                                    }
                                    
                                  
                                    INVDDisplayProperties *invDisplayProps = (INVDDisplayProperties* )itemDef.displayProperties;
                                     
                                    NSString *imageName    = nil,
                                            *baseURL       = nil,
                                            *emblem        = nil;
                                    
                                    NSURL    *imageURL      = nil,
                                            *emblemURL      = nil;
                                    
                                    if (invDisplayProps){
                                        
                                        
                                        
                                        if (invDisplayProps.hasIcon){
                                            
                                            emblem =  invDisplayProps.icon;
                                            
                                            imageName = itemDef.iconWatermark;
                                            
                                            if (emblem){
                                                baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,emblem];
                                                emblemURL = [[NSURL alloc] initWithString:baseURL];
                                                if (emblemURL){
                                                    [cell.imgItem setImageWithURL:emblemURL];
                                                    [cCell.imgItem setImageWithURL:emblemURL];
                                                }
                                            }
                                            
                                            if (imageName){
                                                baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
                                                imageURL = [[NSURL alloc] initWithString:baseURL];
                                                if (imageURL){
                                                    [cell.imgCareer setImageWithURL:imageURL];
                                                    [cell.imgCareer setAlpha:0.7];
                                                    
                                                    [cCell.imgCareer setImageWithURL:imageURL];
                                                    [cCell.imgCareer setAlpha:0.7];
                                                }
                                            }
                                            
                                        }
                                        
                                        itemName = [invDisplayProps name];
                                        [cell.lblItemName setText:itemName];
                                        [cCell.lblItemName setText:itemName];
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
                                                                [cCell.lblPowerLevel setText:[NSString stringWithFormat:@"%@",objValue]];
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
                                                                    initWithObjectsAndKeys:@"WeaponsViewController",@"ClassName",
                                                                                            @"getInstancedItem",@"MethodName",
                                                                                            strIDX,@"CurrentIndex",
                                                                                            strSDX,@"CurrentSection",
                                                                                            strHashKey, @"itemHashKey",
                                                                                            item.itemInstanceId, @"itemInstanceId",nil];
                                                        
                                                    [[NSNotificationCenter defaultCenter]
                                                            postNotificationName:kDestinyLoadedInstancedItemNotification
                                                                            object:instanceBase
                                                                            userInfo:callerInfo];
                                                        
                                        NSLog(@"WeaponsViewController:NetworkAPISingleClient:kDestinyLoadedInstancedItemNotification:Raised->%@",strHashKey);
                                                    
                                                    
                                                }
                                                
                                            }andErrorBlock:^(NSError *exception){
                                                NSLog(@"WeaponsViewController:NetworkAPISingleClient:getInstancedItem:Exception->%@",exception.description);
                                            }];
         
                                            
                                        }
                                      
                                    }
                                    
                                }
                                else{
                                    NSLog(@"WeaponsTableViewController:cellForRowAtIndexPath:Unable to find destinyInventoryItemDefinition for[%@]",strHashKey);
                                    
                                    
                                    [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinyInventoryItemDefinition" staticHashId:strHashKey completionBlock:^(NSArray *values) {
                                        
                                        if (values){
                                          
                                        NSLog(@"WeaponsTableViewController:retrieveStaticEntityDefinitionByManifestType:Received->%@",strHashKey);
                                              
                                        INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                                        
                                        
                                        NSNumber *objLocked = [NSNumber numberWithDouble:item.state];
                                            
                                        NSString *strIDX = nil,
                                                 *strSDX = nil,
                                                 *strLocked = nil;
                                           
                                           
                                        strIDX = [NSString stringWithFormat:@"%d",indexPath.row];
                                        strSDX = [NSString stringWithFormat:@"%d",indexPath.section];
                                            
                                        strLocked = [objLocked stringValue];
                                            
                                        NSDictionary *callerInfo = [[NSDictionary alloc]
                                                          initWithObjectsAndKeys:@"WeaponsViewController",@"ClassName",
                                                          @"getStaticItem",@"MethodName",
                                                          strIDX,@"CurrentIndex",
                                                          strSDX,@"CurrentSection",
                                                          strLocked, @"LockState",
                                                          strHashKey, @"itemHashKey",nil];
                                              
                                        [[NSNotificationCenter defaultCenter]
                                                postNotificationName:kDestinyLoadedStaticItemNotification
                                                              object:invItem
                                                                userInfo:callerInfo];
                                            
                                        NSLog(@"WeaponsViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Raised->%@",strHashKey);
                                        
                                        }
                                        
                                    } andErrorBlock:^(NSError *exception) {
                                     NSLog(@"WeaponsViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Exception->%@",exception.description);
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
    
    
    if (self->useCView){
        [cCell setHidden:NO];
        [cell setHidden:YES];
        
        return cCell;
    }else{
        [cCell setHidden:YES];
        [cell setHidden:NO];
        
        return cell;
    }
    
    
  
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
