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
#import "GuardianViewController.h"
#import "WeaponDetailsViewController.h"

@interface WeaponsTableViewController ()
{
    AppDelegate *appDelegate;
    
    NSMutableArray *primaryWeapons,
                   *energyWeapons,
                   *powerWeapons,
                   *ghosts,
                   *artifact;
    
    NSMutableDictionary *instanceData,
                        *destCharData,
                        *allCharsData;
    
    NSInteger sharedSection ;
    
    BOOL useCView;
    
    NSInteger RowHeight;
    
    NSString *currentClass;
    
    UIImageView *cImage;
}

@property (nonatomic, strong) NSMutableArray *primaryWeaponsArray;
@property (nonatomic, strong) NSMutableArray *energyWeaponsArray;
@property (nonatomic, strong) NSMutableArray *heavyWeaponsArray;
@property (nonatomic, strong) NSMutableArray *ghostsArray;
@property (nonatomic, strong) NSMutableArray *artifactArray;
@property (nonatomic, strong) NSArray *colorArray;

@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;

@end

@implementation WeaponsTableViewController

@synthesize destWeapons = _destWeapons;
@synthesize selectedChar = _selectedChar;
@synthesize selectedCharEmblem = _selectedCharEmblem;
@synthesize selectedMembership = _selectedMembership;
@synthesize destWeaponBuckets = _destWeaponBuckets;
@synthesize selectedCharData = _selectedCharData;
@synthesize destChars = _destChars;
@synthesize parentVC = _parentVC;
@synthesize searchWeapons = _searchWeapons;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    self->RowHeight = 90;
    
    [self.segTableView setHidden:YES];
    
    NSString *strClass  = nil,
             *strRace   = nil,
             *strGender = nil,
             *strLight  = nil;
    
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
                        
                        self->currentClass = [strClass copy];
                        
                        strRace  = [Utilities decodeRaceHash:raceType];
                        strGender = [Utilities decodeGenderHash:genderHash];
                        strLight  = [cData objectForKey:@"light"];
                    }
                }
            }
            
            
        }
   
    
    if (self.selectedCharEmblem){
    
        
        //UIImageView *charImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"header_%@.png",strClass]]];
        
        //self->cImage = charImage;
        self->cImage = self.selectedCharEmblem;
    
        [self->cImage setFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)];
    
        CGRect  lblFrame = CGRectMake(50, -20, self.tableView.frame.size.width, 80);
        
        UILabel *lblChar   = [[UILabel alloc] initWithFrame:lblFrame];
        
        [lblChar setTextAlignment:NSTextAlignmentLeft];
        [lblChar setFont:[UIFont fontWithName:kDefaultFontName size:22]];
        [lblChar setTextColor:[UIColor systemOrangeColor]];
        [lblChar setText:[NSString stringWithFormat:@"%@//%@//%@//%@",strLight,strClass,strRace,strGender]];
        
    
        [self->cImage addSubview:lblChar];
        
        [self.navigationItem setTitle:@"Weapons"];
 
        [self.navigationItem setTitleView:self->cImage];
  
 
     
    }
       
    
    UIBarButtonItem *btnClose =  [[UIBarButtonItem alloc] init];
    
    
    if (btnClose){
        [btnClose setTitle:@"Close"];
        [btnClose setTarget:self];
        [btnClose setAction:@selector(closeAction)];
        [btnClose setTintColor:[UIColor systemOrangeColor]];
    }

    self.navigationItem.rightBarButtonItem = btnClose;
    
 
    self->useCView = NO;
    
    self->appDelegate = [AppDelegate currentDelegate];
    [self setupBackgroundImage:strClass];
    [self initTableView];
    [self initSearchBar];
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
    
    WeaponDetailsViewController *targetVC = nil;
    ItemCellTableView *selectedCell = nil;
    
    INSTBaseClass *itemResponse = nil;
    
    NSString *weaponKey   = nil,
             *compareKey  = nil,
             *instanceKey = nil;
    
    @try {
        
        targetVC = (WeaponDetailsViewController *) segue.destinationViewController;
        
        selectedCell = (ItemCellTableView*) sender;
        if ([targetVC isKindOfClass:[WeaponDetailsViewController class]]){
           
            if (selectedCell){
                
                weaponKey = selectedCell.lblHash.text;
                instanceKey = selectedCell.lblInstanceId.text;
                
                if (instanceKey.length == 0){
                    instanceKey = [self resolveItemInstanceId:weaponKey
                                           withItemCollection:self.destWeapons];
                    
                    if (instanceKey.length > 0){
                        [selectedCell.lblInstanceId setText:instanceKey];
                    }
                }
                
                if (weaponKey){
                    
                    
                    compareKey = [self resolveItemInstanceId:weaponKey
                                         withItemCollection:self.destWeapons];
                    
                    if (![instanceKey isEqualToString:compareKey] ){
                        NSLog(@"WeaponsVC:prepareForSegue:Setting MatchFrom=%@, To=%@",instanceKey,compareKey);
                        [selectedCell.lblInstanceId setText:compareKey];
                        
                    }
                    
                    
                    itemResponse =  (INSTBaseClass*) [self->instanceData objectForKey:weaponKey];
                    
                    if (itemResponse){
                        
                        [targetVC loadWeaponDetail:itemResponse
                                    withWeaponCell:selectedCell
                                    charactersData:self->allCharsData];
                        
                    }
                    
                }
            }
        }
        
    } @catch (NSException *exception) {
        NSLog(@"WeaponsVC:prepareForSegue:Exception=%@",exception.description);
    } @finally {
        
        targetVC = nil;
        selectedCell = nil;
        
        itemResponse = nil;
        weaponKey   = nil;
        instanceKey = nil;
    }
    
}


- (void)closeAction {
    
    NSLog(@"WeaponsViewController:closeAction:Invoked...");
     
    [self.navigationController dismissViewControllerAnimated:NO completion:^{
    
        NSLog(@"WeaponsViewController:closeAction:Completed...");
        
        GuardianViewController *gVC = nil;
        
        if (! self.parentVC){
            NSLog(@"WeaponsViewController:closeAction:Not Parent VC Detected:exiting...");
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

- (void)refreshLockedWeaponAction:(NSString *) weaponHash{
    
    ItemCellTableView *selectedCell = nil;
    

    NSIndexPath *selectedRow = nil;
    
    UIImage *lockImage = [UIImage systemImageNamed:@"lock"],
            *unLockImage = [UIImage systemImageNamed:@"lock.open"];
    
    @try {
        
        selectedRow  =  [self.tableView indexPathForSelectedRow];
        
        if (!selectedRow){
            NSLog(@"WeaponsViewController:refreshLockedWeaponAction:No Row selected to Refesh:Exiting...");
            return;
        }
        
        selectedCell = [self.tableView cellForRowAtIndexPath:selectedRow];
        
        if (!selectedCell){
            NSLog(@"WeaponsViewController:refreshLockedWeaponAction:No Cell selected for IndexPath");
            return;
        }
        
        
        if (weaponHash){
            
             
            //[self.refreshControl beginRefreshing];
            
            [self.tableView beginUpdates];
            
            if ([selectedCell.btnLockAction.currentImage isEqual:lockImage]){
                [selectedCell.btnLockAction setImage:unLockImage forState:UIControlStateNormal];
            }else{
                [selectedCell.btnLockAction setImage:lockImage forState:UIControlStateNormal];
            }
            NSLog(@"WeaponsViewController:refreshLockedWeaponAction:Refreshing UI");
 
            [self.tableView endUpdates];
            
               // [self.tableView reloadData];
            // [self.refreshControl endRefreshing];
              NSLog(@"WeaponsViewController:refreshLockedWeaponAction:finished!");
            
            
            [self.tableView deselectRowAtIndexPath:selectedRow animated:NO];
            
            NSLog(@"WeaponsViewController:refreshLockedArmorAction:deselectRowAtIndexPath");
            
        }
        
            
    } @catch (NSException *exception) {
        NSLog(@"WeaponsViewController:refreshLockedWeaponAction:Exception->%@",exception.description);
    } @finally {
        
        selectedCell = nil;
    
    }
    
}

-(void)refreshEquippedWeaponAction:(NSString *)weaponHash{
    
    
    ItemCellTableView *selectedCell = nil;
    
    NSArray<UITableViewCell*> *visibleCells = nil;
    NSArray<NSIndexPath*>  *visibleIndexes  = nil;
    
    NSIndexPath *selectedRow = nil;
    
    @try {
        
        selectedRow  =  [self.tableView indexPathForSelectedRow];
        
        if (!selectedRow){
            NSLog(@"WeaponsViewController:refreshEquippedWeaponAction:No Row selected to Refesh:Exiting...");
            return;
        }
        
        selectedCell = [self.tableView cellForRowAtIndexPath:selectedRow];
        
        if (!selectedCell){
            NSLog(@"WeaponsViewController:refreshEquippedWeaponAction:No Cell selected for IndexPath");
            return;
        }
        
        
        if (weaponHash){
            
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
            
                NSLog(@"WeaponsViewController:refreshEquippedWeaponsAction:Refreshing UI");
                
                /*[self.tableView reloadRowsAtIndexPaths:visibleIndexes
                                      withRowAnimation:UITableViewRowAnimationAutomatic];*/

                
                [self.tableView endUpdates];
            
               // [self.tableView reloadData];
             [self.refreshControl endRefreshing];
              NSLog(@"WeaponsViewController:refreshEquippedWeaponsAction:finished!");
            
            
        }
        
            
    } @catch (NSException *exception) {
        NSLog(@"WeaponsViewController:refreshEquippedWeaponAction:Exception->%@",exception.description);
    } @finally {
        
        selectedCell = nil;
        
        visibleCells = nil;
        visibleIndexes  = nil;
        
        selectedRow = nil;
    }
    
    
    
}

- (void)removeWeaponAction:(NSString *) weaponHash{
    
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
        
          
        
            for(int ikIdx = 0;ikIdx < self.destWeaponBuckets.count; ikIdx ++){
              
                switch (ikIdx) {
                    case 0:
                        primaryBucketKey  = [self.destWeaponBuckets objectAtIndex:ikIdx];
                        break;
                        
                    case 1:
                        energyBucketKey   = [self.destWeaponBuckets objectAtIndex:ikIdx];
                        break;
                        
                    case 2 :
                        heavyBucketKey    = [self.destWeaponBuckets objectAtIndex:ikIdx];
                        break;
                        
                    case 3 :
                        ghostBucketKey    = [self.destWeaponBuckets objectAtIndex:ikIdx];
                        break;
                    case 4:
                        artBucketKey      = [self.destWeaponBuckets objectAtIndex:ikIdx];
                        break;
                }
                
            }
        
            weaponHashFilter = [NSString stringWithFormat:@"%@_%@_%@",self.selectedChar,primaryBucketKey,weaponHash];
            bPredicate       = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",weaponHashFilter];
        
        
            primaryFilteredResult = [self->primaryWeapons filteredArrayUsingPredicate:bPredicate];
            if (primaryFilteredResult.count > 0){
                [self->primaryWeapons removeObject:weaponHashFilter];
                bucketHashFilter = [NSString stringWithFormat:@"%@_%@",primaryBucketKey,weaponHash];
                NSLog(@"WeaponsViewController:removeWeaponAction:Removed Primary Weapon->%@ from primaryWeaponsArray...",weaponHashFilter);
            }
        
        
            weaponHashFilter = [NSString stringWithFormat:@"%@_%@_%@",self.selectedChar,energyBucketKey,weaponHash];
            bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",weaponHashFilter];
 
            energyFilteredResult = [self->energyWeapons filteredArrayUsingPredicate:bPredicate];
            if (energyFilteredResult.count > 0){
                [self->energyWeapons removeObject:weaponHashFilter];
                bucketHashFilter = [NSString stringWithFormat:@"%@_%@",energyBucketKey,weaponHash];
                NSLog(@"WeaponsViewController:removeWeaponAction:Removed Energy Weapon->%@ from energyWeaponsArray...",weaponHashFilter);
            }
        
            weaponHashFilter = [NSString stringWithFormat:@"%@_%@_%@",self.selectedChar,heavyBucketKey,weaponHash];
            bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",weaponHashFilter];
     
            heavyFilteredResult = [self->powerWeapons filteredArrayUsingPredicate:bPredicate];
            if (heavyFilteredResult.count > 0){
                [self->powerWeapons removeObject:weaponHashFilter];
                bucketHashFilter = [NSString stringWithFormat:@"%@_%@",heavyBucketKey,weaponHash];
                NSLog(@"WeaponsViewController:removeWeaponAction:Removed Heavy Weapon->%@ from heavyWeaponsArray...",weaponHashFilter);
            }
        
        
            weaponHashFilter = [NSString stringWithFormat:@"%@_%@_%@",self.selectedChar,ghostBucketKey,weaponHash];
            bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",weaponHashFilter];
    
            ghostFilteredResult = [self->ghosts filteredArrayUsingPredicate:bPredicate];
            if (ghostFilteredResult.count > 0){
                [self->ghosts  removeObject:weaponHashFilter];
                bucketHashFilter = [NSString stringWithFormat:@"%@_%@",ghostBucketKey,weaponHash];
                NSLog(@"WeaponsViewController:removeWeaponAction:Removed Ghost->%@ from ghostsArray...",weaponHashFilter);
            }
        
            weaponHashFilter = [NSString stringWithFormat:@"%@_%@_%@",self.selectedChar,artBucketKey,weaponHash];
            bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",weaponHashFilter];
    
            artFilteredResult = [self->artifact filteredArrayUsingPredicate:bPredicate];
            if (artFilteredResult.count > 0){
                [self->artifact removeObject:weaponHashFilter];
                bucketHashFilter = [NSString stringWithFormat:@"%@_%@",artBucketKey,weaponHash];
                NSLog(@"WeaponsViewController:removeWeaponAction:Removed Artifact->%@ from Artifacy...",weaponHashFilter);
            }
                
            if ([self.destWeapons.allKeys containsObject:bucketHashFilter]){
                [self.destWeapons removeObjectForKey:bucketHashFilter];
                NSLog(@"WeaponsViewController:removeWeaponAction:Removing Weapon by Bucket Hash->%@ from All destWeapons...",bucketHashFilter);
            }
        
            if ([self.destWeapons.allKeys containsObject:weaponHashFilter]){
                [self.destWeapons removeObjectForKey:weaponHashFilter];
                NSLog(@"WeaponsViewController:removeWeaponAction:Removing Weapon by Full Hash->%@ from All destWeapons...",weaponHashFilter);
            }
        
            if ([self->instanceData.allKeys containsObject:weaponHashFilter]){
                [self->instanceData removeObjectForKey:weaponHashFilter];
                NSLog(@"WeaponsViewController:removeWeaponAction:Removing Weapon by Full Hash->%@ from Weapons instanceData...",weaponHashFilter);
            }
        
            if ([self->instanceData.allKeys containsObject:weaponHash]){
                [self->instanceData removeObjectForKey:weaponHash];
                NSLog(@"WeaponsViewController:removeWeaponAction:Removing Weapon by Hash ->%@ from Weapons instanceData...",weaponHash);
            }
     
        
        selectedRow  =  [self.tableView indexPathForSelectedRow];
        
        if (selectedRow){
         
          deletedRows = [[NSArray<NSIndexPath*> alloc] initWithObjects:selectedRow, nil];
            
         //Need to remove table cell
         [self.refreshControl beginRefreshing];
            [self.tableView beginUpdates];
            
            NSLog(@"WeaponsViewController:removeWeaponsAction:Removing Actioned Weapon from UI");
            
            [self.tableView deleteRowsAtIndexPaths:deletedRows
                               withRowAnimation:UITableViewRowAnimationFade];
            
            [self.tableView endUpdates];
            [self.tableView reloadData];
         [self.refreshControl endRefreshing];
          NSLog(@"WeaponsViewController:removeWeaponAction:finished!");
        }
        
        
        
    } @catch (NSException *exception) {
        NSLog(@"WeaponsViewController:removeWeaponAction:Exception->%@",exception.description);
    } @finally {
        selectedRow = nil;
        deletedRows = nil;
    }
}

-(void) registerNotifications{

    NSLog(@"1:WeaponsViewController:registerNotifications...");
    
    
    //BEGIN Transfer Item Notification
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyTransferItemNotification
                      object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                                               
                                               
    NSDictionary *respData  = (NSDictionary*) [note object],
                 *userInfo  = [note userInfo];
    
    TRXBaseClass *payload  = nil;
        if (userInfo){
            
            payload = (TRXBaseClass *) [userInfo objectForKey:@"TransferObject"];
        }
            
       
       if (respData){
                      
           NSString *respStatus     = [respData objectForKey:@"ErrorStatus"],
                    *transferAction = @"Transfer Item";
                                                  
           if (respStatus){
               //Transfer Item Action was Successfull!
               if ([respStatus isEqualToString:@"Success"]){
                                       
                NSString *strMessage = @"Item was successfull Transferred!";
                   
                //TODO determine which character was the item sent
                   
                   
                if (payload){
                       
                    NSString *targetCharKey = payload.targetCharacterId,
                             *itemReference = payload.itemReferenceHash,
                             *itemId        = payload.itemId;
                    
                    if (itemReference){
                        
                        if([self->instanceData.allKeys containsObject:itemReference]){
                          [self->instanceData removeObjectForKey:itemReference];
                            NSLog(@"WeaponsController:kDestinyTransferItemNotification:Removed Item->%@",itemReference);
                        }
                        
                    }
                    
                    if (itemId){
                        
                        if([self.destWeapons.allKeys containsObject:itemId]){
                          [self.destWeapons removeObjectForKey:itemId];
                            NSLog(@"WeaponsController:kDestinyTransferItemNotification:Removed Item->%@",itemId);
                        }
                        
                    }
                    
                    if (targetCharKey){
                        
                        NSDictionary *targetCharData = [self->allCharsData objectForKey:targetCharKey];
                        
                        if (targetCharData){
                            
                             NSDictionary *chData = [targetCharData objectForKey:@"character"];
                                
                                if (chData){
                                    NSDictionary *cData = [chData objectForKey:@"data"];
                                
                                    if (cData){
                                        NSString *classHash = [cData objectForKey:@"classHash"],
                                                 *strClass = [Utilities decodeClassHash:classHash],
                                                 *strNotication = @"",
                                                 *strMessage     = @"Item was successfully sent to %@!";
                                       
                                        
                                        if(strClass){
                                            
                                            if ([strClass isEqualToString:@"Warlock"]){
                                                strNotication = kDestinyTransferToWarlockNotification;
                                            }
                                            
                                            if ([strClass isEqualToString:@"Titan"]){
                                                strNotication = kDestinyTransferToTitanNotification;
                                            }
                                            
                                            if ([strClass isEqualToString:@"Hunter"]){
                                                strNotication = kDestinyTransferToHunterNotification;
                                            }
                                            
                                            
                                            if (strNotication.length > 0){
                                                
                                            strMessage = [NSString stringWithFormat:strMessage,strClass ];
                                                
                                            [[NSNotificationCenter defaultCenter]
                                                    postNotificationName:strNotication
                                                                    object:respData
                                                                    userInfo:userInfo];
                                                
                                                NSLog(@"WeaponsTableViewController:PostingNotication->%@",strNotication);
                                                
                                                UIAlertController* alertOk = [UIAlertController alertControllerWithTitle:@"Transfer Weapon Notification"
                                                                    message:strMessage
                                                                    preferredStyle:UIAlertControllerStyleAlert];
                                                                    
                                                UIAlertAction* actionOk = [UIAlertAction actionWithTitle:@"OK"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction * action) {
                                                    NSLog(@"Transfer Weapon Notification:Action Ok:Clicked");
                                                    [self closeAction];
                                                }];
                                                                        
                                                [alertOk addAction:actionOk];
                                            
                                                [self presentViewController:alertOk animated:NO completion:nil];
                                                
                                            }
                                        }
                                     
                                    }
                                }
                       
                        }
                        
                    }
                }
                                       
               }
               //BEGIN Transfer Item Action Issue
               else{
                                       
               NSString *errorCode    = [respData objectForKey:@"ErrorCode"],
                        *errorStatus  = [respData objectForKey:@"ErrorStatus"],
                        *errorMessage = [respData objectForKey:@"Message"];
               //Display Error Details
                           
               UIAlertController* alertError = [UIAlertController alertControllerWithTitle:errorStatus
                                   message:errorMessage
                            preferredStyle:UIAlertControllerStyleAlert];
                                       
               UIAlertAction* transferItemErrorAction = [UIAlertAction actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                       NSLog(@"ItemCellTableView:transferItemErrorAction=[%@-%@]",errorCode,errorStatus);
                                           
               }];
                                       
                [alertError addAction: transferItemErrorAction];
                 
                   //Display  Transfer Item Error
                [self presentViewController:alertError animated:NO completion:nil];
                  
                }
               //END Transfer Item Action Issue
             }
       }
                        
    }];
     //END Transfer Item Notification
    
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
                            
                            [self updateStaticItemData:[strIdx integerValue]
                                          tableSection:[strSdx integerValue]
                                   usingStaticBaseItem:invItem];
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
                    
                    [self updateInstancedItemData:[strIdx integerValue]
                                     tableSection:[strSdx integerValue]
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
    
    if ( self.primaryWeaponsArray && self.energyWeaponsArray && self.heavyWeaponsArray && self.ghostsArray && self.artifactArray ){
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
            case 3:
                
                if (self->ghosts)
                {
                    NSMutableArray *gArray  = [NSMutableArray arrayWithCapacity:[self->ghosts count]];
                    for (NSString *pKey in self->ghosts) {
                        
                        //if (![gArray containsObject:pKey]){
                            [gArray addObject:pKey];
                        //}
                        
                    }
                    self.ghostsArray = [NSMutableArray arrayWithArray:gArray];
                }
                
                break;
            case 4:
                
                if (self->artifact)
                {
                    NSMutableArray *aArray  = [NSMutableArray arrayWithCapacity:[self->artifact count]];
                    for (NSString *pKey in self->artifact) {
                        
                       // if (![aArray containsObject:pKey]){
                            [aArray addObject:pKey];
                       // }
                        
                    }
                    self.artifactArray = [NSMutableArray arrayWithArray:aArray];
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


-(void) handleDoubleTap:(UITapGestureRecognizer *) recognize{
    
    //NSLog(@"WeaponsTableViewController:handleDoubleTap:Invoked...");
    
    ItemCellTableView *cCell = nil;
    
    BOOL processRequest = NO;
    @try {
        
        
        switch(recognize.state){
            case UIGestureRecognizerStateEnded:
                NSLog(@"WeaponsTableViewController:handleDoubleTap:UIGestureRecognizerStateEnded:Detected...");
                break;
            case UIGestureRecognizerStateBegan:
                NSLog(@"WeaponsTableViewController:handleDoubleTap:UIGestureRecognizerStateBegan:Detected...");
                processRequest = YES;
                break;
            case UIGestureRecognizerStateChanged:
                NSLog(@"WeaponsTableViewController:handleDoubleTap:UIGestureRecognizerStateChanged:Detected...");
                break;
            case UIGestureRecognizerStateCancelled:
                NSLog(@"WeaponsTableViewController:handleDoubleTap:UIGestureRecognizerStateCancelled:Detected...");
                break;
            case UIGestureRecognizerStatePossible:
                NSLog(@"WeaponsTableViewController:handleDoubleTap:UIGestureRecognizerStatePossible:Detected...");
                break;
            case UIGestureRecognizerStateFailed:
                NSLog(@"WeaponsTableViewController:handleDoubleTap:UIGestureRecognizerStateFailed:Detected...");
                break;
        }
        
       
        
        if (processRequest){
            
            NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
            
            if (selectedIndexPath){
            
                cCell = (ItemCellTableView*) [self.tableView cellForRowAtIndexPath:selectedIndexPath];
                
                if (cCell){
                    
                NSString *strHashKey = [cCell.lblInstanceId text],
                         *strStaticKey = [cCell.lblHash text];
                    
                NSLog(@"handleDoubleTap:For %@ IndexPath Section->[%d],Row->[%d]",strHashKey,selectedIndexPath.section, selectedIndexPath.row);
                
                    if (strHashKey.length == 0){
                        
                        strHashKey = [self resolveItemInstanceId:strStaticKey
                                              withItemCollection:self.destWeapons];
                        
                         
                        [cCell.lblInstanceId setText:strHashKey];
                       
                    }
                  
                    [cCell.lblInstanceId setText:strHashKey];
                    [cCell transferItemAction:self->allCharsData];
                    
               }
               
            }
            
        }
        
    } @catch (NSException *exception) {
        NSLog(@"WeaponsTableViewController:handleDoubleTap:Exception->%@",exception.description);
    } @finally {
        
        cCell = nil;
        
        processRequest = NO;
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
                    NSLog(@"WeaponsVC:resolveItemInstanceId:For StaticHash=[%@] with InstanceHash=[%@]",staticKey,strInstanceHashKey);
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

-(void) handleLongPress:(UILongPressGestureRecognizer *) recognize{
    
    NSLog(@"WeaponsTableViewController:handleLongPress:Invoked...");
    
    ItemCellTableView *cCell = nil;
    
    BOOL processRequest = NO;
    @try {
        
        
        switch(recognize.state){
            case UIGestureRecognizerStateEnded:
                NSLog(@"WeaponsTableViewController:UIGestureRecognizerStateEnded:Detected...");
                break;
            case UIGestureRecognizerStateBegan:
                NSLog(@"WeaponsTableViewController:UIGestureRecognizerStateBegan:Detected...");
                processRequest = YES;
                break;
            case UIGestureRecognizerStateChanged:
                NSLog(@"WeaponsTableViewController:UIGestureRecognizerStateChanged:Detected...");
                break;
            case UIGestureRecognizerStateCancelled:
                NSLog(@"WeaponsTableViewController:UIGestureRecognizerStateCancelled:Detected...");
                break;
            case UIGestureRecognizerStatePossible:
                NSLog(@"WeaponsTableViewController:UIGestureRecognizerStatePossible:Detected...");
                break;
            case UIGestureRecognizerStateFailed:
                NSLog(@"WeaponsTableViewController:UIGestureRecognizerStateFailed:Detected...");
                break;
        }
        
       
        
        if (processRequest){
            
            NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
            
            if (selectedIndexPath){
            
                cCell = (ItemCellTableView*) [self.tableView cellForRowAtIndexPath:selectedIndexPath];
             
                if (cCell){
                    
                NSString *strHashKey = [cCell.lblInstanceId text],
                         *strStaticKey = [cCell.lblHash text];
                    
                NSLog(@"handleLongPress:For %@ IndexPath Section->[%d],Row->[%d]",strHashKey,selectedIndexPath.section, selectedIndexPath.row);
                
                    if (strHashKey.length > 0){
                        [cCell equipItem:cCell];
                    }
                    else{
                        
                        strHashKey = [self resolveItemInstanceId:strStaticKey
                                              withItemCollection:self.destWeapons];
                        
                   
                        if (strHashKey.length > 0){
                            [cCell.lblInstanceId setText:strHashKey];
                        
                            [cCell equipItem:cCell];
                        }
                        
                    }
               }
               
            }
            
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    

}

-(void) initSearchBar{
    
    
    //self.searchWeapons = [[UISearchBar alloc] initWithFrame:self.segTableView.frame];
 
    [self.searchWeapons setDelegate:self];
    
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
            
            
        }else{
            
            /*UILongPressGestureRecognizer *doubleTap = [[UILongPressGestureRecognizer alloc]
                                                 initWithTarget:self action:@selector(handleDoubleTap:)];
            
            
            doubleTap.minimumPressDuration = 3.0;
            doubleTap.numberOfTouchesRequired = 2.0;
            [self.tableView addGestureRecognizer:doubleTap];*/
            
            
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
            
            
            longPress.minimumPressDuration = 2.0;
            longPress.numberOfTouchesRequired = 1.0;
            [self.tableView addGestureRecognizer:longPress];
             
            
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
        else{
           
          NSLog(@"WeaponsViewController:updateInstancedItemData:itemIndex [%d] returning to due hasUncommitedChanges", itemIndex);
          return;

        }
        
        if (performUpdates){
              //[UIView setAnimationsEnabled:NO];
              //[self.tableView.refreshControl beginRefreshing];
                [self.tableView performBatchUpdates:^{
           
            BOOL   performMatch   = NO;
                    
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
                
                NSLog(@"WeaponsViewController:updateInstancedItemData:For IndexPath Section->[%d],Row->[%d]",
                      cIndexPath.section, cIndexPath.row);
                
                if (anyInstancedId){
                    
                    if (cell.lblInstanceId.text.length == 0){
                        
                        NSLog(@"WeaponsViewController:updateInstancedItemData:Setting to [%@] ",anyInstancedId);
                        [cell.lblInstanceId setText:anyInstancedId];
                        [cCell.lblInstanceId setText:anyInstancedId];
                        
                    }else{
                        
                        NSLog(@"WeaponsViewController:updateInstancedItemData:anyInstancedId=[%@],cell.lblInstanceId=[%@]",
                              anyInstancedId,cell.lblInstanceId.text);
                        
                        if (![cell.lblInstanceId.text isEqual:anyInstancedId]){
                            performMatch = YES;
                            NSLog(@"WeaponsViewController:Need to perform Match!");
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
                                    
                                    NSLog(@"WeaponsViewController:updateInstancedItemData:Udate to Match[%@] ",iInstanceID);
                                    
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
                                          
                                        /*[cell setHighlighted:YES];
                                          
                                        [cCell setHighlighted:YES];*/
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
        
            }completion:^(BOOL finished) {
              if (finished){
               
                  NSArray<NSIndexPath *> *visibleIndexPaths = [self.tableView indexPathsForVisibleRows];
                  
                  [self.tableView reloadRowsAtIndexPaths:visibleIndexPaths
                                        withRowAnimation:UITableViewRowAnimationNone];
                 
                  NSLog(@"WeaponsViewController:updateInstancedItemData:performBatchUpdates:finished!");
                  
                 
              }
            }];
           //     [self.tableView.refreshControl endRefreshing];
            //    [UIView setAnimationsEnabled:YES];
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
               // [self.refreshControl beginRefreshing];
               // [UIView setAnimationsEnabled:NO];
                
                [self.tableView performBatchUpdates:^{
                 
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
                            
                            [cell.imgItem.layer setMasksToBounds:NO];
                            [cell.imgItem.layer setBorderWidth:0];
                            //[cell.imgItem.layer setShadowOffset: CGSizeMake(-1, 1)];
                            [cell.imgItem.layer setBorderColor:[UIColor clearColor].CGColor];
                            
                            [cell.imgCrafted setHidden:YES];
                            
                            if (invItem.message){
                            
                                
                                switch([invItem.message integerValue]){
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
                                        break;
                                        
                                    case 5://Masterwork locked
                                        [cell.btnLockAction setImage:[UIImage systemImageNamed:@"lock"]
                                                                forState:UIControlStateNormal];
                                        [cell.imgItem.layer setMasksToBounds:YES];
                                        [cell.imgItem.layer setBorderWidth:2];
                                        [cell.imgItem.layer setShadowOffset: CGSizeMake(-1, 1)];
                                        [cell.imgItem.layer setBorderColor:[UIColor yellowColor].CGColor];
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
                                        
                                        break;
                                    case 16://red bar
                                        
                                        [cell.imgItem.layer setMasksToBounds:YES];
                                        [cell.imgItem.layer setBorderWidth:2];
                                        [cell.imgItem.layer setShadowOffset: CGSizeMake(-1, 1)];
                                        [cell.imgItem.layer setBorderColor:[UIColor orangeColor].CGColor];
                                        
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
                                        [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_stasis.png"]];
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
                            
                            NSURL   *imageURL      = nil,
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
                 

                }
                completion:^(BOOL finished) {
                    if (finished){
                        
                        NSArray<NSIndexPath *> *visibleIndexPaths = [self.tableView indexPathsForVisibleRows];
                        
                        [self.tableView reloadRowsAtIndexPaths:visibleIndexPaths
                                              withRowAnimation:UITableViewRowAnimationNone];
                        
                        NSLog(@"WeaponsViewController:updateStaticItemData:performBatchUpdates:Finished!");
                    }
                       
                }];
              
               // [self.refreshControl endRefreshing];
               // [UIView setAnimationsEnabled:YES];
          }
            
        }
        else{
            NSLog(@"WeaponsViewController:UpdateStaticItemData:For IndexPath Section->[%d],Row->[%d] returning due to    hasUncommitedChanges",
                  cIndexPath.section,
                  cIndexPath.row);
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
                case 3:
                    CurrentWeapons = [self->ghosts count];
                    TotalWeapons = 4;
                    break;
                case 4:
                    CurrentWeapons = [self->artifact count];
                    TotalWeapons = 1;
                    break;
            }
            
            bucketHash = [self.destWeaponBuckets objectAtIndex:section];
            
            if (appDelegate.destinyInventoryBucketDefinitions){
                
                buckDef =  [appDelegate.destinyInventoryBucketDefinitions objectForKey:bucketHash];
                if (buckDef){
                    title  = [NSString stringWithFormat:@"%@->%@: [%d/%d]",self->currentClass, [buckDef.displayProperties name],CurrentWeapons,TotalWeapons];
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

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"Weapons:tableView:didSelectRowAtIndexPath");
    
    ItemTableViewCell *cCell = nil;
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
    NSLog(@"Weapons:tableView:didSelectRowAtIndexPath");
    
    ItemTableViewCell *cCell = nil;
    ItemCellTableView *tCell =  nil;
    
    NSString *strHashKey     = nil,
             *strInstanceKey = nil;
    
    @try {
        
         cCell = [self.tableView cellForRowAtIndexPath:indexPath];
         
         tCell = (ItemCellTableView*) [self.tableView cellForRowAtIndexPath:indexPath];
        
        if (tCell){
            
            strHashKey     = [tCell.lblHash text];
            strInstanceKey = [tCell.lblInstanceId text];
            
            if (strInstanceKey.length == 0){
                strInstanceKey = [self resolveItemInstanceId:strHashKey
                                          withItemCollection:self.destWeapons];
                
                if (strInstanceKey.length > 0){
                    
                    [tCell.lblInstanceId setText:strInstanceKey];
                }
                
            }
            
            
            [tCell.layer setMasksToBounds:YES];
            [tCell.layer setCornerRadius:5];
            [tCell.layer setBorderWidth:3];
            [tCell.layer setShadowOffset: CGSizeMake(-1, 1)];
            [tCell.layer setBorderColor:[UIColor systemYellowColor].CGColor];
            
            NSLog(@"WeaponsVC:didSelectRow=%@ Section->[%d],Row->[%d],Static Hash->[%@],Instance->[%@]",
                  tCell.lblItemName.text, indexPath.section,indexPath.row,strHashKey,strInstanceKey);

            
            [self performSegueWithIdentifier:@"segWeaponDetail" sender:tCell];
           
        }
        
      
        
    } @catch (NSException *exception) {
        NSLog(@"WeaponsVC:tableView:didSelectRowAtIndexPath:Exception->%@",exception.description);
    } @finally {
        cCell = nil;
        tCell =  nil;
        strHashKey     = nil;
        strInstanceKey = nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 0,
              pRows = 0,
              sRows = 0,
              hRows = 0,
              gRows = 0,
              aRows = 0;
    
    NSArray *weaponsArray = [[NSArray alloc] initWithObjects:@"1498876634",@"2465295065",@"953998645",@"4023194814",@"1506418338",nil];
    
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
            
            if (! self->ghosts){
                self->ghosts = [[NSMutableArray alloc] init];
            }
            else{
                if (section == 3){
                    if ([self->ghosts count] > 0){
                        rows = [self->ghosts count];
                        
                        if (self->useCView){
                            rows = 1;
                        }
                        
                        return rows;
                    }
                }
            }
            
            if (! self->artifact){
                self->artifact = [[NSMutableArray alloc] init];
            }
            else{
                if (section == 4){
                    if ([self->artifact count] > 0){
                        rows = [self->artifact count];
                        
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
                        case 3:
                            [self->ghosts addObject:weaponKey];
                            gRows +=1;
                            break;
                        case 4:
                            [self->artifact addObject:weaponKey];
                            aRows +=1;
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
                case 3:
                    
                    rows = gRows;
                    
                    if (self->useCView){
                        rows = 1;
                    }
                    break;
                case 4:
                    
                    rows = aRows;
                    
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
        case 3:
            
            if (self.ghostsArray){
                items = [self.ghostsArray count];
            }
            
            break;
        case 4:
            
            if (self.artifactArray){
                items = [self.artifactArray count];
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
                case 3:
                    
                    if (self->ghosts){
                        strFullKey = [self->ghosts objectAtIndex:cRow];
                    }
                    strBucketKey = [self.destWeaponBuckets objectAtIndex:cSection];
                    break;
                case 4:
                    
                    if (self->artifact){
                        strFullKey = [self->artifact objectAtIndex:cRow];
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
                            
                            
                            if ([buckDef.displayProperties.name isEqualToString:@"Ghost"]){
                                [cell.imgBackground setHidden:YES];
                            }
                            
                            if ([buckDef.displayProperties.name isEqualToString:@"Seasonal Artifact"]){
                                [cell.imgBackground setHidden:YES];
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
                                    [cell.imgItemBurn setImage:[UIImage imageNamed:@"damage_stasis.png"]];
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

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderAtIndexPath:(NSIndexPath *)indexPath{
        NSInteger size = 10;
        
    if (indexPath.section == 0){
     //   size = self->RowHeight;
    }
    
    //NSLog(@"WeaponsTableViewController:heightForRowAtIndexPath->%ld",size);
    return size;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        NSInteger size = self->RowHeight;
    
    if (self->useCView){
        size = 220;
    }
    //NSLog(@"WeaponsTableViewController:heightForRowAtIndexPath->%ld",size);
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
        [UIView setAnimationsEnabled:NO];
        
            //NSLog(@"WeaponsTableViewController:cellForRowAtIndexPath:Section->%d,Row->%d,",indexPath.section,indexPath.row);
        
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
            
                if (! cCell.parentTableView){
                    [cCell setParentTableView:self.tableView];
                    [cCell setParentViewController:self];
                }
                
                if (! cell.parentTableView){
                    [cell setParentTableView:self.tableView];
                    [cell setParentViewController:self];
                }
        
       
                if (! self->primaryWeapons || (! self->energyWeapons) || (! self->powerWeapons) /*|| (! self->ghosts) || (! self->artifact)*/){
                    
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
                   /* case 3:
                        
                        if (self->ghosts){
                            strFullKey = [self->ghosts objectAtIndex:indexPath.row];
                        }
                        
                        break;
                    case 4:
                        
                        if (self->artifact){
                            strFullKey = [self->artifact objectAtIndex:indexPath.row];
                        }
                        
                        break;*/

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
                            [cell.imgBackground setHidden:YES];
                            
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
                            //[cell.imgItem.layer setShadowOffset: CGSizeMake(-1, 1)];
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
                                    [cell.imgMaster setHidden:NO];
                                    [cell.imgMaster setAlpha:0.3];
                                    break;
                                    
                                case 5://Masterwork + locked
                                    [cell.btnLockAction setImage:[UIImage systemImageNamed:@"lock"]
                                                            forState:UIControlStateNormal];
                                    
                                    [cell.imgItem.layer setMasksToBounds:YES];
                                    [cell.imgItem.layer setBorderWidth:2];
                                    [cell.imgItem.layer setShadowOffset: CGSizeMake(-1, 1)];
                                    [cell.imgItem.layer setBorderColor:[UIColor yellowColor].CGColor];
                                    
                                    [cell.imgMaster setHidden:NO];
                                    [cell.imgMaster setAlpha:0.3];
                                    
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
                                    
                                    [cell.imgMaster setHidden:NO];
                                    [cell.imgMaster setAlpha:0.3];
                                    
                                    break;
                                case 16://red bar
                                    
                                    [cell.imgItem.layer setMasksToBounds:YES];
                                    [cell.imgItem.layer setBorderWidth:2];
                                    [cell.imgItem.layer setShadowOffset: CGSizeMake(-1, 1)];
                                    [cell.imgItem.layer setBorderColor:[UIColor orangeColor].CGColor];
                                    
                                    break;
                            }
                            
                            if (appDelegate.destinyInventoryBucketDefinitions){
                                
                              DestinyInventoryBucketDefinition  *buckDef =  [appDelegate.destinyInventoryBucketDefinitions objectForKey:strBckKey];
                                if (buckDef){
                                    
                                    if (buckDef){
                                        
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
                                        
                                        
                                        if ([buckDef.displayProperties.name isEqualToString:@"Ghost"]){
                                            [cell.imgBackground setHidden:YES];
                                        }
                                        
                                        if ([buckDef.displayProperties.name isEqualToString:@"Seasonal Artifact"]){
                                            [cell.imgBackground setHidden:YES];
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
                                        
                                     NSLog(@"WeaponsTableViewController:cellForRowAtIndexPath:Name->%@,Section->%d,Row->%d,",
                                          itemName, indexPath.section,indexPath.row);
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
                                                                
                                                                if ([cell.lblItemType.text isEqualToString:@"Artifact"]){
                                                                    [cell.lblPowerLevel setTextColor:[UIColor systemBlueColor]];
                                                                    [cCell.lblPowerLevel setTextColor:[UIColor systemBlueColor]];
                                                                    [cell.lblPowerLevel setText:[NSString stringWithFormat:@"+%@",objValue]];
                                                                    [cCell.lblPowerLevel setText:[NSString stringWithFormat:@"+%@",objValue]];
                                                                }
                                                                else
                                                                {
                                                                  [cell.lblPowerLevel setTextColor:[UIColor whiteColor]];
                                                                  [cCell.lblPowerLevel setTextColor:[UIColor whiteColor]];
                                                                  [cell.lblPowerLevel setText:[NSString stringWithFormat:@"%@",objValue]];
                                                                  [cCell.lblPowerLevel setText:[NSString stringWithFormat:@"%@",objValue]];
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                     else
                                       {
                                            
                                            //Need to get instance data
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
        [UIView setAnimationsEnabled:YES];
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
