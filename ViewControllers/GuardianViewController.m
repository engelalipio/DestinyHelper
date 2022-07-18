//
//  GuardianViewController.m
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "GuardianViewController.h"
#import "ItemsViewController.h"
#import "NetworkAPISingleClient+LinkedProfiles.h"
#import "NetworkAPISingleClient+Clan.h"
#import "NetworkAPISingleClient+Definition.h"
#import "DataModels.h"
#import "Constants.h"
#import "GuardianCellTableView.h"
#import "Utilities.h"
#import "INVDDestinyInventoryBaseClass.h"
#import "WeaponsTableViewController.h"
#import "ArmorTableViewController.h"
#import "GroupViewController.h"
#import "INVDInventory.h"
#import "INVDDisplayProperties.h"

@interface GuardianViewController ()
{
    AppDelegate *appDelegate;
    
    NSMutableDictionary *destCharData,
                        *destPVendorData,
                        *destCharWeaponsData,
                        *destCharArmorData,
                        *destCharEquippedData,
                        *destVaultData,
                        *destClanData,
                        *destCharPostmasterData,
                        *destCharGeneralData,
                        *destCharInventoryData;
    
    NSString *currentMembership,
             *currentClanName,
             *lastAccessedCharacter,
             *selectedCharacter,
             *vaultHash;
    
    UIImageView *selectedCharEmblem;
    
    NSArray *weaponsArray,
            *armorArray,
            *equippedArray,
            *postMasterArray,
            *generalArray;
    
    
    NSInteger RowHeight,
              HeaderHeight,
              FooterHeight;
    
    NSMutableArray *vaultArray,
                   *invArray;
    
    NSDate *dteLastAccessed;
    
    BOOL hasClan;
}
@end



@implementation GuardianViewController

@synthesize lblPlayerName = _lblPlayerName;
@synthesize lblPlayerMotto = _lblPlayerMotto;
@synthesize imgPlayerLogo = _imgPlayerLogo;
@synthesize imgPlayerBG   = _imgPlayerBG;
@synthesize destChars = _destChars;
@synthesize memberships = _memberships;
@synthesize destPublicVendors = _destPublicVendors;
@synthesize clans = _clans;
@synthesize syncQueue = _syncQueue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self->RowHeight = 90;
    self->HeaderHeight = 25;
    self->FooterHeight = 10;
    
    self->hasClan = NO;
    
    self->vaultHash = kDestinyVaultHash;
    
    appDelegate = [AppDelegate currentDelegate];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    if (appDelegate.currentBungieName){
        [self.navigationItem setTitle:appDelegate.currentBungieName];
    }
    
    [self registerNotifications];
   // [self setupBackgroundImage];
    [self initTableView];
    [self loadGroupInfo];
    [self loadCharacters];

    [self loadPublicVendors];
  //  [self loadCharacterWeaponsStats];

    [self loadCharacterInventories];
    //[self loadVaultItems];
    [self startTimer];
}
 

-(void)setupBackgroundImage{
    
    UIImage *oImage = [UIImage imageNamed:@"background_Warlock.png"] ;
    
    CGSize newSize = CGSizeMake(self.tblChars.frame.size.width, self.tblChars.frame.size.height);
    
    oImage = [Utilities imageResize:oImage andResizeTo:newSize];
    
    self.tblChars.backgroundColor = [UIColor colorWithPatternImage:oImage];
 
   
   
}


-(void) refreshCharacterEquipment{
    
    
    NSLog(@"🤺:1:GuardianViewController:refreshCharacterEquipment Called...");
   /* if (appDelegate)
    {
        NSLog(@"2:GuardianViewController:clearing AppDelegate Destiny Characters...");
        [appDelegate setDestinyCharacters:nil];
        
    }*/
    
    NSLog(@"🤺:2:GuardianViewController:resetting local Dictionaries/Arrays...");
    self->destCharData = nil;
    self.destChars = nil;
    
    self->destCharWeaponsData = [[NSMutableDictionary alloc] init];
    self->destCharArmorData   = [[NSMutableDictionary alloc] init];
    self->destCharEquippedData   = [[NSMutableDictionary alloc] init];
    self->destVaultData   = [[NSMutableDictionary alloc] init];
    
 
    NSLog(@"🤺:3:GuardianViewController:calling loadCharacters from refreshCharacterEquipment...");
    [self loadCharacters];
    NSLog(@"🤺:4:GuardianViewController:calling loadCharacterInventories from refreshCharacterEquipment...");
    [self loadCharacterInventories];
    
    NSLog(@"🤺:5:GuardianViewController:refreshCharacterEquipment Completed...");
    
    //[self.tblChars reloadData];
}

-(void) loadGroupInfo{
    
    BOOL hasClanData = NO;
    
    CLNDetail *groupDetails = nil;
    
    @try {
        
        hasClanData = [appDelegate isClanLoaded];
        
        if (hasClanData){
            
            groupDetails  = [appDelegate.currentClan copy];
            
            if (groupDetails){
              
                self->currentClanName =  [NSString stringWithFormat:@"Clan: %@", groupDetails.name]; ;
                
                if (! self.clans){
                    self.clans = [[NSMutableArray alloc] init];
                }
                
                if (![self.clans containsObject:groupDetails.groupId]){
                    [self.clans addObject:groupDetails.groupId];
                }
                
                if (! self->destClanData){
                    self->destClanData = [[NSMutableDictionary alloc] init];
                }
                
                if (! [self->destClanData.allKeys containsObject:groupDetails.groupId]){
                    [self->destClanData setValue:groupDetails forKey:groupDetails.groupId];
                }
               
            }
            
        }
        
         
    } @catch (NSException *exception) {
        NSLog(@"🤺:GuardianVC:loadGroupInfo:Exception->%@",exception.description);
    } @finally {
        
        hasClanData = NO;
       
       groupDetails = nil;
    }

    
}

-(void) registerNotifications{
    
    [self initArrayData];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedCharacterEquipmentNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        
        NSMutableDictionary *cEquip  = (NSMutableDictionary*) [note object];
        
        NSDictionary *userInfo = [note userInfo];
        
        NSString *currentCharacter    = nil,
                 *currentstrCharIndex = nil;
        
        [self initArrays];
        
        if (userInfo){
            
            currentCharacter = [userInfo objectForKey:@"CurrentCharacter"];
            currentstrCharIndex =  [userInfo objectForKey:@"CurrentCharacterIndex"];
            
                
               if (cEquip){
                   
                   INVCData *data = [[INVCData alloc] initWithDictionary: [cEquip objectForKey:@"data"]];
                   
                   if (data){
                       
                       NSArray *items = (NSArray*)[data items];
                       
                       if (items){
                           for (INVCItems *item in items) {
                               [self associateInvDataByBucket:item withCurrentChar:(NSString *) currentCharacter];
                           }
                        }
                   }
                   
               }
                
        }
        
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedCharacterInventoryNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        
        NSMutableDictionary *cData = (NSMutableDictionary*) [note object];
        
        NSDictionary *userInfo = [note userInfo];
        
        NSString *currentCharacter    = nil,
                 *currentstrCharIndex = nil;
        
        [self initArrays];
        
        if (userInfo){
            
            currentCharacter = [userInfo objectForKey:@"CurrentCharacter"];
            currentstrCharIndex =  [userInfo objectForKey:@"CurrentCharacterIndex"];
            
            if (cData){
                INVCInventory *inventory = [[INVCInventory alloc] initWithDictionary:[cData objectForKey:@"inventory"]];
              
                
               if (inventory){
                   
                   INVCData *data = [inventory data];
                   
                   if (data){
                       NSArray *items = (NSArray*)[data items];
                       
                       if (items){
                           
                           for (INVCItems *item in items) {
                               [self associateInvDataByBucket:item withCurrentChar:(NSString *) currentCharacter];
                            }
                        }
                   }
                   
               }
                
            }
           
                
        }
        
    }];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedCharacterNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        
        NSMutableDictionary *cData = (NSMutableDictionary*) [note object];
        
        NSDictionary *userInfo = [note userInfo];
        
        NSString *currentCharacter    = nil,
                 *currentstrCharIndex = nil;
 
        if (userInfo){
            
            currentCharacter = [userInfo objectForKey:@"CurrentCharacter"];
            
            currentstrCharIndex =  [userInfo objectForKey:@"CurrentCharacterIndex"];
            
            //Determine last played character
            if (cData){
                
                NSDictionary *dBase = (NSDictionary *) cData;
                
                if (dBase){
                    
                    NSDictionary *cBase = [(NSDictionary*) dBase objectForKey:@"character"];
                    
                    if (cBase){
                    
                        NSDictionary *iBase = [(NSDictionary*) cBase objectForKey:@"data"];
                        
                        NSDate *dteCurrentCharLastAccessed = nil;
                        
                        NSString *strDataLastPlayed = [iBase objectForKey:@"dateLastPlayed"];
                        
                        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
                        
                        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
                   
                        dteCurrentCharLastAccessed = [[NSDate alloc] init];
                        
                        dteCurrentCharLastAccessed  = [dateFormatter dateFromString:strDataLastPlayed];
                    
                     if (! self->dteLastAccessed){
                         self->dteLastAccessed = [[NSDate alloc] init];
                         
                        self->dteLastAccessed = (NSDate*) [dteCurrentCharLastAccessed copy];
                        self->lastAccessedCharacter = currentCharacter;
                     }
                     else{
                         
                         NSLog(@"🤺:kDestinyLoadedCharacterNotification:Last Accessed Details:[%@ on %@]",currentCharacter, dteCurrentCharLastAccessed);
                         
                         NSDate *comparedDate = [self->dteLastAccessed laterDate:dteCurrentCharLastAccessed];
                         
                         if ([comparedDate isEqualToDate:self->dteLastAccessed]){
                             
                             NSLog(@"🤺:kDestinyLoadedCharacterNotification:Last Accessed Character Still %@ on %@",
                                   currentCharacter, self->dteLastAccessed);
                             
                         }else{
                             
                             self->dteLastAccessed = dteCurrentCharLastAccessed;
                             self->lastAccessedCharacter = currentCharacter;
                             
                             NSLog(@"🤺:kDestinyLoadedCharacterNotification:Last Accessed Guardian...",currentCharacter);
                             
                         }
                         
                        //Compare
                        /*if (self->dteLastAccessed > dteCurrentCharLastAccessed ){
                            self->dteLastAccessed = dteCurrentCharLastAccessed;
                            self->lastAccessedCharacter = currentCharacter;
                            NSLog(@"🤺:kDestinyLoadedCharacterNotification:Last Accessed Guardian...",currentCharacter);
                        }else{
                            NSLog(@"🤺:kDestinyLoadedCharacterNotification:Last Accessed Character Still %@ on %@",currentCharacter, self->dteLastAccessed);
                        }*/
                     }
                    }
                    
                }
                
            }
            
            if (![self->destCharData.allKeys containsObject:currentCharacter]){
                
                [self->destCharData setValue:cData forKey:currentCharacter];
                NSLog(@"🤺:GuardianViewController:kDestinyLoadedCharacterNotification:%@ Processing...",currentCharacter);
                
            }
            else{
                NSLog(@"🤺:GuardianViewController:kDestinyLoadedCharacterNotification:%@ Character already loaded...",currentCharacter);
            }
 
           
            [self.tblChars performBatchUpdates:^(void){
                
                NSArray<NSIndexPath*> *iPaths =  [self.tblChars indexPathsForVisibleRows];
                
                if (! iPaths){
                    NSLog(@"🤺:GuardianViewController:kDestinyLoadedCharacterNotification:No Visible Rows:exiting...");
                    return;
                }
                else{
                    
                    if (iPaths.count == 0){
                        NSLog(@"🤺:GuardianViewController:kDestinyLoadedCharacterNotification:No Visible Rows:exiting...");
                        return;
                    }
                }
                
                NSIndexPath *currentIPath = nil;
                
                GuardianCellTableView *cell = nil;
                
                NSInteger iCharIDX  = [currentstrCharIndex integerValue],
                          iSections = [self.tblChars numberOfSections];
                
                   // currentIPath  =   [NSIndexPath indexPathForRow:iCharIDX inSection:0];
            
                    currentIPath =  [iPaths objectAtIndex:iCharIDX];
                   
                    
                    if (currentIPath){
                        
                 
                        NSString *message    = currentCharacter,
                                 *imageName  = nil,
                                 *baseURL    = nil,
                                 *classHash  = nil,
                                 *classDesc  = nil,
                                 *genderHash = nil,
                                 *genderDesc = nil,
                                    *raceHash   = nil,
                                    *raceDesc   = nil,
                                    *lightLevel = nil,
                                    *seal       = nil,
                                    *progHash   = nil,
                                    *emblem     = nil,
                                    *strLight   = nil;
                        
                        
                        NSURL *imageURL = nil,
                              *emblemURL = nil;
                        
                        UIImage *imgEmblem = nil;
                        
                        BOOL needsUpdate = YES;
                        
                        @try {
                            
                            cell = [self.tblChars cellForRowAtIndexPath:currentIPath];
                            
                            if ([cell.lblGuardianClass.text isEqualToString:@"Loading Character..."]){
                                needsUpdate = YES;
                            }
                            
                            if (! cell.tag){
                                needsUpdate = YES;
                            }
                            
                            if (needsUpdate){
                            
                               // [self.tblChars beginUpdates];
                                
                                
                                [cell setTag:iCharIDX];
                                
                                NSDictionary *grd = [cData objectForKey:@"character"],
                                             *equip = [cData objectForKey:@"equipment"],
                                             *grdData  = nil;
                                
                                
                                grdData = [grd objectForKey:@"data"];
                                    
                                
                                if (grdData){
                                
                                    classHash  = [grdData objectForKey:@"classHash"];
                                    genderHash = [grdData objectForKey:@"genderHash"];
                                    raceHash   = [grdData objectForKey:@"raceType"];
                                        
                                    lightLevel = [grdData objectForKey:@"light"];
                                    progHash   = [grdData objectForKey:@"progressionHash"];
                                    seal       = [grdData objectForKey:@"titleRecordHash"];
                                    
                                    imageName  = [grdData objectForKey:@"emblemPath"];
                                    
                                    if (imageName){
                                        baseURL = [NSString stringWithFormat:@"%@%@",kBungieBaseURL,imageName];
                                        
                                        if (baseURL){
                                            emblemURL = [[NSURL alloc] initWithString:baseURL];
                                        }
                                    }
                                    
                                    emblem = [grdData objectForKey:@"emblemBackgroundPath"];
                                    
                                    if (emblem){
                                        emblem = [NSString stringWithFormat:@"%@%@",kBungieBaseURL,emblem];
                                        
                                        if(emblem){
                                            [cell.imgEmblem setImageWithURL:emblemURL];
                                            [cell.imgEmblem setHidden:YES];
                                            
                                            imageURL = [[NSURL alloc] initWithString:emblem];
                                            
                                            if (imageURL){
                                                [cell.imgBackground setImageWithURL:imageURL];
                                                
                                            }
                                        }
                                    }
                                    
                                    strLight = [NSString stringWithFormat:@"%@",lightLevel];
                                    
                                    if (strLight){
                                        [cell.lblLightLevel setText:strLight];
                                    }
                                    classDesc = [Utilities decodeClassHash:classHash];
                                    
                                    if (classDesc){
                                        [cell.lblGuardianClass setText:classDesc];
                                    }
                                    
                                
                                    raceDesc = [Utilities decodeRaceHash:raceHash];
                                    
                                    if (raceDesc){
                                        [cell.lblGuardianRace setText:raceDesc];
                                    }
                                    
                                    genderDesc = [Utilities decodeGenderHash:genderHash];
                                    
                                    if (genderDesc){
                                        [cell.lblGuardianGender setText:genderDesc];
                                    }
                                }
                                
                                if (equip){
                                  
                                    NSDictionary *data = [equip objectForKey:@"data"];
                                    
                                    if (data){
                                        NSArray *items = (NSArray *) [data objectForKey:@"items"];
                                        
                                        if (items){
                                          
                                            
                                            for(int idx = 0; idx < items.count; idx++ ){
                                                
                                                INVCItems * iItem = [[INVCItems alloc] initWithDictionary:[items objectAtIndex:idx]];
                                                
                                                if (iItem.bucketHash == 3284755031){
                                                   //Subclass
                                                    
                                                    
                                                    if (appDelegate.destinyInventoryItemDefinitions){
                                                     
                                                        NSNumber *objHash = [NSNumber numberWithDouble:iItem.itemHash];
                                                        
                                                        NSString *strItemHash = [NSString stringWithFormat:@"%@",objHash];
                                                        
                                                        INVDResponse *iItemDef = (INVDResponse *)
                                                        
                                                        [appDelegate.destinyInventoryItemDefinitions
                                                                                                  objectForKey:strItemHash];
                                                        
                                                        if (!iItemDef){
                                                            
                                                            [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinyInventoryItemDefinition" staticHashId:strItemHash completionBlock:^(NSArray *values) {
                                                                
                                                                if (values){
                                                                    
                                                                NSLog(@"🤺:GuardianViewController:subClassLookup:static:Received->%@",strItemHash);
                                                                        
                                                                INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                                                                
                                                                    [self->appDelegate.destinyInventoryItemDefinitions setObject:invItem forKey:strItemHash];
                                                                    
                                                                    
                                                                    if (invItem){
                                                                        INVDResponse *resp = [[INVDResponse alloc] initWithDictionary:[invItem response]];
                                                                        
                                                                        if (resp){
                                                                            
                                                                            INVDDisplayProperties *dispP = resp.displayProperties;
                                                                            
                                                                            if (dispP){
                                                                                NSString *subImageName  = [dispP icon],
                                                                                        *subBaseURL    = @"";
                                                                                
                                                                                if (subImageName){
                                                                                    subBaseURL  = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,subImageName];
                                                                                    NSURL* subImageURL = [[NSURL alloc] initWithString:subBaseURL];
                                                                                    
                                                                                    if (subImageURL){
                                                                                        [cell.imgCareer setImageWithURL:subImageURL];
                                                                                        [cell.imgCareer setHidden:NO];
                                                                                        
                                                                                        [cell.lblGuardianCareer setText:dispP.name];
                                                                                    }
                                                                                }
                                                                                
                                                                            }
                                                                        }
                                                                    }
                                                                    
                                                                }
                                                                
                                                            } andErrorBlock:^(NSError *exception) {
                                                                NSLog(@"🤺:GuardianViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Exception->%@",exception.description);
                                                                
                                                                
                                                                if ([exception.localizedDescription isEqualToString:kBungieNeedsAuthenticateMessage]){
                                                                    
                                                                    [self dismissViewControllerAnimated:NO completion:^(void){
                                                                        
                                                                        [[NSNotificationCenter defaultCenter]
                                                                           postNotificationName:kBungieNeedsAuthenticateMessage
                                                                         object:exception];
                                                                        
                                                                    }];
                                                                    
                                                                }
                                                            }];
                                                            
                                                        }
                                                        else
                                                        {
                                                        
                                                            INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [iItemDef copy];
                                                            
                                                            INVDResponse *resp = [[INVDResponse alloc] initWithDictionary:[invItem response]];
                                                            
                                                            INVDDisplayProperties *dispP = resp.displayProperties;
                                                            
                                                            if (dispP){
                                                                NSString *subImageName  = [dispP icon],
                                                                         *subBaseURL    = @"";
                                                                
                                                                if (subImageName){
                                                                    subBaseURL  = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,subImageName];
                                                                    NSURL* subImageURL = [[NSURL alloc] initWithString:subBaseURL];
                                                                    
                                                                    if (subImageURL){
                                                                        [cell.imgCareer setImageWithURL:subImageURL];
                                                                        [cell.imgCareer setHidden:NO];
                                                                        
                                                                        [cell.lblGuardianCareer setText:dispP.name];
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
                                
                           // [self.tblChars endUpdates];
                            }
                            
                        }
                        @catch (NSException *exception) {
                            NSLog(@"🤺:GuardianViewController:kDestinyLoadedCharacterNotification:Loading Char Exception->%@",exception.description);
                        }
                    }
                
                
                
            }
                completion:^(BOOL finished) {
                
               /* NSArray<NSIndexPath *> *visibleIndexPaths = [self.tblChars indexPathsForVisibleRows];
                                
                                [self.tblChars reloadRowsAtIndexPaths:visibleIndexPaths
                                                      withRowAnimation:UITableViewRowAnimationNone];*/
                   NSLog( @"🤺:GuardianViewController:kDestinyLoadedCharacterNotification:LoadingChar[%@]Completed!",currentCharacter);
                }];
            }
        
    }];
    
 
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedPublicVendorsDetailsNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        NSLog(@"🤺:GuardianViewController:kDestinyLoadedPublicVendorsDetailsNotification:Invoked...");
        
        NSDictionary *userInfo = [note userInfo];
        
        NSMutableDictionary *publicVendorData = (NSMutableDictionary*) [note object];
        
        NSString *publicVendorHash = [userInfo objectForKey:@"CurrentPublicVendorHash"];
        
        if (![self->destPVendorData.allKeys containsObject:publicVendorHash]){
            
            [self->destPVendorData setValue:publicVendorData forKey:publicVendorHash];
            NSLog(@"🤺:GuardianViewController:kDestinyLoadedPublicVendorsDetailsNotification:%@ Processing...",publicVendorHash);
        }
        else{
            NSLog(@"🤺:GuardianViewController:kDestinyLoadedPublicVendorsDetailsNotification:%@ already loaded...",publicVendorHash);
        }
            
            
            [self.tblChars performBatchUpdates:^(void) {
                
                VNDDetails *vendorDetails =  (VNDDetails*)[self->destPVendorData objectForKey:publicVendorHash];
                
                VNDDetailsDisplayProperties *vDisplayProps = nil;
                
                VNDDetailsGroups *vendorGroups = nil;
                
                if (vendorDetails){
                    
                    NSString *vendorName = nil,
                             *vendorDesc = nil,
                             *vendorTitle = nil,
                             *imageName   = nil,
                             *emblem      = nil,
                             *baseURL     = nil,
                             *vendorGroup = nil;
                    
                    NSURL   *emblemURL     = nil,
                             *imageURL     = nil;
                    
                    GuardianCellTableView *cell = nil;
                    
                    NSIndexPath *indexPath = nil;
                    
                    int iVendorRow  = -1;
                    
                    for (int iVDX = 0; iVDX < self->destPVendorData.allKeys.count; iVDX++) {
                        
                        NSString *vendorKey = [self->destPVendorData.allKeys objectAtIndex:iVDX];
                        
                        if ([vendorKey isEqualToString:publicVendorHash]){
                            iVendorRow = iVDX;
                            break;
                        }
                        
                    }
                    
                    indexPath = [NSIndexPath indexPathForRow:iVendorRow inSection:3];
                    
                    cell = [self.tblChars cellForRowAtIndexPath:indexPath];
                    
                    
                    if (!cell.tag){
                        [cell setTag:[publicVendorHash integerValue]];
                    }
                    
                    
                    vDisplayProps = (VNDDetailsDisplayProperties*) [vendorDetails displayProperties] ;
                    
                    NSArray *groups = (NSArray*) [vendorDetails groups];
                    
                    if (groups){
                        
                        vendorGroups = (VNDDetailsGroups*) [groups firstObject];
                        
                        NSNumber *objGroupHash = [[NSNumber alloc] initWithDouble:[vendorGroups vendorGroupHash]];
                        
                        if (objGroupHash){
                         
                            if (self->appDelegate.destinyVendorGroupDefinitions){
                                NSString *strGroupHash = [NSString stringWithFormat:@"%@",[objGroupHash stringValue]];
                                
                                if (strGroupHash){
                                    VendorGroupDefinition *vendorGroupDef = [appDelegate.destinyVendorGroupDefinitions
                                                                             objectForKey:strGroupHash];
                                    
                                    if (vendorGroupDef){
                                        vendorGroup = [vendorGroupDef categoryName];
                                        if (vendorGroup){
                                            
                                            [cell.lblGuardianRace setText:vendorGroup];
                                      
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                     
                    if (vDisplayProps){
                        
                        vendorName = [vDisplayProps name];
                        vendorDesc = [vDisplayProps description];
                        vendorTitle = [vDisplayProps subtitle];
                        
                        
                        if (vDisplayProps.hasIcon){
                            imageName  = [vDisplayProps icon];
                            emblem = [vDisplayProps largeIcon];
                        }
                        
                        if (imageName){
                            baseURL  = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
                            imageURL = [[NSURL alloc] initWithString:baseURL];
                        }
                        
                        if (emblem){
                            emblem = [NSString stringWithFormat:@"%@%@",kBungieBaseURL,emblem];
                            emblemURL = [[NSURL alloc] initWithString:emblem];
                        }
                        
                        [cell.imgBackground setImageWithURL:emblemURL];
                        
                        [cell.imgEmblem setImageWithURL:imageURL];
                        
                        [cell.lblGuardianClass setText:vendorName];
                        
                        [cell.lblGuardianCareer setHidden:NO];
                        [cell.lblGuardianCareer setText:vendorTitle];
                        
                        [cell.lblGuardianGender setText:@""];
                        [cell.lblLightLevel setText:@""];
                    }
                    
                 }
                
            }completion:^(BOOL finished) {
                if (finished){
                 NSLog(@"🤺:GuardianViewController:kDestinyLoadedPublicVendorsDetailsNotification:Completed for->%@",publicVendorHash);
                }
            }];
       
    }];
    
  
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedPublicVendorsNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        NSLog(@"🤺:GuardianViewController:kDestinyLoadedPublicVendorsNotification:Invoked...");
        
        NSDictionary  *userInfo = (NSDictionary*) [note userInfo],
                      *vendorResponse = nil,
                      *vendorGroups = nil,
                      *vendorsData = nil,
                      *vendorData = nil;
        
        
        NSArray *vGroups = nil,
                *vHashs = nil;
            
        
        VNDBaseClass *publicVendors = (VNDBaseClass*) [note object];
        
        NSString *className =  [userInfo objectForKey:@"ClassName"],
                 *methodName =  [userInfo objectForKey:@"MethodName"];
        
            if (publicVendors){
                
                if (! self->destPVendorData){
                     
                    if(! self.destPublicVendors){
                    
                      vendorResponse = (NSDictionary*) [publicVendors response];
                           
                       if (vendorResponse){
                            
                            vendorGroups = (NSDictionary *) [vendorResponse objectForKey:@"vendorGroups"];
                            
                            if (vendorGroups){
                                vendorsData = (NSDictionary *) [vendorGroups objectForKey:@"data"];
                                
                                vGroups = (NSArray*) [ vendorsData objectForKey:@"groups"];
                                
                                if (vGroups){
                                    
                                    vendorData = (NSDictionary*) [vGroups objectAtIndex:0];

                                    if (vendorData ) {
                                        
                                        vHashs = (NSArray*) [vendorData objectForKey:@"vendorHashes"];
                                        
                                        if (vHashs){
                                            
                                            NSMutableArray *vendorArray = [[NSMutableArray alloc] init];
                                            
                                            if (! self->destPVendorData){
                                                self->destPVendorData = [[NSMutableDictionary alloc] init];
                                            }
                                            
                                            for(int ivendor = 0; ivendor < vHashs.count; ivendor++){
                                                
                                                NSNumber *objVendorKey = [[NSNumber alloc] initWithLong:[vHashs objectAtIndex:ivendor]];
                                                
                                                if (objVendorKey){
                                                    NSString *strVendorKey = [NSString stringWithFormat:@"%@",[objVendorKey integerValue]];
                                                    
                                                    if (![vendorArray containsObject:strVendorKey]){
                                                        [vendorArray addObject:strVendorKey];
                                                        
                                                        if (appDelegate.destinyItemVendorsDetailDefinitions){
                                                            
                                                            VNDDetails * vendorDetail = [appDelegate.destinyItemVendorsDetailDefinitions objectForKey:strVendorKey];
                                                            
                                                            if (vendorDetail){
                                                                [self->destPVendorData setValue:vendorDetail forKey:strVendorKey];
                                                            }
                                                            
                                                        }
                                                     }
                                                    
                                                }
                                                
                                            }
                    
                                            
                                            self.destPublicVendors = [[NSArray alloc] initWithArray:vendorArray];
                                            
                                        }
                                     }
                                 }
                            }
                         }
                       
                      }
                    
                    //Start to load Public Vendor Details
                    [self loadPublicVendorsDetails];
                 }
                
            }
            
    }];
 
    
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedProfileVaultNotification
            object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
            
            NSLog(@"🤺:GuardianViewController:kDestinyLoadedProfileVaultNotification:Invoked...");
            
        NSDictionary  *userInfo = (NSDictionary*) [note userInfo];
              
        VAULTBaseClass *vaultBase = (VAULTBaseClass *) [note object];
        
        VAULTResponse *vResponse = nil;
        ProfileInventory *profInv = nil;
        VAULTData *vData = nil;
        
        NSArray *vItems;
        
        [self initArrays];
            
            NSString *className =  [userInfo objectForKey:@"ClassName"],
                     *methodName =  [userInfo objectForKey:@"MethodName"],
                     *currentCharacter = [userInfo objectForKey:@"SelectedCharacter"];
    if (vaultBase){
         
        vResponse = (VAULTResponse*) [VAULTResponse modelObjectWithDictionary:vaultBase.response];
        
        if (vResponse){
        
            profInv = (NSDictionary *) [vResponse profileInventory];
            
            if (profInv){
                vData = (VAULTData *) [profInv data];
                
                if (vData){
                    vItems = (NSArray*) [vData items] ;
                    if (vItems){
                    NSLog(@"🤺:GuardianViewController:kDestinyLoadedProfileVaultNotification:Vault Items Count = %d",vItems.count);
                        
                      
                        for(int vIDX = 0; vIDX < vItems.count; vIDX++){
                            
                            VAULTItems *vaultItem = (VAULTItems*) [vItems objectAtIndex:vIDX];
                            
                            if (vaultItem){
                                
                                
                                NSNumber *objItemBucket     = [NSNumber numberWithDouble:vaultItem.bucketHash],
                                         *objItemLocation   = [NSNumber numberWithDouble:vaultItem.location],
                                         *objItemHash       = [NSNumber numberWithDouble:vaultItem.itemHash];
                                
                                NSInteger iItemBucket   = [objItemBucket integerValue],
                                          iItemLocation = [objItemLocation integerValue];
                                
                                
                                NSString *strItemHash = [NSString stringWithFormat:@"%@",objItemHash],
                                         *strItemLocation = [NSString stringWithFormat:@"%@",objItemLocation],
                                         *strBucketHash = [NSString stringWithFormat:@"%@",objItemBucket],
                                         *strInstanceId = vaultItem.itemInstanceId,
                                         *strFullKey = [NSString stringWithFormat:@"%@_%@",strBucketHash,strItemHash];
                                
                                
                                if (strItemHash){
                               
                                    if (strItemLocation){
                                 
                                        switch(iItemLocation){
                                            case 1://Equipped
                                                if (![self->destCharEquippedData.allKeys containsObject:strItemHash]){
                                                    [self->destCharEquippedData setValue:vaultItem forKey:strItemHash];
                                                    //NSLog(@"GuardianViewController:VaultNotification:%@Equipped Item ",strItemHash);
                                                }
                                                break;
                                            case 2://Vault
                                               
                                                if ([strBucketHash isEqualToString:kDestinyVaultHash]){
                                                    //General
                                                    
                                                    
                                    if ( appDelegate.destinyInventoryItemDefinitions){
                                    
                                        INVDResponse *iItemDef = (INVDResponse *)[appDelegate.destinyInventoryItemDefinitions objectForKey:strItemHash];
                                        
                                        if (iItemDef){
                                            
                                            [self processVaultItem:iItemDef
                                                     withVaultItem:vaultItem];
                                            
                                        }
                                        else
                                        {
                                         NSLog(@"🤺:GuardianViewController:VaultNotification:%@Vault Item Def Not Found",strItemHash);
                                                                                        
                                       
                                    
                                        if (! self.syncQueue){
                                            self.syncQueue = dispatch_queue_create("DestinyHelper.VaultActionQueue", NULL);
                                            NSLog(@"[Custom Queue Async ->com.ams.DestinyHelper.VaultActionQueue Started...]");
                                        }
                                       
                                        dispatch_async(self.syncQueue, ^{
                                        
                                        [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinyInventoryItemDefinition"
                                                                                                staticHashId:strItemHash
                                                                                             completionBlock:^(NSArray *values) {
                                            if (values){
                                             NSLog(@"🤺:GuardianViewController:subClassLookup:static:Received->%@",strItemHash);
                                                INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                                                                                                                 
                                                    if (invItem){
                                                                                            
                                                        INVDResponse *iItemDef = [[INVDResponse alloc]
                                                                            initWithDictionary:[invItem response]];
                                                                                                
                                                        if ( iItemDef){
                                                            [self->appDelegate.destinyInventoryItemDefinitions
                                                                        setObject:iItemDef
                                                                        forKey:strItemHash];
                                                                                                    
                                                            [self processVaultItem:iItemDef
                                                            withVaultItem:vaultItem];
                                                        }
                                                                                                
                                                   }
                                                                                                                                                        
                                             }
                                                                                                                                                    
                                            } andErrorBlock:^(NSError *exception) {
                                            NSLog(@"🤺:GuardianViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Exception->%@",exception.description);
                                                
                                                
                                                if ([exception.localizedDescription isEqualToString:kBungieNeedsAuthenticateMessage]){
                                                    
                                                    [self dismissViewControllerAnimated:NO completion:^(void){
                                                        
                                                        [[NSNotificationCenter defaultCenter]
                                                           postNotificationName:kBungieNeedsAuthenticateMessage
                                                         object:exception];
                                                        
                                                    }];
                                                }
                                        }];
       
                                            NSLog(@"[Custom Queue Async ->com.ams.DestinyHelper.VaultActionQueue Done!]");
                                                            
                                        });
                                                               
                                        }
                                       }
                                                
                                        }
                                        else{
                                            
                                            if (![self->destVaultData.allKeys containsObject:strFullKey]){
                                                [self->destVaultData setValue:vaultItem forKey:strFullKey];
                                                NSLog(@"🤺:GuardianViewController:VaultNotification:%@Vault Item ",strFullKey);
                                            }
                                            
                                            if (![self->destCharInventoryData.allKeys containsObject:strFullKey]){
                                                [self->destCharInventoryData setValue:vaultItem forKey:strFullKey];
                                                NSLog(@"🤺:GuardianViewController:VaultNotification:%@Vault Item ",strFullKey);
                                            }
                                        }
                                        
                                        
                                                break;
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
                
        }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedUniqueWeaponsStatsNotification
            object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
            
            NSLog(@"🤺:GuardianViewController:kDestinyLoadedUniqueWeaponsStatsNotification:Invoked...");
            
            NSDictionary  *userInfo = (NSDictionary*) [note userInfo],
                          *wResponse = nil,
                          *wData = nil,
                          *weapons = nil;
            
            
            NSArray *vGroups = nil,
                    *vHashs = nil;
                
            
          UWHBaseClass *uniqueWeapons = (UWHBaseClass *) [note object];
   
            
            NSString *className =  [userInfo objectForKey:@"ClassName"],
                     *methodName =  [userInfo objectForKey:@"MethodName"];
            
                if (uniqueWeapons){
                    
                     
                    wResponse = (NSDictionary*) [uniqueWeapons response];
                    
                
                    if (wResponse){
                        
                        NSArray *weapons =  (NSArray*)[wResponse objectForKey:@"weapons"];
                        
                        for(int iW = 0; iW < weapons.count; iW++){
                            
                            NSDictionary *weaponData = (NSDictionary *)[weapons objectAtIndex:iW];
                            
                            if (weaponData){
                                
                                UWHValues *wValues = (UWHValues*) [weaponData objectForKey:@"values"];
                                
                                if (wValues){
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                }
                
        }];
    
    
    
}

-(void) processVaultItem:(INVDResponse *) iItemDef withVaultItem:(VAULTItems *) vaultItem{
    

    INVDInventory *iInv = nil;
    
    NSNumber *objItemBucket = nil,
             *objItemHash = nil;
    
    NSString *strBucketHash = nil,
             *strFullKey = nil,
             *strItemHash = nil;
    
    NSInteger iItemBucket   = 0;
    
    @try {
        
        
        objItemBucket     = [NSNumber numberWithDouble:vaultItem.bucketHash];
                 
        objItemHash       = [NSNumber numberWithDouble:vaultItem.itemHash];
        
        iItemBucket       = [objItemBucket integerValue];
        
        strItemHash = [NSString stringWithFormat:@"%@",objItemHash];
        
        if (iItemDef){
            
           iInv = (INVDInventory*)  [iItemDef inventory];
           
            if (iInv){
                
                objItemBucket     = [NSNumber numberWithDouble:iInv.bucketTypeHash];
                
                strBucketHash = [NSString stringWithFormat:@"%@",objItemBucket];
                
                if (![self->vaultArray containsObject:strBucketHash]){
                    [self->vaultArray addObject:strBucketHash];
                }
                
                if (![self->invArray containsObject:strBucketHash]){
                    [self->invArray addObject:strBucketHash];
                }
                
                strFullKey = [NSString stringWithFormat:@"%@_%@",strBucketHash,strItemHash];
                
                if (![self->destVaultData.allKeys containsObject:strFullKey]){
                    [self->destVaultData setValue:vaultItem forKey:strFullKey];
                    NSLog(@"🤺:GuardianViewController:VaultNotification:processVaultItem:%@Vault Item ",strFullKey);
                }
              
                if (![self->destCharInventoryData.allKeys containsObject:strFullKey]){
                    [self->destCharInventoryData setValue:vaultItem forKey:strFullKey];
                    NSLog(@"🤺:GuardianViewController:VaultNotification:processVaultItem:%@Vault Item ",strFullKey);
                }
                
            }
            
            
        }
        
    } @catch (NSException *exception) {
        NSLog(@"🤺:GuardianViewController:VaultNotification:processVaultItem:Exception->%@",exception.description);
    } @finally {
        
        
        iInv = nil;
        
        objItemBucket = nil;
        objItemHash = nil;
        
        strBucketHash = nil;
        strFullKey = nil;
        strItemHash = nil;
        
       iItemBucket   = 0;
        
    }
    
    
    
}

-(void) loadPublicVendorsDetails{
    
   
    MBRDestinyMemberships *membership = nil;
    
    VNDBaseClass* vendorBase = nil;
    
    NSDictionary *vendorResponse = nil,
                 *vendors        = nil,
                 *vendorsData    = nil,
                 *vendorData     = nil;
    
    
    NSArray *vendorKeys = nil;
    
    
    NSString *message    = @"🤺:1:GuardianViewController:loadPublicVendorsDetails called...",
             *vendorKey  = nil,
             *vendorHash = nil;
    
    @try {
        
        
        NSLog(@"%@",message);
        if (! self.memberships){
            message   = @"🤺:2:GuardianViewController:loadPublicVendorsDetails:Getting Membership Detail from Delegate...";
            NSLog(@"%@",message);
            self.memberships = (NSArray *) [appDelegate destinyMemberships];
        }
        
        membership = (MBRDestinyMemberships *) [self.memberships objectAtIndex:0];
       
        
        for (int iVendors = 0; iVendors < self.destPublicVendors.count; iVendors++) {
            
            vendorHash =  [self.destPublicVendors objectAtIndex:iVendors];
            
            
            enum Destiny2MembershipType mType = [appDelegate currentMembershipType];
             
            NSString *strURL = @"%d/Profile/%@/Character/%@/Vendors/%@/",
                    *strMID = membership.membershipId,
                    *strCharID = [self.destChars objectAtIndex:0];
                
            message = [NSString stringWithFormat:strURL, mType, strMID, strCharID,vendorHash];
                
            NSLog(@"🤺:GuardianViewController:loadPublicVendorsDetails:%d[%@]",iVendors,message);
                
            //Path: MembershipType/Profile/{destinyMembershipId}/Character/{characterId}/Vendors/{vendorId}/
                
            [NetworkAPISingleClient getVendor:message completionBlock:^(NSArray *values){
                
                if (values){
                    //Extract Vendor Display Properties
                    
                    NSDictionary * vndDetailsRoot = (NSDictionary*) [values firstObject];
                    
                    if (vndDetailsRoot){
                        
                            
                                NSDictionary *callerInfo = [[NSDictionary alloc]
                                                        initWithObjectsAndKeys:@"GuardianViewController",@"ClassName",
                                                                               @"loadPublicVendorsDetails",@"MethodName",
                                                                               vendorHash,@"CurrentPublicVendorHash",nil];
                            
                                [[NSNotificationCenter defaultCenter]
                                    postNotificationName:kDestinyLoadedPublicVendorsDetailsNotification
                                    object:vndDetailsRoot
                                  userInfo:callerInfo];
                        
                        
                    }
                    
                }
            }
                andErrorBlock:^(NSError *exception){
                    NSLog(@"🤺:loadCharacters:loadPublicVendorsDetails:getVendor:Exception->%@",exception.description);
                
                if ([exception.localizedDescription isEqualToString:kBungieNeedsAuthenticateMessage]){
                    [self dismissViewControllerAnimated:NO completion:^(void){
                        
                        [[NSNotificationCenter defaultCenter]
                           postNotificationName:kBungieNeedsAuthenticateMessage
                         object:exception];
                        
                    }];
                }
                }];
                   
            
         }
      
        
    } @catch (NSException *exception) {
        NSLog(@"🤺:loadCharacters:loadPublicVendorsDetails:getVendor:Exception->%@",exception.description);
    } @finally {
        
    }
    
    
}


-(void) loadCharacterWeaponsStats{
 
    
    NSString *message   = @"🤺:2:GuardianViewController:loadCharacterWeaponsStats called...";
    
    MBRDestinyMemberships *membership = nil;
    
    UWHBaseClass *uweaponsBase = nil;
    
    NSString *selectedChar = [self->_destChars firstObject];
    
    if (!appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    
    
    if (appDelegate){
        
        [NetworkAPISingleClient getCharacterUniqueWeaponsStats:selectedChar completionBlock:^(NSArray *values) {
        
            
                 if (values){
                     
                     UWHBaseClass *baseClass = (UWHBaseClass*) [values firstObject];
                     
                     NSDictionary *callerInfo = [[NSDictionary alloc]
                                  initWithObjectsAndKeys:@"GuardianViewController",@"ClassName",
                                                         @"loadCharacterWeaponsStats",@"MethodName",
                                                         selectedChar,@"SelectedCharacter",
                                                         self.destChars,@"DestChars",
                                                         self.memberships,@"DestMemberships",
                                                         nil];
                 
                     //Raise the notification that characters is ready
                      [[NSNotificationCenter defaultCenter]
                            postNotificationName:kDestinyLoadedUniqueWeaponsStatsNotification
                          object:baseClass userInfo:callerInfo];
                         
                  
                 }
            
            
        }andErrorBlock:^(NSError *exception) {
            NSLog(@"🤺:loadCharacterWeaponsStats:NetworkAPISingleClient:getCharacter:Exception->%@",exception.description);
            
            
            if ([exception.localizedDescription isEqualToString:kBungieNeedsAuthenticateMessage]){
                [self dismissViewControllerAnimated:NO completion:^(void){
                    
                    [[NSNotificationCenter defaultCenter]
                       postNotificationName:kBungieNeedsAuthenticateMessage
                     object:exception];
                    
                }];
            }
        }];
        
         
         
 
    }
    
    
}

-(void) loadVaultItems{
    
    NSString *message   = @"🤺:1:GuardianViewController:loadVaultItems called...";
    
    MBRDestinyMemberships *membership = nil;
    
    @try {
        NSLog(@"%@",message);
        if (! self.memberships){
            message   = @"🤺:2:GuardianViewController:loadVaultItems:Getting Membership Detail from Delegate...";
            NSLog(@"%@",message);
            self.memberships = (NSArray *) [appDelegate destinyMemberships];
        }
        
        membership = (MBRDestinyMemberships *) [self.memberships objectAtIndex:0];
        
        if (! self->currentMembership){
            self->currentMembership  = membership.membershipId;
        }
      
        
        enum Destiny2MembershipType mType = [appDelegate currentMembershipType];
     
        NSString *strURL = @"%d/Profile/%@",
                 *strMID = self->currentMembership,
                 *strCharID = [self.destChars firstObject];
        
        
        strURL = [NSString stringWithFormat:strURL,mType,strMID];
        
        NSLog(@"🤺:GuardianViewController:loadVaultItems:[%@]",strURL);
        

        [NetworkAPISingleClient getVaultItems:strURL completionBlock:^(NSArray *values){
            
           if (values){
                
                    VAULTBaseClass *baseClass = (VAULTBaseClass*) [values firstObject];
                    
                    if (baseClass){
                        
                             NSString *charKey  =  strMID;
                                        
                             NSDictionary *callerInfo = [[NSDictionary alloc]
                                    initWithObjectsAndKeys:@"GuardianViewController",@"ClassName",
                                                          @"getVaultItems",@"MethodName",
                                                          strCharID,@"SelectedCharacter",
                                                          charKey,@"CurrentMembership",nil];
                                     
                                  [[NSNotificationCenter defaultCenter]
                                           postNotificationName:kDestinyLoadedProfileVaultNotification
                                                         object:baseClass
                                                         userInfo:callerInfo];
                                        
                           
                    }
                }
          
        }
        andErrorBlock:^(NSError *exception) {
            NSLog(@"🤺:NetworkAPISingleClient:loadVaultItems:Exception->%@",exception.description);
            
            
            if ([exception.localizedDescription isEqualToString:kBungieNeedsAuthenticateMessage]){
                
                [self dismissViewControllerAnimated:NO completion:^(void){
                    
                    [[NSNotificationCenter defaultCenter]
                       postNotificationName:kBungieNeedsAuthenticateMessage
                     object:exception];
                    
                }];
            }
        }];
        
     
      
        
    } @catch (NSException *exception) {
        NSLog(@"🤺:NetworkAPISingleClient:loadVaultItems:Exception->%@",exception.description);
    } @finally {
        message = nil;
    }
    
    
}

-(void) loadPublicVendors{
    
    
    NSString *message   = @"🤺:2:GuardianViewController:loadPublicVendors called...";
    
    MBRDestinyMemberships *membership = nil;
    
    if (!appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    
    
    if (appDelegate){
        
        if (appDelegate.isPublicVendorsLoaded){
            
            VNDBaseClass *vndBase  = (VNDBaseClass *) [appDelegate currentPublicVendors];
            
            NSString *selectedChar = [self->_destChars firstObject];
            
            if (vndBase){
             
                NSDictionary *callerInfo = [[NSDictionary alloc]
                             initWithObjectsAndKeys:@"GuardianViewController",@"ClassName",
                                                    @"loadPublicVendors",@"MethodName",
                                                    selectedChar,@"SelectedCharacter",
                                                    self.destChars,@"DestChars",
                                                    self.memberships,@"DestMemberships",
                                                    nil];
                    
            
                //Raise the notification that characters is ready
                 [[NSNotificationCenter defaultCenter]
                       postNotificationName:kDestinyLoadedPublicVendorsNotification
                     object:vndBase userInfo:callerInfo];
                
            }
        }
 
    }
    

    
}

-(void) loadCharacterInventories{
 
    NSString *message   = @"🤺:1:GuardianViewController:loadCharacterInventories called...";
    
    MBRDestinyMemberships *membership = nil;
    
    @try {
        NSLog(@"%@",message);
        if (! self.memberships){
            message   = @"🤺:2:GuardianViewController:loadCharacterInventories:Getting Membership Detail from Delegate...";
            NSLog(@"%@",message);
            self.memberships = (NSArray *) [appDelegate destinyMemberships];
        }
        
        membership = (MBRDestinyMemberships *) [self.memberships objectAtIndex:0];
        
        if (! self->currentMembership){
            self->currentMembership  = membership.membershipId;
        }
      
        if (! destCharData){
            message   = @"🤺:3:GuardianViewController:loadCharacterInventories:Getting Characters Detail from Delegate...";
            NSLog(@"%@",message);
            
            if ([[appDelegate destinyCharacters] isKindOfClass:NSArray.class]){
                //Initial time as NSArray
                self.destChars = (NSArray *) [appDelegate destinyCharacters];
            }
            else{
                //Already loaded Chars and NSDictionary
                
                destCharData = (NSMutableDictionary *) [appDelegate destinyCharacters];
                
                if (destCharData){
                    self.destChars = (NSArray *) destCharData.allKeys;
                    message   = @"🤺:4:GuardianViewController:loadCharacterInventories:Already in Delegate, exiting...";
                    NSLog(@"%@",message);
                }
                return;
            }

        }
        
        for (int iChars = 0; iChars < self.destChars.count; iChars++) {
            
            enum Destiny2MembershipType mType = [appDelegate currentMembershipType];
         
            NSString *strURL = @"%d/Profile/%@/Character/%@",
                     //*strURL = @"%d/Profile/%@",
                     *strMID = self->currentMembership,
                     *strCharID = [self.destChars objectAtIndex:iChars];
            
           // message = [NSString stringWithFormat:strURL, mType, strMID];
            message = [NSString stringWithFormat:strURL, mType, strMID, strCharID];
            
            NSLog(@"🤺:GuardianViewController:loadCharacterInventory:%d[%@]",iChars,message);
            
            // Path: MembershipType/Profile/{destinyMembershipId}/Character/{characterId}/
               
               [NetworkAPISingleClient getCharacterInventoryItems:message completionBlock:^(NSArray *values){
                   
                   if (values){
                       
                       if (values){
                       
                           INVCBaseClass *baseClass = (INVCBaseClass*) [values firstObject];
                           
                           if (baseClass){
                               
                               
                               NSArray *respArray = (NSArray*)[baseClass response];
                               
                               if (respArray){
                                   
                                   NSDictionary* profile =  [[NSDictionary alloc] initWithDictionary:respArray];
                                   
                                   if (profile){
                                       
                                          NSString *charKey       =  [self.destChars objectAtIndex:iChars],
                                                   *charstrIndex  =  [NSString stringWithFormat:@"%d",iChars];
                                               
                                          NSDictionary *callerInfo = [[NSDictionary alloc]
                                                        initWithObjectsAndKeys:@"GuardianViewController",@"ClassName",
                                                        @"getCharacterInventoryItems",@"MethodName",
                                                        charKey,@"CurrentCharacter",
                                                        charstrIndex, @"CurrentCharacterIndex",nil];
                                            
                                         [[NSNotificationCenter defaultCenter]
                                                  postNotificationName:kDestinyLoadedCharacterInventoryNotification
                                                                object:profile
                                                                userInfo:callerInfo];
                                               
                                   }
                               }
                           }
                       }
                   }
                   
               }
               andErrorBlock:^(NSError *exception){
                   NSLog(@"🤺:loadCharacters:NetworkAPISingleClient:getCharacterInventory:Exception->%@",exception.description);
                   if ([exception.localizedDescription isEqualToString:kBungieNeedsAuthenticateMessage]){
                       [self dismissViewControllerAnimated:NO completion:^(void){
                           
                           [[NSNotificationCenter defaultCenter]
                              postNotificationName:kBungieNeedsAuthenticateMessage
                            object:exception];
                           
                       }];
                   }
               }];
               
            
        }
        
      
        
    } @catch (NSException *exception) {
        NSLog(@"🤺:loadCharacters:NetworkAPISingleClient:getCharacterInventory:Exception->%@",exception.description);
    } @finally {
        message = nil;
    }
    
}

 
-(void) loadCharacters{
 
    NSString *message   = @"🤺:1:GuardianViewController:loadCharacters called...";
    
    MBRDestinyMemberships *membership = nil;
    
    @try {
        NSLog(@"%@",message);
        
        if (! self.memberships){
            message   = @"🤺:2:GuardianViewController:loadCharacters:Getting Membership Detail from Delegate...";
            self.memberships = (NSArray *) [appDelegate destinyMemberships];
            NSLog(@"%@",message);
        }
        
        membership = (MBRDestinyMemberships *) [self.memberships objectAtIndex:0];
        
        if (! self->currentMembership){
            self->currentMembership  = membership.membershipId;
        }
      
        if (! destCharData){
        
            if ([[appDelegate destinyCharacters] isKindOfClass:NSArray.class]){
                //Initial time as NSArray
                self.destChars = (NSArray *) [appDelegate destinyCharacters];
                message   = @"🤺:3:GuardianViewController:loadCharacters:Getting Characters Detail from Delegate as Array...";
                NSLog(@"%@",message);
            }
            else{
                //Already loaded Chars and NSDictionary
                
                destCharData = (NSMutableDictionary *) [appDelegate destinyCharacters];
                if (destCharData){
                    
                    
                    self.destChars = (NSArray *) destCharData.allKeys;
                    message   = @"🤺:3:GuardianViewController:loadCharacters:Getting Characters Detail from Delegate as Dictionary...";
                    NSLog(@"%@",message);
                   
                }
                return;
            }
            
            destCharData = [[NSMutableDictionary alloc] initWithCapacity:self.destChars.count];
        }
    
        for (int iChars = 0; iChars < self.destChars.count; iChars++) {
            
            enum Destiny2MembershipType mType = [appDelegate currentMembershipType];
         
            NSString *strURL = @"%d/Profile/%@/Character/%@",
                     *strMID = self->currentMembership,
                     *strCharID = [self.destChars objectAtIndex:iChars];
            
            message = [NSString stringWithFormat:strURL, mType, strMID, strCharID];
            
            NSLog(@"🤺:%d:GuardianViewController:loadCharacter:[%@]",iChars,message);
            
            // Path: MembershipType/Profile/{destinyMembershipId}/Character/{characterId}/
               
               [NetworkAPISingleClient getCharacterEquipedItems:message completionBlock:^(NSArray *values){
                   
                   if (values){
                       
                       if (values){
                           GRDBaseClass *baseClass = (GRDBaseClass*) [values firstObject];
                           
                           if (baseClass){
                               
                               NSArray *respArray = (NSArray*) [baseClass response];
                               
                               if (respArray){
                                   
                                   NSDictionary *profile =  [[NSDictionary alloc] initWithDictionary:respArray],
                                                *equipment    =  nil;
                                   
                                   if (profile){
                                       
                                          NSString *charKey       =  [self.destChars objectAtIndex:iChars],
                                                   *charstrIndex  =  [NSString stringWithFormat:@"%d",iChars];
                                               
                                          NSDictionary *callerInfo = [[NSDictionary alloc]
                                                        initWithObjectsAndKeys:@"GuardianViewController",@"ClassName",
                                                        @"loadCharacters",@"MethodName",
                                                        charKey,@"CurrentCharacter",
                                                        charstrIndex, @"CurrentCharacterIndex",nil];
                                            
                                         [[NSNotificationCenter defaultCenter]
                                                  postNotificationName:kDestinyLoadedCharacterNotification
                                                                object:profile
                                                                userInfo:callerInfo];
                                       
                                       
                                       equipment  = [profile objectForKey:@"equipment"];
                                       
                                       if (equipment){
                                            
                                               
                                               [[NSNotificationCenter defaultCenter]
                                                        postNotificationName:kDestinyLoadedCharacterEquipmentNotification
                                                                      object:equipment
                                                                      userInfo:callerInfo];
                                          
                                       }
                                      
                                            
                                               
                                   }
                               }
                           }
                       }
                   }
                   
               }
               andErrorBlock:^(NSError *exception){
                   NSLog(@"🤺:GuardianViewController:loadCharacters:NetworkAPISingleClient:getCharacter:Exception->%@",exception.description);
                   
                   if ([exception.localizedDescription isEqualToString:kBungieNeedsAuthenticateMessage]){
                       [self dismissViewControllerAnimated:NO completion:^(void){
                           
                           [[NSNotificationCenter defaultCenter]
                              postNotificationName:kBungieNeedsAuthenticateMessage
                            object:exception];
                           
                       }];
                   }
               }];
               
            
        }
        
      
        
    } @catch (NSException *exception) {
        message = [NSString stringWithFormat:
                   @"🤺:GuardianViewController:loadCharacters:NetworkAPISingleClient:getCharacter:Exception->%@",exception.description];
        NSLog(@"%@",message);
    } @finally {
        message = nil;
        membership = nil;
    }
    
}

-(void) endTimer{
    
    if (self.timer != nil){
        [self.timer invalidate];
    }
    NSLog(@"🤺:Determine Last Access Character Timer Stopped");
    self.timer = nil;
}


-(void) startTimer{

    double interval = 2;
    
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]
                                              interval:interval target:self
                                              selector:@selector(timerFireMethod:)
                                              userInfo:nil
                                               repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
    
        [self.loop addTimer:self.timer forMode:NSDefaultRunLoopMode];
 
    
}




- (void)timerFireMethod:(NSTimer *)t{
    
    NSString *message         = @"",
             *lastChar        = @"";
    
    int      totalSections   = 0,
             totalChars      = 0,
              totalRows      = 0;
    
    NSIndexPath *iPath = nil;
    
    GuardianCellTableView *cell = nil;
    
    UIImage *selCharImage = nil;
    
    UIImageView *selCharImageView = nil;
    
    BOOL canProcess = NO;
    
    @try {
        
        message = @"🤺:timerFireMethod:Checking lastAccessedCharacter:Started...";
        NSLog(@"%@",message);
        
        if(! self.tblChars){
            canProcess = NO;
            message = @"🤺:1:timerFireMethod:Checking lastAccessedCharacter:NO self.tblChars:Exiting...";
            NSLog(@"%@",message);
            return;
        }else{
            
            totalSections = [self.tblChars numberOfSections];
            totalRows     = [self.tblChars numberOfRowsInSection:0];
            
            message = [NSString stringWithFormat:
                       @"🤺:1:timerFireMethod:Checking lastAccessedCharacter:self.tblChar:Sections Count:[%d],CharsRow Count:[%d]",
                       totalSections,totalRows];
            
            canProcess = YES;
            NSLog(@"%@",message);
            
        }
        
        if(! self.destChars){
            canProcess = NO;
            message = @"🤺:2:timerFireMethod:Checking lastAccessedCharacter:NO self.destChars:Exiting...";
            NSLog(@"%@",message);
            return;
        }else{
            totalChars  = [self.destChars count];
            message = [NSString stringWithFormat:@"🤺:2:timerFireMethod:Checking lastAccessedCharacter:Total Chars:[%d]",totalChars];
            canProcess = YES;
            NSLog(@"%@",message);
        }
        
        if(! self->lastAccessedCharacter){
            canProcess = NO;
            message = @"🤺:3:timerFireMethod:Checking lastAccessedCharacter:Exiting:No self.lastAccessedCharacter...";
            NSLog(@"%@",message);
            return;
        }else{
            lastChar = self->lastAccessedCharacter;
            message = [NSString stringWithFormat:@"🤺:3:timerFireMethod:Checking lastAccessedCharacter:Last Character:[%@]",lastChar];
            canProcess = YES;
            NSLog(@"%@",message);
        }

        
        if (canProcess){
            
            if (totalRows == totalChars){
                    
                for(NSString *cKey in self.destChars){
                    
                    int cRow = [self.destChars indexOfObject:cKey];
                    
                    if ([cKey isEqualToString:lastChar]){
                        
                        iPath = [NSIndexPath indexPathForRow:cRow inSection:0];
                        
                        cell = (GuardianCellTableView*) [self.tblChars cellForRowAtIndexPath:iPath];
                        
                        //Last access character

                        [cell.imgLastAccessedGuardian setHidden:NO];
                    
                        selCharImage = [UIImage imageWithData:UIImagePNGRepresentation(cell.imgBackground.image)];
                            
                        selCharImageView =   [[UIImageView alloc] initWithImage:selCharImage];
                            
                            if (selCharImageView){
                                self->selectedCharEmblem = selCharImageView;
                            }
                        
                        self->selectedCharacter  = cKey;
                        
                       /* [self.tblChars selectRowAtIndexPath:iPath
                                                    animated:NO
                                                scrollPosition:UITableViewScrollPositionNone];*/
                        
                        // [self tableView:self.tblChars didSelectRowAtIndexPath:iPath];
                        
                        message = [NSString stringWithFormat:
                                   @"🤺:4:timerFireMethod:Sucessfully Processed [%d/%lu] Characters, stopping timer.",totalRows,totalChars];
                        
                        NSLog(@"%@",message);
                        
                        [self endTimer];
                    }
                    
                }
                
            }
            else{
                
                if (self.destChars){
                    message = [NSString stringWithFormat:
                               @"🤺:4:timerFireMethod:Still processing [%d/%lu] Characters...",totalRows,(unsigned long)totalChars];
                    NSLog(@"%@",message);
                }
            }
        }
    
    }
    @catch (NSException *exception) {
        message = [NSString stringWithFormat:@"Exception from:[%@]\r\n{%@}",message, exception.description];
        NSLog(@"%@",message);
       
    }
    @finally {
 
        message = nil;
        
    }
    
    
}
/*
-(void) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    
    NSIndexPath *pIndexPath = [tableView indexPathForSelectedRow];
    
    UITableViewCell *selectedCell = nil;
    @try {
        
        if (pIndexPath){
            
            selectedCell  =  [tableView cellForRowAtIndexPath:indexPath];
            
            if (selectedCell){
                [selectedCell.layer setMasksToBounds:NO];
                [selectedCell.layer setCornerRadius:0];
                [selectedCell.layer setBorderWidth:0];
                [selectedCell.layer setShadowOffset: CGSizeMake(0, 0)];
                [selectedCell.layer setBorderColor:[UIColor blackColor].CGColor];
            }
            
        }
        
    }@catch (NSException *exception) {
        NSLog(@"GuardianViewController:willSelectRowAtIndexPath:Exception->%@",exception.description);
    }@finally {
        pIndexPath = nil;
        selectedCell = nil;
    }
    
}
 */
 
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
 
    
    NSArray<UITableViewCell*> *vCells =  [tableView visibleCells];
    
    GuardianCellTableView *selectedCell = (GuardianCellTableView *) [tableView cellForRowAtIndexPath:indexPath];
    
    NSInteger iRow =  [indexPath row];
    
    NSString *selCharKey = nil;
    
     
    @try {
        
        selCharKey = [self.destChars objectAtIndex:iRow];
        
        if (indexPath.section == 1){
            selCharKey = kDestinyVaultHash;
        }
        
        self->selectedCharacter = selCharKey;
         
        UIImage *selCharImage = [UIImage imageWithData:UIImagePNGRepresentation(selectedCell.imgBackground.image)];
         
        UIImageView *selCharImageView =   [[UIImageView alloc] initWithImage:selCharImage];
            
            if (selCharImageView){
                self->selectedCharEmblem = selCharImageView;
            }
            
        for (UITableViewCell *vCell in vCells) {
           
            if (![vCell isEqual:selectedCell] && (vCell.layer.borderColor == [UIColor systemOrangeColor].CGColor)){
             
                if (vCell){
                    [vCell.layer setMasksToBounds:NO];
                    [vCell.layer setCornerRadius:0];
                    [vCell.layer setBorderWidth:0];
                    [vCell.layer setShadowOffset: CGSizeMake(0, 0)];
                    [vCell.layer setBorderColor:[UIColor clearColor].CGColor];
                }
                
                if (self.segCategories.isEnabled){
                    [self.segCategories setEnabled:NO];
                    [self.segCategories setTintColor:[UIColor darkGrayColor]];
                    [self.segCategories setHighlighted:NO];
                }
            }
        }
        
        if(selectedCell && (selectedCell.layer.borderColor != [UIColor systemOrangeColor].CGColor) ){
            
           /* [selectedCell.layer setMasksToBounds:YES];
            [selectedCell.layer setCornerRadius:5];*/
            [selectedCell.layer setBorderWidth:3];
            [selectedCell.layer setShadowOffset: CGSizeMake(-1, 1)];
            [selectedCell.layer setBorderColor:[UIColor systemOrangeColor].CGColor];
            
            if (!self.segCategories.isEnabled){
                [self.segCategories setEnabled:YES];
                [self.segCategories setTintColor:[UIColor whiteColor]];
                [self.segCategories setHighlighted:YES];
            }
            
            //[self performSegueWithIdentifier:@"segVendors" sender:selectedChar];
        }
        
        if (indexPath.section == 2){
            [self.segCategories setEnabled:NO];
        }
        
      /*  [NetworkAPISingleClient getVendors:selectedChar completionBlock:^(NSArray *values){
            
            if (values){
                
                NSDictionary *callerInfo = [[NSDictionary alloc]
                             initWithObjectsAndKeys:@"GuardianViewController",@"ClassName",
                                                    @"getVendors",@"MethodName",
                                                    selectedChar,@"SelectedCharacter",
                                                    self.destChars,@"DestChars",
                                                    self.memberships,@"DestMemberships",
                                                    nil];
                    
            
                //Raise the notification that characters is ready
                 [[NSNotificationCenter defaultCenter]
                       postNotificationName:kDestinyLoadedVendorsNotification
                     object:values userInfo:callerInfo];
                    
             
            }
            
        } andErrorBlock:^(NSError *exception){
            
            NSLog(@"Error->%@",exception.description);
        }];*/
         
    } @catch (NSException *exception) {
        NSLog(@"Error->%@",exception.description);
    } @finally {
         
    }
    
   
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    NSArray *items     = nil;
    
    NSMutableDictionary *chars   = nil;
    
    NSString *currentCharacterID = nil;
    
    ItemsViewController *vendorVC = nil;
    
    
    @try {
        
        
        if (sender){
            currentCharacterID =  (NSString *) sender;
           
            chars =  self->destCharData;
            
            vendorVC = (ItemsViewController *) segue.destinationViewController;
        
            [vendorVC setSelectedChar:currentCharacterID];
            [vendorVC setDestChars:chars];
            [vendorVC setSelectedMembership:self->currentMembership];
            [vendorVC loadItems];
            
        }
        
    } @catch (NSException *exception) {
        NSLog(@"Error->%@",exception.description);
    } @finally {
         
       
        items = nil;
        chars   = nil;
        
        currentCharacterID = nil;
        
        vendorVC = nil;
    }
    
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger size = self->RowHeight ;
     
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    NSInteger size = self->FooterHeight;
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSInteger size = self->HeaderHeight;
    
    return size;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSString *headerTitle = @"";
    
    UILabel *header = nil;
        header = [[UILabel alloc] init];
        [header setFont:[UIFont fontWithName:kDefaultFontName size:20]];
        [header setTextAlignment:NSTextAlignmentLeft];
        [header setTextColor:[UIColor systemOrangeColor]];
        [header setBackgroundColor:[UIColor blackColor]];
        switch (section) {
            case 0:
                [header setText:@"Characters"];
                break;
            case 1:
                [header setText:@"General Vault"];
                break;
            case 2:
                
                headerTitle = [NSString stringWithFormat:@"%@", self->currentClanName];
                
                [header setText:headerTitle];
                break;
            case 3:
                [header setText:@"Public Vendors"];
                break;
            }
        return header;
    
}


-(void) handleLongPress:(UILongPressGestureRecognizer *) recognize{
    
    NSLog(@"GuardianViewController:handleLongPress:Invoked...");
    
    GuardianCellTableView *cCell = nil;
    
    GroupViewController *gVC = nil;
    
    UIStoryboard *storyBoard = nil;
  
    UINavigationController *navVC = nil;
    
    NSString *clanSearchTerm = nil;
    
    BOOL processRequest = NO;
    @try {
        
        
        switch(recognize.state){
            case UIGestureRecognizerStateEnded:
                NSLog(@"GuardianViewController:UIGestureRecognizerStateEnded:Detected...");
                break;
            case UIGestureRecognizerStateBegan:
                NSLog(@"GuardianViewController:UIGestureRecognizerStateBegan:Detected...");
                processRequest = YES;
                break;
            case UIGestureRecognizerStateChanged:
                NSLog(@"GuardianViewController:UIGestureRecognizerStateChanged:Detected...");
                break;
            case UIGestureRecognizerStateCancelled:
                NSLog(@"GuardianViewController:UIGestureRecognizerStateCancelled:Detected...");
                break;
            case UIGestureRecognizerStatePossible:
                NSLog(@"GuardianViewController:UIGestureRecognizerStatePossible:Detected...");
                break;
            case UIGestureRecognizerStateFailed:
                NSLog(@"GuardianViewController:UIGestureRecognizerStateFailed:Detected...");
                break;
        }
        
       
        
        if (processRequest){
            
            NSIndexPath *selectedIndexPath = [self.tblChars indexPathForSelectedRow];
            
            if (selectedIndexPath){
            
                cCell = (GuardianCellTableView*) [self.tblChars cellForRowAtIndexPath:selectedIndexPath];
                
                if (cCell){
                    
                    storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    gVC =   [storyBoard instantiateViewControllerWithIdentifier:@"sbGroup"];
                                
                    if (gVC){
                     
                        NSString *clanKey = [self.clans firstObject];
                        
                        CLNDetail *clanDetails = [self->destClanData objectForKey:clanKey];
                        
                        if (clanDetails){
                           
                            
                            clanSearchTerm = [clanDetails.name stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
                            
                            clanSearchTerm = [clanSearchTerm uppercaseString];
                            
                            [gVC searchBungieGroup:clanSearchTerm];
                            
                            navVC = [[UINavigationController alloc] initWithRootViewController:gVC];
                                               
                            [self presentViewController:navVC
                                 animated:NO completion:^{
                                                   
                                                   
                            }];

                        }
                    }
                  
                    
               }
               
            }
            
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    

}


-(void) associateInvDataByBucket:(INVCItems *) anyItem withCurrentChar:(NSString *) currentCharacter{
    
    INVCItems *item = [anyItem copy];
    
    NSNumber *objItemBucket = [NSNumber numberWithDouble:item.bucketHash],
             *objItemHash   = [NSNumber numberWithDouble:item.itemHash];
    
    NSInteger iItemBucket = [objItemBucket integerValue];
    
    NSString *strItemHash = [NSString stringWithFormat:@"%@",objItemHash],
             *strBucketHash = [NSString stringWithFormat:@"%@",objItemBucket],
             *strFullKey = [NSString stringWithFormat:@"%@_%@_%@",currentCharacter,strBucketHash,strItemHash];
 

     
    //Full Key = Characterid_buckethash_itemhash
    switch (iItemBucket){
        
        case 1498876634://Primary
            
            if (![self->destCharWeaponsData.allKeys containsObject:strFullKey]){
                [self->destCharWeaponsData setValue:item forKey:strFullKey];
                //NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Primary Weapon...",strFullKey);
            }
            
            break;
        case 2465295065://Energy
            if (![self->destCharWeaponsData.allKeys containsObject:strFullKey]){
                [self->destCharWeaponsData setValue:item forKey:strFullKey];
               // NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Energy Weapon...",strFullKey);
            }
            
            break;
        case 953998645://Heavy
            if (![self->destCharWeaponsData.allKeys containsObject:strFullKey]){
                [self->destCharWeaponsData setValue:item forKey:strFullKey];
              //  NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Heavy Weapon...",strFullKey);
            }
            
            break;

        
        case 3448274439://Helmet
            if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                [self->destCharArmorData setValue:item forKey:strFullKey];
            //    NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Helmet Armor...",strFullKey);
            }
           
            break;
        case 3551918588://Gauntlets
            
            if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                [self->destCharArmorData setValue:item forKey:strFullKey];
            //    NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Gloves Armor...",strFullKey);
            }
            break;
        case 14239492://Chest
            if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                [self->destCharArmorData setValue:item forKey:strFullKey];
           //     NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Chest Weapon...",strFullKey);
            }
            
            break;
        case 20886954://Legs
            
            if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                [self->destCharArmorData setValue:item forKey:strFullKey];
          //      NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Legs Armor...",strFullKey);
            }
            
            break;
        case  1585787867://Class Armor
            
            if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                [self->destCharArmorData setValue:item forKey:strFullKey];
         //       NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Class Armor...",strFullKey);
            }
            break;
         //BEGIN GENERAL
        
        case 4023194814://Ghost
            if (![self->destCharEquippedData.allKeys containsObject:strFullKey]){
                [self->destCharEquippedData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Ghost...",strFullKey);
            }
            
            if (![self->destCharGeneralData.allKeys containsObject:strFullKey]){
                [self->destCharGeneralData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Ghost...",strFullKey);
            }
            break;
            
        case 1506418338://Seasonal Artifact
            if (![self->destCharEquippedData.allKeys containsObject:strFullKey]){
                [self->destCharEquippedData setValue:item forKey:strFullKey];
            //    NSLog(@"GuardianViewController:kDestinyLoadedCharacterInventoryNotification:%@ Artifact...",strFullKey);
            }
            
            if (![self->destCharGeneralData.allKeys containsObject:strFullKey]){
                [self->destCharGeneralData setValue:item forKey:strFullKey];
            //    NSLog(@"GuardianViewController:destCharGeneralData:%@ Artifact...",strFullKey);
            }
            
            break;
        case 4292445962 : //Clan Banners
            
            if (![self->destCharEquippedData.allKeys containsObject:strFullKey]){
                [self->destCharEquippedData setValue:item forKey:strFullKey];
            //    NSLog(@"GuardianViewController:kDestinyLoadedCharacterInventoryNotification:%@ Clan Banner...",strFullKey);
            }
            
            if (![self->destCharGeneralData.allKeys containsObject:strFullKey]){
                [self->destCharGeneralData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharGeneralData:%@->Clan Banner...",strFullKey);
            }
            break;
        case 2025709351://Vehicles
            if (![self->destCharEquippedData.allKeys containsObject:strFullKey]){
                [self->destCharEquippedData setValue:item forKey:strFullKey];
            //    NSLog(@"GuardianViewController:destCharEquippedData:%@->Vehicles...",strFullKey);
            }
            if (![self->destCharGeneralData.allKeys containsObject:strFullKey]){
                [self->destCharGeneralData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharGeneralData:%@->Vehicles...",strFullKey);
            }
            break;
            
        case 375726501://Engrams
            if (![self->destCharEquippedData.allKeys containsObject:strFullKey]){
                [self->destCharEquippedData setValue:item forKey:strFullKey];
               // NSLog(@"GuardianViewController:destCharEquippedData:%@->Engrams...",strFullKey);
            }
            if (![self->destCharGeneralData.allKeys containsObject:strFullKey]){
                [self->destCharGeneralData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharGeneralData:%@->Engrams...",strFullKey);
            }
            break;
            
        case 4274335291://Emblems
            if (![self->destCharEquippedData.allKeys containsObject:strFullKey]){
                [self->destCharEquippedData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharEquippedData:%@->Emblems...",strFullKey);
            }
            
            if (![self->destCharGeneralData.allKeys containsObject:strFullKey]){
                [self->destCharGeneralData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharGeneralData:%@->Emblems...",strFullKey);
            }
            break;
        case 284967655://Ships
            if (![self->destCharEquippedData.allKeys containsObject:strFullKey]){
                [self->destCharEquippedData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharEquippedData:%@->Ships...",strFullKey);
            }
            if (![self->destCharGeneralData.allKeys containsObject:strFullKey]){
                [self->destCharGeneralData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharGeneralData:%@->Ships...",strFullKey);
            }
            break;
        case 3054419239://Emotes
            if (![self->destCharEquippedData.allKeys containsObject:strFullKey]){
                [self->destCharEquippedData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharEquippedData:%@->Emotes...",strFullKey);
            }
            if (![self->destCharGeneralData.allKeys containsObject:strFullKey]){
                [self->destCharGeneralData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharGeneralData:%@->Emotes...",strFullKey);
            }
            break;

        //END GENERAL
            
        //BEGIN POSTMASTER
        case 215593132://Lost Items
            if (![self->destCharPostmasterData.allKeys containsObject:strFullKey]){
                [self->destCharPostmasterData setValue:item forKey:strFullKey];
               // NSLog(@"GuardianViewController:destCharPostmasterData:%@->LostItems...",strFullKey);
            }
            break;
        case 1367666825://Special Orders
            if (![self->destCharPostmasterData.allKeys containsObject:strFullKey]){
                [self->destCharPostmasterData setValue:item forKey:strFullKey];
               // NSLog(@"GuardianViewController:destCharPostmasterData:%@->Special Orders..",strFullKey);
            }
            break;
            
        case 3161908920 ://Messages
            if (![self->destCharPostmasterData.allKeys containsObject:strFullKey]){
                [self->destCharPostmasterData setValue:item forKey:strFullKey];
               // NSLog(@"GuardianViewController:destCharPostmasterData:%@->Messages...",strFullKey);
            }
            break;
        //END POSTMASTER
        
        //BEGIN INVENTORY
        case 1469714392://Consumables
            if (![self->destCharEquippedData.allKeys containsObject:strFullKey]){
                [self->destCharEquippedData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharEquippedData:%@->Consumables...",strFullKey);
            }
            
            if (![self->destCharInventoryData.allKeys containsObject:strFullKey]){
                [self->destCharInventoryData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharEquippedData:%@->Consumables...",strFullKey);
            }
            break;
        case 3313201758://Modifications
            if (![self->destCharEquippedData.allKeys containsObject:strFullKey]){
                [self->destCharEquippedData setValue:item forKey:strFullKey];
              //  NSLog(@"GuardianViewController:destCharEquippedData:%@->Mods...",strFullKey);
            }
            
            if (![self->destCharInventoryData.allKeys containsObject:strFullKey]){
                [self->destCharInventoryData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharEquippedData:%@->Mods...",strFullKey);
            }
            break;
        case 3683254069://Finishers
            if (![self->destCharEquippedData.allKeys containsObject:strFullKey]){
                [self->destCharEquippedData setValue:item forKey:strFullKey];
              //  NSLog(@"GuardianViewController:destCharEquippedData:%@->Finishers...",strFullKey);
            }
            
            if (![self->destCharInventoryData.allKeys containsObject:strFullKey]){
                [self->destCharInventoryData setValue:item forKey:strFullKey];
             //   NSLog(@"GuardianViewController:destCharEquippedData:%@->Finishers...",strFullKey);
            }
            break;
          //END INVENTORY
      
            
    }
    
}

-(void) initArrayData{
    
    if (! self->destCharWeaponsData){
        self->destCharWeaponsData = [[NSMutableDictionary alloc] init];
    }
    if (! self->destCharArmorData){
        self->destCharArmorData   = [[NSMutableDictionary alloc] init];
    }
    if (! self->destCharEquippedData){
        self->destCharEquippedData   = [[NSMutableDictionary alloc] init];
    }
    if (! self->destVaultData){
        self->destVaultData   = [[NSMutableDictionary alloc] init];
    }
    
    if (! self->destCharGeneralData){
        self->destCharGeneralData   = [[NSMutableDictionary alloc] init];
    }
    
    if (! self->destCharInventoryData){
        self->destCharInventoryData   = [[NSMutableDictionary alloc] init];
    }
    
    if (! self->destCharPostmasterData){
        self->destCharPostmasterData   = [[NSMutableDictionary alloc] init];
    }
    
}

-(void) initArrays{
    
    if (!self->weaponsArray){
        //Kinetic, Energy, Power
         self->weaponsArray = [[NSArray alloc] initWithObjects:@"1498876634",@"2465295065",@"953998645",nil];
    }
    if (! self->armorArray){
        //Helmet,Gauntlets,Chest ,Legs, Class
         self->armorArray   = [[NSArray alloc] initWithObjects:@"3448274439",@"3551918588",@"14239492",@"20886954",@"1585787867", nil];
    }
    
    if (!self->equippedArray){
        self->equippedArray = [[NSMutableArray alloc] init];
    }
     
    if (!self->vaultArray){//General
        self->vaultArray =  [[NSMutableArray alloc] initWithObjects:@"138197802",nil];
    }
    
    
    if (!self->postMasterArray){
        //Lost Items, messages, special orders
        self->postMasterArray =  [[NSMutableArray alloc] initWithObjects:@"215593132",@"3161908920",@"1367666825",nil];
    }
    
    if (!self->generalArray){
        //Engrams, Ghosts, Artifact, Vehicle,Clan Banner,Ships, Finishers, Emblems
        self->generalArray =  [[NSMutableArray alloc] initWithObjects:@"375726501",@"4023194814",@"1506418338",@"2025709351",
                               @"4274335291", @"284967655",@"4292445962",@"3683254069",nil];
    }
    
    if (!self->invArray){
        //Consumables, Mofifications,Emotes
        self->invArray =  [[NSMutableArray alloc] initWithObjects:@"1469714392",@"3313201758",@"3054419239",nil];
    }

    
}

-(void) initTableView{
    
    NSString *message = nil;
    @try {
        
     
        
        if (! self.tblChars){
            self.tblChars = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f,self.view.frame.size.width,
                                                                          self.view.frame.size.height)];
            
            self.tblChars.contentInset = UIEdgeInsetsMake(0, 0, self.view.frame.size.height -20, 0);
            
            [self.view addSubview:self.tblChars];
            [self.tblChars setBackgroundColor:[UIColor blackColor]];
        }
        
        [self.tblChars registerNib:[UINib nibWithNibName:@"GuardianCellTableView"
                                                  bundle:nil]
            forCellReuseIdentifier:@"GuardianCellTableView"];
         
        
        [self.tblChars setDelegate:self];
        [self.tblChars setDataSource:self];
        
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        
        
        longPress.minimumPressDuration = 2.0;
        longPress.numberOfTouchesRequired = 1.0;
        [self.tblChars addGestureRecognizer:longPress];
        
        
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
 
 /*
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSString *message   = nil;
    
    GuardianCellTableView *gCell = nil;
    @try {
        
        gCell =  (GuardianCellTableView*) cell;
        
        if (gCell){
        
            gCell.contentView.superview.backgroundColor = [UIColor blackColor];
            
            [gCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
            switch (indexPath.section) {
                case 0:
                    //Characters
                    message = @"Loading Character...";
                    break;
                    
                case 1:
                    //Vendors
                    message = @"Loading Vendor...";
                    break;
            }
            if (! gCell.tag){
                
                [gCell.lblGuardianClass setText:message];
                [gCell.lblGuardianRace setText:@"Please Wait"];
                [gCell.lblLightLevel setText:@""];
                [gCell.lblGuardianGender setText:@""];
                [gCell.lblGuardianCareer setText:@""];
            }
      }
        
    } @catch (NSException *exception) {
        NSLog(@"GuardianCellTableView:willDisplayCell:forRowAtIndexPath:Exception->%@",exception.description);
    } @finally {
        message = nil;
        gCell = nil;
    }
 
}
 */

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   GuardianCellTableView *cell = nil;
    
    static NSString *cellId = @"GuardianCellTableView";
    
    NSString *message   = nil,
             *imageName = nil,
             *baseURL   = nil,
             *classHash = nil,
             *genderHash = nil,
             *raceDesc   = nil,
             *lightLevel = nil,
             *seal       = nil,
             *progHash   = nil,
             *emblem     = nil,
             *vendorHash = nil;
    
 
    NSNumber *raceType   = nil;
    
    NSDictionary *classDefinitions = nil,
                 *genderDefinitions = nil,
                 *grdData = nil;
    
    NSURL *imageURL = nil,
          *emblemURL = nil;
    
    UIImage *imgEmblem = nil;
    
    VNDBaseClass* vendorBase = nil;
    
    NSInteger section = indexPath.section;
     
    @try {
        
        cell = (GuardianCellTableView*) [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (! cell){
            //cell = [[GuardianCellTableView alloc] init];
            cell = [[GuardianCellTableView alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:cellId];
            
            [cell.contentView setBackgroundColor:[UIColor blackColor]];
             
        }
        
        
        if (cell){
            [cell.lblLightLevel setText:@""];
            [cell.lblGuardianCareer setText:@""];
            
            [cell.layer setMasksToBounds:NO];
            [cell.layer setCornerRadius:0];
            [cell.layer setBorderWidth:1];
            //[cell.layer setShadowOffset: CGSizeMake(-1, 1)];
            [cell.layer setBorderColor:[UIColor clearColor].CGColor];
            
        }
        
        switch (section) {
                
            case 0:{
                
                if (cell.tag){
                    //character could be already processed
                    
                    /*if (![cell.lblGuardianClass.text isEqualToString:@"Loading Character..."]){
                        return cell;
                    }*/
                   
                }

                if ([self.destChars isKindOfClass:[NSArray class]]){
                    message =  [self.destChars objectAtIndex:indexPath.row];
                }else{
                    NSArray *destCharKeys = [(NSDictionary*) self.destChars allKeys];
                    
                    message =  [destCharKeys objectAtIndex:indexPath.row];
                    
                }

                grdData =  [destCharData objectForKey:message];
                
                if (grdData){
                    
        
                    classHash  = [grdData objectForKey:@"classHash"];
                    genderHash = [grdData objectForKey:@"genderHash"];
                    
                    raceType = [[NSNumber alloc] init];
                  
                    raceType = [grdData objectForKey:@"raceType"];
                     
                    lightLevel = [grdData objectForKey:@"light"];
                    progHash   = [grdData objectForKey:@"progressionHash"];
                    seal       = [grdData objectForKey:@"titleRecordHash"];
                    
                    imageName  = [grdData objectForKey:@"emblemPath"];
                    
                    emblem = [grdData objectForKey:@"emblemBackgroundPath"];
                    
                    baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
                    
                    emblem = [NSString stringWithFormat:@"%@%@",kBungieBaseURL,emblem];
                    
                    
                    if (appDelegate.destinyClassDefinitions){
                        classDefinitions = [appDelegate destinyClassDefinitions];
                        
                        
                        NSString *strClassHash = [NSString stringWithFormat:@"%@",classHash],
                                 *strHKey = [[Hunter class] key],
                                 *strTKey = [[Titan class] key],
                                 *strWKey = [[Warlock class] key],
                                 *strText = nil,
                                 *strLight = [NSString stringWithFormat:@"%@",lightLevel];
                       
                        emblemURL = [[NSURL alloc] initWithString:baseURL];
                        
                        imageURL = [[NSURL alloc] initWithString:emblem];
                        
                        [cell.imgEmblem setImageWithURL:emblemURL];
                        
                        [cell.imgEmblem setHidden:YES];
                        
                        [cell.imgBackground setImageWithURL:imageURL];
                      
                        [cell.lblLightLevel setText:strLight];
          

                        if ([strClassHash isEqualToString:strHKey]){
                            Hunter *hunter = (Hunter*) [classDefinitions objectForKey:strClassHash];
                            
                            if (hunter){
                                strText  = [NSString stringWithFormat:@"%@", hunter.className];
                               }
                        }
                        
                        if ([strClassHash isEqualToString:strTKey]){
                            Titan *titan = (Titan*) [classDefinitions objectForKey:strClassHash];
                            
                            if (titan){
                                strText  = [NSString stringWithFormat:@"%@", titan.className];
                            }
                        }
                        
                        if ([strClassHash isEqualToString:strWKey]){
                            Warlock *warlock = (Warlock*) [classDefinitions objectForKey:strClassHash];
                            
                            if (warlock){
                                strText  = [NSString stringWithFormat:@"%@", warlock.className];
                            }
                        }
                        
                        [cell.lblGuardianClass setText:strText];
                        
                    }
                    
                    enum Destiny2RaceType rType = (int) raceType;
                    
                    switch (raceType.intValue) {
                        case Awoken:
                            raceDesc =  @"Awoken";
                            break;
                        case Exo:
                            raceDesc =  @"Exo";
                            break;
                        case Human:
                            raceDesc =  @"Human";
                            break;

                        default:
                            raceDesc = @"Unknown";
                            break;
                    }
                     
                    [cell.lblGuardianRace setText:raceDesc];
                    
                    if (appDelegate.destinyGenderDefinitions){
                        
                        genderDefinitions = [appDelegate destinyGenderDefinitions];
                        
                        
                        GenderedClassNamesByGenderHash *male   = [[GenderedClassNamesByGenderHash alloc] init],
                                                       *female = [[GenderedClassNamesByGenderHash alloc] init];
                        
                        NSString *strGenderHash = [NSString stringWithFormat:@"%@",genderHash],
                                 *strMKey       = [[GenderedClassNamesByGenderHash class] maleHash],
                                 *strFKey       = [[GenderedClassNamesByGenderHash class] femaleHash],
                                 *strGender     = nil;
                        
                        NSDictionary *cGender = [genderDefinitions objectForKey:strGenderHash];
                        
                        if ([strGenderHash isEqualToString:strFKey]){
                            female = [[GenderedClassNamesByGenderHash alloc] initWithDictionary:cGender];
                            
                            if (female){
                               
                                strGender = [[GenderedClassNames class] femaleKey];
                            }
                        }
                        
                        
                        if ([strGenderHash isEqualToString:strMKey]){
                            male = [[GenderedClassNamesByGenderHash alloc] initWithDictionary:cGender];
                            
                            if (male){
                               
                                strGender =  [[GenderedClassNames class] maleKey];
                            }
                        }
                        
                        [cell.lblGuardianGender setText:strGender];
                    }
                    
                }else{
                   NSLog(@"Loading Character...");
                }
                
                break;
            }
            case 2:{
                
                vendorHash =  [self.clans objectAtIndex:indexPath.row];
                
                CLNDetail *clanDetail = (CLNDetail *) [self->destClanData objectForKey:vendorHash];
                
               
                NSString *clanName = nil,
                         *clanMotto = nil,
                         *clanBannerPath = nil,
                         *clanAvatarPath = nil,
                         *clanGroupId    = nil,
                         *clanCount      = nil;
                
                int intClanCount = 0;
                
                if (clanDetail){
                    
                        clanName = [clanDetail name];
                        clanMotto = [clanDetail motto];
                    
                        clanBannerPath = [clanDetail bannerPath];
                        clanAvatarPath = [clanDetail avatarPath];
                        
                        clanGroupId  = [NSString stringWithFormat:@"%@",clanDetail.groupId];
                    
                        intClanCount = clanDetail.memberCount;
                    
                        clanCount    = [NSString stringWithFormat:@"%d",intClanCount];
                       
                        if (clanAvatarPath){
                            baseURL  = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,clanAvatarPath];
                            imageURL = [[NSURL alloc] initWithString:baseURL];
                        }
                        
                        if (clanBannerPath){
                            clanBannerPath = [NSString stringWithFormat:@"%@%@",kBungieBaseURL,clanBannerPath];
                            emblemURL = [[NSURL alloc] initWithString:clanBannerPath];
                        }
                        
                        [cell.imgBackground setImageWithURL:emblemURL];
                        
                        [cell.imgEmblem setImageWithURL:imageURL];
                      
                        [cell.lblGuardianClass setText:@"Members#"];
                    
                   
                        [cell.lblLightLevel setText:[NSString stringWithFormat:@"   %@",clanCount]];
                      
                    
                        //[cell.lblGuardianCareer setTextColor:[UIColor whiteColor]];
                        //[cell.lblGuardianCareer setText:clanGroupId];
                        
                        [cell.lblGuardianCareer setText:[NSString stringWithFormat:@"[%@]",clanDetail.clanInfo.clanCallsign]];
                        [cell.lblGuardianGender setText:@""];
                        [cell.lblGuardianRace setText:@""];

                }
                    
                
                break;
            }
            case 1:{
                
                
                [cell.imgBackground setImage:[UIImage imageNamed:@"vaultEmblem"]];
                [cell.imgBackground setContentMode:UIViewContentModeScaleAspectFit];
                [cell.imgEmblem setHidden:YES];
                
                [cell.lblGuardianClass setText:@""];
                [cell.lblGuardianRace setText:@""];
                [cell.lblGuardianGender setText:@""];
                [cell.lblLightLevel setText:@""];
                [cell.lblGuardianCareer setText:@""];
                break;
            }
            case 3:
                
                vendorHash =  [self.destPublicVendors objectAtIndex:indexPath.row];
                
                VNDDetails *vendorDetails =  (VNDDetails*)[self->destPVendorData objectForKey:vendorHash];
                
                VNDDetailsDisplayProperties *vDisplayProps = nil;
                
                VNDDetailsGroups *vendorGroups = nil;
                
                NSString *vendorName = nil,
                         *vendorDesc = nil,
                         *vendorTitle = nil,
                         *imageName   = nil,
                         *emblem      = nil,
                         *baseURL     = nil,
                         *vendorGroup = nil;
                
                NSURL   *emblemURL     = nil,
                         *imageURL     = nil;
                
                GuardianCellTableView *cell = nil;
                
                NSIndexPath *indexPath = nil;
                
                int iVendorRow  = -1;
                
                for (int iVDX = 0; iVDX < self->destPVendorData.allKeys.count; iVDX++) {
                    
                    NSString *vendorKey = [self->destPVendorData.allKeys objectAtIndex:iVDX];
                    
                    if ([vendorKey isEqualToString:vendorHash]){
                        iVendorRow = iVDX;
                        break;
                    }
                    
                }
                
                indexPath = [NSIndexPath indexPathForRow:iVendorRow inSection:3];
                
                cell = [self.tblChars cellForRowAtIndexPath:indexPath];
                
                
                if (!cell.tag){
                    [cell setTag:[vendorHash integerValue]];
                }
                
                
                vDisplayProps = (VNDDetailsDisplayProperties*) [vendorDetails displayProperties] ;
                
                NSArray *groups = (NSArray*) [vendorDetails groups];
                
                if (groups){
                    
                    vendorGroups = (VNDDetailsGroups*) [groups firstObject];
                    
                    NSNumber *objGroupHash = [[NSNumber alloc] initWithDouble:[vendorGroups vendorGroupHash]];
                    
                    if (objGroupHash){
                     
                        if (self->appDelegate.destinyVendorGroupDefinitions){
                            NSString *strGroupHash = [NSString stringWithFormat:@"%@",[objGroupHash stringValue]];
                            
                            if (strGroupHash){
                                VendorGroupDefinition *vendorGroupDef = [appDelegate.destinyVendorGroupDefinitions
                                                                         objectForKey:strGroupHash];
                                
                                if (vendorGroupDef){
                                    vendorGroup = [vendorGroupDef categoryName];
                                    if (vendorGroup){
                                        [cell.lblGuardianRace setText:vendorGroup];
                                     
                                  
                                    }
                                }
                            }
                        }
                        
                    }
                }
                 
                if (vDisplayProps){
                    
                    vendorName = [vDisplayProps name];
                    vendorDesc = [vDisplayProps description];
                    vendorTitle = [vDisplayProps subtitle];
                    
                    
                    if (vDisplayProps.hasIcon){
                        imageName  = [vDisplayProps icon];
                        emblem = [vDisplayProps largeIcon];
                    }
                    
                    if (imageName){
                        baseURL  = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
                        imageURL = [[NSURL alloc] initWithString:baseURL];
                    }
                    
                    if (emblem){
                        emblem = [NSString stringWithFormat:@"%@%@",kBungieBaseURL,emblem];
                        emblemURL = [[NSURL alloc] initWithString:emblem];
                    }
                    
                    [cell.imgBackground setImageWithURL:emblemURL];
                    
                    [cell.imgEmblem setImageWithURL:imageURL];
                    
                    [cell.lblGuardianClass setText:vendorName];
                   
                    
                    [cell.lblGuardianCareer setHidden:NO];
                    [cell.lblGuardianCareer setText:vendorTitle];
                    
                    [cell.lblGuardianGender setText:@""];
                    [cell.lblLightLevel setText:@""];
                }

                
                
                break;
        }
        
        
    } @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
    return cell;
      
}

 
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger iRows = 0;
  
    switch (section) {
        case 0:
            
              if (self.destChars != nil){
                  iRows = self.destChars.count;
              }
              
            
            break;
            
        case 1:
            
              
            iRows = 1;
            

            
            break;
        case 2:
            
            if (self.clans != nil){
                iRows = self.clans.count;
            }
            
            break;
        case 3:
            
            if (self.destPublicVendors){
                iRows = self.destPublicVendors.count;
            }
            
            break;
    }

    return iRows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSInteger iRows = 1;
   
    
    if (self.clans){
        
        iRows = (self.clans.count > 0 ? 3 : 2);
    }
   
    if (self.destPublicVendors){
        
        if (self.destPublicVendors.count > 0){
            iRows+= 1;
        }
    }

    return iRows;
    
}

 

- (IBAction)categoryActionChanged:(UISegmentedControl *)sender {
    
    UIStoryboard *storyBoard = nil;
    
    UINavigationController *navVC = nil;
    
    WeaponsTableViewController *wVC = nil;
    
    ArmorTableViewController   *aVC = nil;
    
    ItemsViewController *iVC = nil;
    
    BOOL isVault = NO;
    
    @try {
        
        
        storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        
        switch (sender.selectedSegmentIndex) {
            case 0:
                
                wVC =   [storyBoard instantiateViewControllerWithIdentifier:@"sbWeapons"];
                
                
                if (wVC){
                   
                    
                    NSDictionary *selectedCharData =   [self->destCharData objectForKey:self->selectedCharacter];
                    
                    NSString *charFilter = [NSString stringWithFormat:@"%@_",self->selectedCharacter];
                   
                    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",charFilter];
                    
                    NSArray *filteredItems = [self->destCharWeaponsData.allKeys filteredArrayUsingPredicate:bPredicate];
                    
                    NSArray<NSDictionary *> *fItems =   [self->destCharWeaponsData objectsForKeys:filteredItems notFoundMarker:self->destCharWeaponsData];
                    
                    NSMutableDictionary *filteredCharWeaponsData = [[NSMutableDictionary alloc] initWithCapacity:fItems.count];
                    
                    if (fItems){
                        
                        
                        for(int wIdx = 0; wIdx < fItems.count; wIdx++){
                            
                            NSString *fWKey = [filteredItems objectAtIndex:wIdx];
                            
                            INVCItems *fWeapon = (INVCItems*)[fItems objectAtIndex:wIdx];
                            
                            if (fWeapon){
                                [filteredCharWeaponsData setValue:fWeapon forKey:fWKey];
                            }
                        }
                        
                    }
                   
                    //Passing already filtered weapons for selected char
                    [wVC setDestWeapons:filteredCharWeaponsData];
                    [wVC setSelectedCharData:selectedCharData];
                    [wVC setDestChars:self->destCharData];
                    [wVC setDestWeaponBuckets:self->weaponsArray];
                    [wVC setSelectedChar:self->selectedCharacter];
                    [wVC setSelectedCharEmblem:self->selectedCharEmblem];
                    [wVC setParentVC:self];
                    [wVC loadWeapons];
                    
                    navVC = [[UINavigationController alloc] initWithRootViewController:wVC];
                    
                    [self presentViewController:navVC
                                       animated:YES completion:^{
                        
                        [sender setSelectedSegmentIndex:-1];
                        
                    }];
                }
                break;
            case 1:
                
                aVC =   [storyBoard instantiateViewControllerWithIdentifier:@"sbArmor"];
                
                
                if (aVC){
                    
                    NSDictionary *selectedCharData =   [self->destCharData objectForKey:self->selectedCharacter];
                    
                    NSString *charFilter = [NSString stringWithFormat:@"%@_",self->selectedCharacter];
                   
                    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",charFilter];
                    
                    NSArray *filteredItems = [self->destCharArmorData.allKeys filteredArrayUsingPredicate:bPredicate];
                    
                    NSArray<NSDictionary *> *fItems =   [self->destCharArmorData objectsForKeys:filteredItems
                                                                                 notFoundMarker:self->destCharArmorData];
                    
                    NSMutableDictionary *filteredCharArmorData = [[NSMutableDictionary alloc] initWithCapacity:fItems.count];
                    
                    if (fItems){
                        
                        
                        for(int wIdx = 0; wIdx < fItems.count; wIdx++){
                            
                            NSString *fWKey = [filteredItems objectAtIndex:wIdx];
                            
                            INVCItems *fWeapon = (INVCItems*)[fItems objectAtIndex:wIdx];
                            
                            if (fWeapon){
                                [filteredCharArmorData setValue:fWeapon forKey:fWKey];
                            }
                        }
                        
                    }
                    
                    [aVC setDestArmor:filteredCharArmorData];
                    [aVC setDestChars:self->destCharData];
                    [aVC setDestArmorBuckets:self->armorArray];
                    [aVC setSelectedChar:self->selectedCharacter];
                    [aVC setSelectedCharEmblem:self->selectedCharEmblem];
                    [aVC setParentVC:self];
                    [aVC loadArmor];
                    
                    navVC = [[UINavigationController alloc] initWithRootViewController:aVC];
                    
                    [self presentViewController:navVC
                                       animated:YES completion:^{
                        
                        [sender setSelectedSegmentIndex:-1];
                        
                    }];
                }
                
                break;
            case 2://General
                
                iVC =   [storyBoard instantiateViewControllerWithIdentifier:@"sbVendors"];
                
                if (iVC){
                   
 
                    NSString *charFilter = [NSString stringWithFormat:@"%@_",self->selectedCharacter];
                   
                    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",charFilter];
                    
                    NSArray *filteredItems = [self->destCharGeneralData.allKeys filteredArrayUsingPredicate:bPredicate];
                    
                    NSArray<NSDictionary *> *fItems =   [self->destCharGeneralData objectsForKeys:filteredItems notFoundMarker:self->destCharGeneralData];
                    
                    NSMutableDictionary *filteredCharItemsData = [[NSMutableDictionary alloc] initWithCapacity:fItems.count];
                    
                    if (fItems){
                        
                        
                        for(int wIdx = 0; wIdx < fItems.count; wIdx++){
                            
                            NSString *fWKey = [filteredItems objectAtIndex:wIdx];
                            
                            INVCItems *fWeapon = (INVCItems*)[fItems objectAtIndex:wIdx];
                            
                            if (fWeapon){
                                [filteredCharItemsData setValue:fWeapon forKey:fWKey];
                            }
                        }
                        
                    }
                    
                    [iVC setSelectedChar:self->selectedCharacter];
                    [iVC setDestVaultItems:self->destVaultData];
                    [iVC setDestVaultItemsBuckets:self->vaultArray];
                    [iVC setIsVaultItems:NO];
                    [iVC setDestEquippedItems:filteredCharItemsData];
                    [iVC setDestEquippedItemsBuckets:self->generalArray];
                    [iVC setDestChars:self->destCharData];
                    [iVC setSelectedCharEmblem:self->selectedCharEmblem];
                    [iVC setParentVC:self];
                    [iVC loadItems];
                   
                    navVC = [[UINavigationController alloc] initWithRootViewController:iVC];
                    
                    [self presentViewController:navVC
                                       animated:YES completion:^{
                        
                        [sender setSelectedSegmentIndex:-1];
                        
                    }];
                }
                
                
                break;
            case 3://Postmaster
                
                iVC =   [storyBoard instantiateViewControllerWithIdentifier:@"sbVendors"];
                
                if (iVC){
                   
 
                    NSString *charFilter = [NSString stringWithFormat:@"%@_",self->selectedCharacter];
                   
                    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",charFilter];
                    
                    NSArray *filteredItems = [self->destCharPostmasterData.allKeys filteredArrayUsingPredicate:bPredicate];
                    
                    NSArray<NSDictionary *> *fItems =   [self->destCharPostmasterData objectsForKeys:filteredItems notFoundMarker:self->destCharPostmasterData];
                    
                    NSMutableDictionary *filteredCharItemsData = [[NSMutableDictionary alloc] initWithCapacity:fItems.count];
                    
                    if (fItems){
                        
                        
                        for(int wIdx = 0; wIdx < fItems.count; wIdx++){
                            
                            NSString *fWKey = [filteredItems objectAtIndex:wIdx];
                            
                            INVCItems *fWeapon = (INVCItems*)[fItems objectAtIndex:wIdx];
                            
                            if (fWeapon){
                                [filteredCharItemsData setValue:fWeapon forKey:fWKey];
                            }
                        }
                        
                    }
                    
                    [iVC setSelectedChar:self->selectedCharacter];
                    [iVC setDestVaultItems:self->destVaultData];
                    [iVC setDestVaultItemsBuckets:self->vaultArray];
                    [iVC setIsVaultItems:NO];
                    [iVC setDestEquippedItems:filteredCharItemsData];
                    [iVC setDestEquippedItemsBuckets:self->postMasterArray];
                    [iVC setDestChars:self->destCharData];
                    [iVC setSelectedCharEmblem:self->selectedCharEmblem];
                    [iVC setParentVC:self];
                    [iVC loadLostItems];
                    
                    navVC = [[UINavigationController alloc] initWithRootViewController:iVC];
                    
                    [self presentViewController:navVC
                                       animated:YES completion:^{
                        
                        [sender setSelectedSegmentIndex:-1];
                        
                    }];
                }
                
                
                break;
            case 4://Inventory
                
                iVC =   [storyBoard instantiateViewControllerWithIdentifier:@"sbVendors"];
                
                if (iVC){
                   
 
                    NSString *charFilter = [NSString stringWithFormat:@"%@_",self->selectedCharacter];
                   
                    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",charFilter];
                    
                    NSArray *filteredItems = nil;
                    NSArray<NSDictionary *> *fItems = nil;
                    
                    if ([self->selectedCharacter isEqualToString:kDestinyVaultHash]){
                        
                        filteredItems =  [self->destVaultData.allKeys filteredArrayUsingPredicate:bPredicate];
                        
                        fItems =   [self->destVaultData objectsForKeys:filteredItems
                                                                notFoundMarker:self->destVaultData];
                        isVault = YES;
                        
                    }else{
                        filteredItems =  [self->destCharInventoryData.allKeys filteredArrayUsingPredicate:bPredicate];
                        fItems =   [self->destCharInventoryData objectsForKeys:filteredItems
                                                                notFoundMarker:self->destCharInventoryData];
                    }
                    
                    
                    NSMutableDictionary *filteredCharItemsData = [[NSMutableDictionary alloc] initWithCapacity:fItems.count];
                    
                    if (fItems){
                        
                        
                        for(int wIdx = 0; wIdx < fItems.count; wIdx++){
                            
                            NSString *fWKey = [filteredItems objectAtIndex:wIdx];
                            
                            INVCItems *fWeapon = (INVCItems*)[fItems objectAtIndex:wIdx];
                            
                            if (fWeapon){
                                [filteredCharItemsData setValue:fWeapon forKey:fWKey];
                            }
                        }
                        
                    }
                    
                    if (isVault){
                        
                        [iVC setSelectedChar:self->selectedCharacter];
                        [iVC setDestVaultItems:self->destVaultData];
                        [iVC setDestVaultItemsBuckets:self->vaultArray];
                        [iVC setIsVaultItems:YES];
                        [iVC setDestEquippedItems:filteredCharItemsData];
                        [iVC setDestEquippedItemsBuckets:self->invArray];
                        [iVC setDestChars:self->destCharData];
                        [iVC setSelectedCharEmblem:self->selectedCharEmblem];
                        [iVC setParentVC:self];
                        [iVC loadVaultItems];
                        
                    }else{
                    
                        [iVC setSelectedChar:self->selectedCharacter];
                        [iVC setDestVaultItems:self->destVaultData];
                        [iVC setDestVaultItemsBuckets:self->vaultArray];
                        [iVC setIsVaultItems:NO];
                        [iVC setDestEquippedItems:self->destCharInventoryData];
                        [iVC setDestEquippedItemsBuckets:self->invArray];
                        [iVC setDestChars:self->destCharData];
                        [iVC setSelectedCharEmblem:self->selectedCharEmblem];
                        [iVC setParentVC:self];
                        [iVC loadInventories];
                    }
                    
                    navVC = [[UINavigationController alloc] initWithRootViewController:iVC];
                    
                    [self presentViewController:navVC
                                       animated:YES completion:^{
                        
                        [sender setSelectedSegmentIndex:-1];
                        
                    }];
                }
                
                
                break;
        }
        
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        wVC = nil;
        aVC = nil;
        storyBoard = nil;
    }
    
    
}

- (IBAction)closeAction:(UIBarButtonItem *)sender {
    
    
    [self dismissViewControllerAnimated:NO completion:nil];
    NSLog(@"GuardianViewController:closeAction:Invoked...");

    
}
@end
