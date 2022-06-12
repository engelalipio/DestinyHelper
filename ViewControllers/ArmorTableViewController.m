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
#import "GuardianViewController.h"
#import "ArmorDetailsViewController.h"

@interface ArmorTableViewController ()
{
    AppDelegate *appDelegate;
    
    NSMutableArray *helmets,
                    *gauntles,
                    *chestArmor,
                    *legArmor,
                    *classArmor;
    
    NSMutableDictionary *instanceData,
                        *destCharData,
                        *allCharsData;
    
    NSInteger RowHeight;
    
    NSString *currentClass;
    
    UIImageView *cImage;
    
}
@end

@implementation ArmorTableViewController

@synthesize destArmor = _destArmor;
@synthesize selectedChar = _selectedChar;
@synthesize selectedMembership = _selectedMembership;
@synthesize destArmorBuckets = _destArmorBuckets;
@synthesize selectedCharEmblem = _selectedCharEmblem;
@synthesize destChars = _destChars;
@synthesize parentVC = _parentVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    NSString *strClass  = nil,
             *strRace   = nil,
             *strGender = nil,
             *strLight  = nil;
    
        self->RowHeight = 90;
    
        if (self.destChars){
            
            self->allCharsData = [[NSMutableDictionary alloc] initWithDictionary:self.destChars copyItems:YES];
            
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
    
    if (self.selectedCharEmblem){
    
        UIImageView *cImage = self.selectedCharEmblem;
    
        
        [self->cImage setFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)];
        
        CGRect  lblFrame = CGRectMake(50, -20, self.tableView.frame.size.width, 80);
        
        UILabel *lblChar   = [[UILabel alloc] initWithFrame:lblFrame];
        [lblChar setTextAlignment:NSTextAlignmentLeft];
        [lblChar setFont:[UIFont fontWithName:kDefaultFontName size:22]];
        [lblChar setTextColor:[UIColor systemOrangeColor]];
        [lblChar setText:[NSString stringWithFormat:@"%@//%@//%@//%@",strLight,strClass,strRace,strGender]];
        
        [cImage addSubview:lblChar];
        
        [self.navigationItem setTitleView:cImage];
       
     
    }
    
    
    UIBarButtonItem *btnClose =  [[UIBarButtonItem alloc] init];
    
    if (btnClose){
        [btnClose setTitle:@"Close"];
        [btnClose setTarget:self];
        [btnClose setTintColor:[UIColor systemOrangeColor]];
        [btnClose setAction:@selector(closeAction)];
    }

    self.navigationItem.rightBarButtonItem = btnClose;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self->appDelegate = [AppDelegate currentDelegate];
    [self setupBackgroundImage:strClass];
    [self initTableView];
    
    [self registerNotifications];
    
}



-(void)setupBackgroundImage:(NSString *) anyClass{
    
    UIImage *oImage = nil;
    
    NSString *imageName = nil;
    
    if ([anyClass isEqualToString:@"Warlock"]){
        imageName = @"background_Warlock.png";
    }
    
    if ([anyClass isEqualToString:@"Titan"]){
        imageName = @"background_Titan.png";
    }
    
    if ([anyClass isEqualToString:@"Hunter"]){
        imageName = @"background_Hunter.png";
    }
    
    oImage =  [UIImage imageNamed:imageName] ;
    CGSize newSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height  );
    
    oImage = [Utilities imageResize:oImage andResizeTo:newSize];
   
     self.view.backgroundColor = [UIColor colorWithPatternImage:oImage];
    
 
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
 
    ArmorDetailsViewController *targetVC = nil;
    ItemCellTableView *selectedCell = nil;
    
    INSTBaseClass *itemResponse = nil;
    NSString *weaponKey   = nil,
             *compareKey  = nil,
             *instanceKey = nil;
    @try {
        
        targetVC = (ArmorDetailsViewController *) segue.destinationViewController;
        selectedCell = (ItemCellTableView*) sender;
        
        if ([targetVC isKindOfClass:[ArmorDetailsViewController class]]){
           
            if (selectedCell){
                
                weaponKey = selectedCell.lblHash.text;
                instanceKey = selectedCell.lblInstanceId.text;
                
                if (instanceKey.length == 0){
                    instanceKey = [self resolveItemInstanceId:weaponKey
                                           withItemCollection:self.destArmor];
                    
                    if (instanceKey.length > 0){
                        [selectedCell.lblInstanceId setText:instanceKey];
                    }
                }
                
                if (weaponKey){
                    
                    compareKey = [self resolveItemInstanceId:weaponKey
                                         withItemCollection:self.destArmor];
                    
                    if (![instanceKey isEqualToString:compareKey] ){
                        NSLog(@"ArmorVC:prepareForSegue:Setting MatchFrom=%@, To=%@",instanceKey,compareKey);
                        [selectedCell.lblInstanceId setText:compareKey];
                        
                    }
                    
                    itemResponse =  (INSTBaseClass*) [self->instanceData objectForKey:weaponKey];
                    
                    if (itemResponse){
                        
                        [targetVC loadArmorDetail:itemResponse
                                    withArmorCell:selectedCell
                                    charactersData:self->allCharsData];
                    }
                    
                }
            }
        }
        
    } @catch (NSException *exception) {
        NSLog(@"ArmorVC:prepareForSegue:Exception=%@",exception.description);
    } @finally {
        
        targetVC = nil;
        selectedCell = nil;
        
        itemResponse = nil;
        weaponKey   = nil;
        instanceKey = nil;
        
    }
    
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
                    NSLog(@"ArmorVC:resolveItemInstanceId:For StaticHash=[%@] with InstanceHash=[%@]",staticKey,strInstanceHashKey);
                }
            }
        }
        
        
    } @catch (NSException *exception) {
        NSLog(@"resolveItemInstanceId:Exception=%@",exception.description);
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


-(void) registerNotifications{

    NSLog(@"2:ArmorViewController:registerNotifications...");
    
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
            NSLog(@"3:ArmorTableViewController:loadWeapons:Selected Character->[%d]",selectedCharacter);
        }
        
       if (self.destArmorBuckets){
           armorBuckets = self.destArmorBuckets;
           NSLog(@"4:ArmorTableViewController:destArmorBuckets:Armor Buckets Count->[%d]",armorBuckets.count);
       }
       
        if (self.destArmor){
            charArmor = self.destArmor;
            NSLog(@"5:ArmorTableViewController:destArmor:Character Weapons Count->[%d]",charArmor.count);
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


- (void)removeArmorAction:(NSString *) armorHash{
    
    NSArray<NSIndexPath*> *deletedRows  = nil;
    
    NSIndexPath *selectedRow = nil;
    
    NSString
            *armorHashFilter = nil,
            *bucketHashFilter = nil,
            *helmetBucketKey  = nil,
            *glovesBucketKey  = nil,
            *chestBucketKey   = nil,
            *legBucketKey     = nil,
            *classBucketKey     = nil;
    
    NSPredicate *bPredicate = nil;
    
    NSArray *helmetFilteredResult = nil,
            *gloveFilteredResult  = nil,
            *chestFilteredResult  = nil,
            *legFilteredResult    = nil,
            *classFilteredResult  = nil;
 
    @try {
        
        
            for(int ikIdx = 0;ikIdx < self.destArmorBuckets.count; ikIdx ++){
              
                switch (ikIdx) {
                    case 0:
                        helmetBucketKey  = [self.destArmorBuckets objectAtIndex:ikIdx];
                        break;
                        
                    case 1:
                        glovesBucketKey   = [self.destArmorBuckets objectAtIndex:ikIdx];
                        break;
                        
                    case 2 :
                        chestBucketKey    = [self.destArmorBuckets objectAtIndex:ikIdx];
                        break;
                        
                    case 3 :
                        legBucketKey    = [self.destArmorBuckets objectAtIndex:ikIdx];
                        break;
                    case 4:
                        classBucketKey    = [self.destArmorBuckets objectAtIndex:ikIdx];
                        break;
                }
                
            }
        
        
 
        
            armorHashFilter = [NSString stringWithFormat:@"%@_%@_%@",self.selectedChar,helmetBucketKey,armorHash];
            bPredicate      = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",armorHashFilter];
        
        
            helmetFilteredResult = [self->helmets filteredArrayUsingPredicate:bPredicate];
            if (helmetFilteredResult.count > 0){
                [self->helmets removeObject:armorHashFilter];
                bucketHashFilter = [NSString stringWithFormat:@"%@_%@",helmetBucketKey,armorHash];
                NSLog(@"ArmorViewController:removeArmorAction:Removed Helment Weapon->%@ from helmets...",armorHashFilter);
            }
        
        
            armorHashFilter = [NSString stringWithFormat:@"%@_%@_%@",self.selectedChar,glovesBucketKey,armorHash];
            bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",armorHashFilter];
 
            gloveFilteredResult = [self->gauntles filteredArrayUsingPredicate:bPredicate];
            if (gloveFilteredResult.count > 0){
                [self->gauntles removeObject:armorHashFilter];
                bucketHashFilter = [NSString stringWithFormat:@"%@_%@",glovesBucketKey,armorHash];
                NSLog(@"ArmorViewController:removeArmorAction:Removed Gloves ->%@ from gauntles...",armorHashFilter);
            }
        
            armorHashFilter = [NSString stringWithFormat:@"%@_%@_%@",self.selectedChar,chestBucketKey,armorHash];
            bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",armorHashFilter];
     
            chestFilteredResult = [self->chestArmor filteredArrayUsingPredicate:bPredicate];
            if (chestFilteredResult.count > 0){
                [self->chestArmor removeObject:armorHashFilter];
                bucketHashFilter = [NSString stringWithFormat:@"%@_%@",chestBucketKey,armorHash];
                NSLog(@"ArmorViewController:removeArmorAction:Removed Chest ->%@ from chestArmor...",armorHashFilter);
            }
        
        
            armorHashFilter = [NSString stringWithFormat:@"%@_%@_%@",self.selectedChar,legBucketKey,armorHash];
            bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",armorHashFilter];
    
            legFilteredResult = [self->legArmor filteredArrayUsingPredicate:bPredicate];
            if (legFilteredResult.count > 0){
                [self->legArmor  removeObject:armorHashFilter];
                bucketHashFilter = [NSString stringWithFormat:@"%@_%@",legBucketKey,armorHash];
                NSLog(@"ArmorViewController:removeArmorAction:Removed Legs->%@ from legArmor...",armorHashFilter);
            }
        
            armorHashFilter = [NSString stringWithFormat:@"%@_%@_%@",self.selectedChar,classBucketKey,armorHash];
            bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",armorHashFilter];
    
            classFilteredResult = [self->classArmor filteredArrayUsingPredicate:bPredicate];
            if (classFilteredResult.count > 0){
                [self->classArmor removeObject:armorHashFilter];
                bucketHashFilter = [NSString stringWithFormat:@"%@_%@",classBucketKey,armorHash];
                NSLog(@"ArmorViewController:removeArmorAction:Removed Class Item->%@ from classArmor...",armorHashFilter);
            }
                
            if ([self.destArmor.allKeys containsObject:bucketHashFilter]){
                [self.destArmor removeObjectForKey:bucketHashFilter];
                NSLog(@"ArmorViewController:removeArmorAction:Removing Armor by Bucket Hash->%@ from All destArmor...",bucketHashFilter);
            }
        
            if ([self.destArmor.allKeys containsObject:armorHashFilter]){
                [self.destArmor removeObjectForKey:armorHashFilter];
                NSLog(@"ArmorViewController:removeArmorAction:Removing Armor by Full Hash->%@ from All destWeapons...",armorHashFilter);
            }
        
            if ([self->instanceData.allKeys containsObject:armorHashFilter]){
                [self->instanceData removeObjectForKey:armorHashFilter];
                NSLog(@"ArmorViewController:removeArmorAction:Removing Armor by Full Hash->%@ from Armor instanceData...",armorHashFilter);
            }
        
            if ([self->instanceData.allKeys containsObject:armorHash]){
                [self->instanceData removeObjectForKey:armorHash];
                NSLog(@"ArmorViewController:removeArmorAction:Removing Armor by Hash ->%@ from Armor instanceData...",armorHash);
            }
     
        
        selectedRow  =  [self.tableView indexPathForSelectedRow];
        
        if (selectedRow){
         
          deletedRows = [[NSArray<NSIndexPath*> alloc] initWithObjects:selectedRow, nil];
            
         //Need to remove table cell
         [self.refreshControl beginRefreshing];
            [self.tableView beginUpdates];
            
            NSLog(@"ArmorViewController:removeArmorAction:Removing Actioned Armor from UI");
            
            [self.tableView deleteRowsAtIndexPaths:deletedRows
                               withRowAnimation:UITableViewRowAnimationFade];
            
            [self.tableView endUpdates];
            [self.tableView reloadData];
         [self.refreshControl endRefreshing];
          NSLog(@"ArmorViewController:removeArmorAction:finished!");
        }
        
        
        
    } @catch (NSException *exception) {
        NSLog(@"ArmorViewController:removeArmorAction:Exception->%@",exception.description);
    } @finally {
        selectedRow = nil;
        deletedRows = nil;
    }
    
}

- (void)refreshLockedArmorAction:(NSString *) armorHash{
    
    ItemCellTableView *selectedCell = nil;
    

    NSIndexPath *selectedRow = nil;
    
    UIImage *lockImage = [UIImage systemImageNamed:@"lock"],
            *unLockImage = [UIImage systemImageNamed:@"lock.open"];
    
    @try {
        
        selectedRow  =  [self.tableView indexPathForSelectedRow];
        
        if (!selectedRow){
            NSLog(@"ArmorViewController:refreshLockedArmorAction:No Row selected to Refesh:Exiting...");
            return;
        }
        
        selectedCell = [self.tableView cellForRowAtIndexPath:selectedRow];
        
        if (!selectedCell){
            NSLog(@"ArmorViewController:refreshLockedArmorAction:No Cell selected for IndexPath");
            return;
        }
        
        
        if (armorHash){
            
            //[self.refreshControl beginRefreshing];
            
            [self.tableView beginUpdates];
            
            if ([selectedCell.btnLockAction.currentImage isEqual:lockImage]){
                [selectedCell.btnLockAction setImage:unLockImage forState:UIControlStateNormal];
            }else{
                [selectedCell.btnLockAction setImage:lockImage forState:UIControlStateNormal];
            }
            NSLog(@"ArmorViewController:refreshLockedArmorAction:Refreshing UI");
 
            
            [self.tableView endUpdates];
             
               // [self.tableView reloadData];
            // [self.refreshControl endRefreshing];
              NSLog(@"ArmorViewController:refreshLockedArmorAction:finished!");
            
            [self.tableView deselectRowAtIndexPath:selectedRow animated:NO];
            
            NSLog(@"ArmorViewController:refreshLockedArmorAction:deselectRowAtIndexPath");
            
        }
        
            
    } @catch (NSException *exception) {
        NSLog(@"ArmorViewController:refreshLockedArmorAction:Exception->%@",exception.description);
    } @finally {
        
        selectedCell = nil;
    
    }
    
}

- (void)refreshEquippedArmorAction:(NSString *) armorHash{
    
    ItemCellTableView *selectedCell = nil;
    
    NSArray<UITableViewCell*> *visibleCells = nil;
    NSArray<NSIndexPath*>  *visibleIndexes  = nil;
    
    NSIndexPath *selectedRow = nil;
    
    @try {
        
        selectedRow  =  [self.tableView indexPathForSelectedRow];
        
        if (!selectedRow){
            NSLog(@"ArmorViewController:refreshEquippedArmorAction:No Row selected to Refesh:Exiting...");
            return;
        }
        
        selectedCell = [self.tableView cellForRowAtIndexPath:selectedRow];
        
        if (!selectedCell){
            NSLog(@"ArmorViewController:refreshEquippedArmorAction:No Cell selected for IndexPath");
            return;
        }
        
        
        if (armorHash){
            
            visibleCells =  [self.tableView visibleCells];
            
            visibleIndexes = [self.tableView indexPathsForVisibleRows];
            
            [self.refreshControl beginRefreshing];
            
            [self.tableView beginUpdates];
            
            
                if (visibleCells.count > 0){
                     for (UITableViewCell *vCell in visibleCells) {
                        [vCell.layer setMasksToBounds:NO];
                        [vCell.layer setCornerRadius:0];
                        [vCell.layer setBorderWidth:1];
                        [vCell.layer setShadowOffset: CGSizeMake(0, 0)];
                        [vCell.layer setBorderColor:[UIColor clearColor].CGColor];
                        
                     }
                }
            
           
                [selectedCell.layer setMasksToBounds:YES];
                [selectedCell.layer setCornerRadius:5];
                [selectedCell.layer setBorderWidth:3];
                [selectedCell.layer setShadowOffset: CGSizeMake(-1, 1)];
                [selectedCell.layer setBorderColor:[UIColor whiteColor].CGColor];
            
               
                [self.tableView deselectRowAtIndexPath:selectedRow animated:NO];
            
                NSLog(@"ArmorViewController:refreshEquippedArmorAction:Refreshing UI");
                
                /*[self.tableView reloadRowsAtIndexPaths:visibleIndexes
                                      withRowAnimation:UITableViewRowAnimationAutomatic];*/

                
                [self.tableView endUpdates];
            
               // [self.tableView reloadData];
             [self.refreshControl endRefreshing];
              NSLog(@"ArmorViewController:refreshEquippedArmorAction:finished!");
            
            
        }
        
            
    } @catch (NSException *exception) {
        NSLog(@"ArmorViewController:refreshEquippedArmorAction:Exception->%@",exception.description);
    } @finally {
        
        selectedCell = nil;
        
        visibleCells = nil;
        visibleIndexes  = nil;
        
        selectedRow = nil;
    }
    
}

- (void)closeAction {
    
    NSLog(@"ArmorViewController:closeAction:Invoked...");
     
    [self.navigationController dismissViewControllerAnimated:NO completion:^{
    
        NSLog(@"ArmorViewController:closeAction:Completed...");
        
        GuardianViewController *gVC = nil;
        
        if (! self.parentVC){
            NSLog(@"ArmorViewController:closeAction:Not Parent VC Detected:exiting...");
            return;
        }
        
        if ([self.parentVC isKindOfClass:[GuardianViewController class]]){
            
            gVC = (GuardianViewController *) self.parentVC;
            
            if (gVC){
                [gVC refreshCharacterEquipment];
                
                self.parentVC = nil;
            }
            
            
            if (self->cImage){
                self->cImage = nil;
                [self.navigationItem setTitleView:nil];
            }
        }
        
    }];
        
    
}



-(void) handleLongPress:(UILongPressGestureRecognizer *) recognize{
    
    NSLog(@"ArmorViewController:handleLongPress:Invoked...");
    
    ItemCellTableView *cCell = nil;
    
    BOOL processRequest = NO;
    @try {
        
        
        switch(recognize.state){
            case UIGestureRecognizerStateEnded:
                NSLog(@"ArmorViewController:UIGestureRecognizerStateEnded:Detected...");
                break;
            case UIGestureRecognizerStateBegan:
                NSLog(@"ArmorViewController:UIGestureRecognizerStateBegan:Detected...");
                processRequest = YES;
                break;
            case UIGestureRecognizerStateChanged:
                NSLog(@"ArmorViewController:UIGestureRecognizerStateChanged:Detected...");
                break;
            case UIGestureRecognizerStateCancelled:
                NSLog(@"ArmorViewController:UIGestureRecognizerStateCancelled:Detected...");
                break;
            case UIGestureRecognizerStatePossible:
                NSLog(@"ArmorViewController:UIGestureRecognizerStatePossible:Detected...");
                break;
            case UIGestureRecognizerStateFailed:
                NSLog(@"ArmorViewController:UIGestureRecognizerStateFailed:Detected...");
                break;
        }
        
       
        
        if (processRequest){
            
            NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
            
            if (selectedIndexPath){
            
                cCell = (ItemCellTableView*) [self.tableView cellForRowAtIndexPath:selectedIndexPath];
               
                NSString *strStaticKey = [cCell.lblHash text],
                         *strHashKey   = [cCell.lblInstanceId text];
                
                if (cCell){
                    

                        
                NSLog(@"handleLongPress:For %@ IndexPath Section->[%d],Row->[%d]",strHashKey,selectedIndexPath.section, selectedIndexPath.row);
                
                    if ([strHashKey length] > 0){
                        [cCell transferItemAction:self->allCharsData];
                       
                      
                    }
                    else
                    {
                        
                        strHashKey = [self resolveItemInstanceId:strStaticKey withItemCollection:self.destArmor];
                        
                        if (strHashKey.length > 0){
                            [cCell.lblInstanceId setText:strHashKey];
                        
                            [cCell transferItemAction:self->allCharsData];
                        }

                    }
               }
               
            }
            
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    

}

-(void) initTableView{
    
    NSString *message =  @"1:ArmorTableViewController:initTableView...";
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
         
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        
        longPress.minimumPressDuration = 2.0;
        [self.tableView addGestureRecognizer:longPress];
        

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
    
    @try {
        instanceBase = (INSTBaseClass *) anyInstancedItem ;
       
        hasUncommitedChanges = [self.tableView hasUncommittedUpdates];
        
        NSIndexPath *cIndexPath = nil;
      
        if (!hasUncommitedChanges){
            NSIndexPath *iPath = [NSIndexPath indexPathForRow:itemIndex inSection:itemSection];
            
            if (iPath){
                performUpdates = YES;
                cIndexPath = iPath;
            }
  
        }
        else
        {
         NSLog(@"ArmorViewController:updateInstancedItemData:itemIndex [%d] returning to due hasUncommitedChanges", itemIndex);
         return;
        }
        
        if (performUpdates){
        
            [self.tableView performBatchUpdates:^{
                
            BOOL performMatch = NO;
            
              if (instanceBase){
                
                ItemCellTableView *cell = [self.tableView cellForRowAtIndexPath:cIndexPath];
                
                NSLog(@"ArmorViewController:updateInstancedItemData:For IndexPath Section->[%d],Row->[%d]",cIndexPath.section, cIndexPath.row);
                
                  if (anyInstancedId){
                      
                      if (cell.lblInstanceId.text.length == 0){
                          
                          NSLog(@"ArmorViewController:updateInstancedItemData:Setting to [%@] ",anyInstancedId);
                          [cell.lblInstanceId setText:anyInstancedId];
                           
                      }else{
                          
                          NSLog(@"ArmorViewController:updateInstancedItemData:anyInstancedId=[%@],cell.lblInstanceId=[%@]",
                                anyInstancedId,cell.lblInstanceId.text);
                          
                          if (![cell.lblInstanceId.text isEqual:anyInstancedId]){
                              performMatch = YES;
                              NSLog(@"ArmorViewController:Need to perform Match!");
                          }
                          
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
                                    
                                    NSLog(@"ArmorViewController:updateInstancedItemData:Udate to Match[%@] ",iInstanceID);
                                    
                                }
                                
                            }
                            
                        }
                        
                        
                        
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
                
  
        }
            completion:^(BOOL finished) {
                if (finished){
                    NSArray<NSIndexPath *> *visibleIndexPaths = [self.tableView indexPathsForVisibleRows];
                    
                    [self.tableView reloadRowsAtIndexPaths:visibleIndexPaths
                                          withRowAnimation:UITableViewRowAnimationNone];
                    NSLog(@"ArmorViewController:updateInstancedItemData:performBatchUpdates:finished!");
 
                }
            }];
            
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

    
    @try {
        
        hasUncommitedChanges = [self.tableView hasUncommittedUpdates];
    
        NSIndexPath *cIndexPath = nil;
        
        if (! hasUncommitedChanges){

                NSIndexPath *iPath = [NSIndexPath indexPathForRow:itemIndex inSection:itemSection];
                
                if (iPath){
                   performUpdates = YES;
                   cIndexPath = iPath;
                }
            
            if (performUpdates){
            
                
                [self.tableView performBatchUpdates:^{
                    
                    if (invItem){
                        
                        ItemCellTableView *cell = [self.tableView cellForRowAtIndexPath:cIndexPath];
                        
                        static NSString *cellId = @"ItemCellTableView";
                        
                        if (! cell){
                            cell = [[ItemCellTableView alloc] initWithStyle:UITableViewCellStyleDefault
                                                                reuseIdentifier:cellId];
                            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                         
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
                    
                  
                
                }
                 completion:^(BOOL finished) {
                        if (finished){
                            
                            NSArray<NSIndexPath *> *visibleIndexPaths = [self.tableView indexPathsForVisibleRows];
                            
                            [self.tableView reloadRowsAtIndexPaths:visibleIndexPaths
                                                  withRowAnimation:UITableViewRowAnimationNone];
                            
                            NSLog(@"ArmorViewController:updateStaticItemData:performBatchUpdates:finished!");
                        }
                  }];
 
            }
 
        }
        else
        {
            NSLog(@"updateStaticItemData:For IndexPath Section->[%d],Row->[%d] returning due to hasUncommitedChanges",
                  cIndexPath.section, cIndexPath.row);
            
        }
            
      
    } @catch (NSException *exception) {
        NSLog(@"ArmorViewController:updateStaticItemData:Exception->%@",exception.description);
    } @finally {
        invItem = nil;
    }
    
}

 


#pragma mark - Table view data source


-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"Armor:tableView:didSelectRowAtIndexPath");
    
    ItemCellTableView *cCell = nil;
    @try {
        
         cCell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        if (cCell){
            
            NSString *strHashKey = [cCell.lblHash text];
            NSLog(@"didDeselectRowAtIndexPath:For %@ IndexPath Section->[%d],Row->[%d]",strHashKey,indexPath.section, indexPath.row);
            
            
            [cCell.layer setMasksToBounds:NO];
            [cCell.layer setCornerRadius:0];
            [cCell.layer setBorderWidth:1];
            [cCell.layer setShadowOffset: CGSizeMake(0, 0)];
            [cCell.layer setBorderColor:[UIColor clearColor].CGColor];
 

            
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSLog(@"Armor:tableView:didSelectRowAtIndexPath");
    
    ItemCellTableView *tCell =  nil;
    NSString *strHashKey     = nil,
             *strInstanceKey = nil;
    @try {
        
        tCell = (ItemCellTableView*) [self.tableView cellForRowAtIndexPath:indexPath];
        if (tCell){
            
            strHashKey     = [tCell.lblHash text];
            strInstanceKey = [tCell.lblInstanceId text];
            
            if (strInstanceKey.length == 0){
                strInstanceKey = [self resolveItemInstanceId:strHashKey
                                          withItemCollection:self.destArmor];
                
                if (strInstanceKey.length > 0){
                    NSLog(@"ArmorVC:didSelectRow:resolveItemInstanceId=%@:Section->[%d],Row->[%d],Instance->[%@]",
                          tCell.lblItemName.text, indexPath.section,indexPath.row,strInstanceKey);
                    [tCell.lblInstanceId setText:strInstanceKey];
                }
                
            }
            
            
            [tCell.layer setMasksToBounds:YES];
            [tCell.layer setCornerRadius:5];
            [tCell.layer setBorderWidth:3];
            [tCell.layer setShadowOffset: CGSizeMake(-1, 1)];
            [tCell.layer setBorderColor:[UIColor systemYellowColor].CGColor];
            
            NSLog(@"ArmorVC:didSelectRow=%@:Section->[%d],Row->[%d],Static Hash->[%@],Instance->[%@]",
                  tCell.lblItemName.text, indexPath.section,indexPath.row,strHashKey,strInstanceKey);

            
            [self performSegueWithIdentifier:@"segArmorDetails" sender:tCell];
            
           
        }
        
      
        
    } @catch (NSException *exception) {
        NSLog(@"ArmorVC:tableView:didSelectRowAtIndexPath:Exception->%@",exception.description);
    } @finally {
        tCell =  nil;
        strHashKey     = nil;
        strInstanceKey = nil;
        
    }
    
}


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
                    title  = [NSString stringWithFormat:@"%@->%@: [%d/%d]",self->currentClass,[buckDef.displayProperties name],CurrentArmor
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
        NSInteger size = self->RowHeight ;
        //NSLog(@"ArmorViewController:heightForRowAtIndexPath->%ld",(long)size);
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
        
        [UIView setAnimationsEnabled:NO];
        cell = (ItemCellTableView*) [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        
        if (! cell){
            cell = [[ItemCellTableView alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:cellId];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
         
        }
        
        [cell setParentTableView:self.tableView];
        [cell setParentViewController:self];
        
     
        //NSLog(@"6:ArmorTableViewController:cellForRowAtIndexPath:Section->%d,Row->%d,",indexPath.section,indexPath.row);

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
                    
                    if (cell.lblItemName.text.length > 0){
                    NSLog(@"ArmorVC:CellFor=%@,InstanceId->%@,Hash->%@,Section->%d,Row->%d,",cell.lblItemName.text, cell.lblInstanceId.text,
                          cell.lblHash.text,
                          indexPath.section,indexPath.row);
                    
                    NSLog(@"ArmorVC:ItemFor=InstanceId->%@,Hash->%@,Section->%d,Row->%d,", item.itemInstanceId,
                          strHashKey,
                          indexPath.section,indexPath.row);
                    
                    }
                    [cell.lblCharacterId setText:self.selectedChar];
                    
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
        [UIView setAnimationsEnabled:YES];
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
