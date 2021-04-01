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
#import "DataModels.h"
#import "Constants.h"
#import "GuardianCellTableView.h"
#import "Utilities.h"
#import "INVDDestinyInventoryBaseClass.h"
#import "WeaponsTableViewController.h"
#import "ArmorTableViewController.h"

@interface GuardianViewController ()
{
    AppDelegate *appDelegate;
    
    NSMutableDictionary *destCharData,
                        *destPVendorData,
                        *destCharWeaponsData,
                        *destCharArmorData;
    
    NSString *currentMembership,
             *selectedCharacter;
    
    NSArray *weaponsArray,
            *armorArray;
    
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    appDelegate = [AppDelegate currentDelegate];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    [self registerNotifications];
    
    [self initTableView];
    
    [self loadCharacters];
    [self loadPublicVendors];
    [self loadCharacterInventories];

  
}
 

-(void) registerNotifications{
    
    if (! self->destCharWeaponsData){
        self->destCharWeaponsData = [[NSMutableDictionary alloc] init];
    }
    if (! self->destCharArmorData){
        self->destCharArmorData   = [[NSMutableDictionary alloc] init];
    }
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedCharacterEquipmentNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        
        NSMutableDictionary *cEquip  = (NSMutableDictionary*) [note object];
        
        NSDictionary *userInfo = [note userInfo];
        
        NSString *currentCharacter    = nil,
                 *currentstrCharIndex = nil;
        
        if (!self->weaponsArray){
             self->weaponsArray = [[NSArray alloc] initWithObjects:@"1498876634",@"2465295065",@"953998645",nil];
        }
        if (! self->armorArray){
             self->armorArray   = [[NSArray alloc] initWithObjects:@"3448274439",@"3551918588",@"14239492",@"20886954",@"1585787867", nil];
        }
        
        if (userInfo){
            
            currentCharacter = [userInfo objectForKey:@"CurrentCharacter"];
            currentstrCharIndex =  [userInfo objectForKey:@"CurrentCharacterIndex"];
            
                
               if (cEquip){
                   
                   INVCData *data = [[INVCData alloc] initWithDictionary: [cEquip objectForKey:@"data"]];
                   
                   if (data){
                       
                       NSArray *items = (NSArray*)[data items];
                       
                       if (items){
                           
                           for (INVCItems *item in items) {
                               
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
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Primary Weapon...",strFullKey);
                                       }
                                     
                                       
                                       break;
                                   case 2465295065://Energy
                                       if (![self->destCharWeaponsData.allKeys containsObject:strFullKey]){
                                           [self->destCharWeaponsData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Energy Weapon...",strFullKey);
                                       }
                                       
                                       break;
                                   case 953998645://Heavy
                                       if (![self->destCharWeaponsData.allKeys containsObject:strFullKey]){
                                           [self->destCharWeaponsData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Heavy Weapon...",strFullKey);
                                       }
                                       
                                       break;
                                       
                                   case 3448274439://Helmet
                                       if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                                           [self->destCharArmorData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Helmet Armor...",strFullKey);
                                       }
                                       break;
                                   case 3551918588://Gauntlets
                                       
                                       if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                                           [self->destCharArmorData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Gloves Armor...",strFullKey);
                                       }
                                       break;
                                   case 14239492://Chest
                                       if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                                           [self->destCharArmorData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Chest Weapon...",strFullKey);
                                       }
                                       
                                       break;
                                   case 20886954://Legs
                                       
                                       if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                                           [self->destCharArmorData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Legs Armor...",strFullKey);
                                       }
                                       
                                       break;
                                   case  1585787867://Class Armor
                                       
                                       if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                                           [self->destCharArmorData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterEquipmentNotification:%@ Class Armor...",strFullKey);
                                       }
                                       break;
                                       
                               }
                               
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
        
        if (!self->weaponsArray){
             self->weaponsArray = [[NSArray alloc] initWithObjects:@"1498876634",@"2465295065",@"953998645",nil];
        }
        if (! self->armorArray){
             self->armorArray   = [[NSArray alloc] initWithObjects:@"3448274439",@"3551918588",@"14239492",@"20886954",@"1585787867", nil];
        }
        
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
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterInventoryNotification:%@ Primary Weapon...",strFullKey);
                                       }
                                     
                                       
                                       break;
                                   case 2465295065://Energy
                                       if (![self->destCharWeaponsData.allKeys containsObject:strFullKey]){
                                           [self->destCharWeaponsData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterInventoryNotification:%@ Energy Weapon...",strFullKey);
                                       }
                                       
                                       break;
                                   case 953998645://Heavy
                                       if (![self->destCharWeaponsData.allKeys containsObject:strFullKey]){
                                           [self->destCharWeaponsData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterInventoryNotification:%@ Heavy Weapon...",strFullKey);
                                       }
                                       
                                       break;
                                       
                                   case 3448274439://Helmet
                                       if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                                           [self->destCharArmorData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterInventoryNotification:%@ Helmet Armor...",strFullKey);
                                       }
                                       break;
                                   case 3551918588://Gauntlets
                                       
                                       if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                                           [self->destCharArmorData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterInventoryNotification:%@ Gloves Armor...",strFullKey);
                                       }
                                       break;
                                   case 14239492://Chest
                                       if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                                           [self->destCharArmorData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterInventoryNotification:%@ Chest Weapon...",strFullKey);
                                       }
                                       
                                       break;
                                   case 20886954://Legs
                                       
                                       if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                                           [self->destCharArmorData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterInventoryNotification:%@ Legs Armor...",strFullKey);
                                       }
                                       
                                       break;
                                   case  1585787867://Class Armor
                                       
                                       if (![self->destCharArmorData.allKeys containsObject:strFullKey]){
                                           [self->destCharArmorData setValue:item forKey:strFullKey];
                                           NSLog(@"GuardianViewController:kDestinyLoadedCharacterInventoryNotification:%@ Class Armor...",strFullKey);
                                       }
                                       break;
                                       
                               }
                               
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
            
            if (![self->destCharData.allKeys containsObject:currentCharacter]){
                
                [self->destCharData setValue:cData forKey:currentCharacter];
                NSLog(@"GuardianViewController:kDestinyLoadedCharacterNotification:%@ Processing...",currentCharacter);
                
            }
            else{
                NSLog(@"GuardianViewController:kDestinyLoadedCharacterNotification:%@ Character already loaded...",currentCharacter);
            }
            
            
                [self.tblChars performBatchUpdates:^(void){
                    
                    NSArray<NSIndexPath*> *iPaths =  [self.tblChars indexPathsForVisibleRows];
              
                    NSIndexPath *currentIPath = nil;
                    
                    GuardianCellTableView *cell = nil;
                    
                    NSInteger iCharIDX = [currentstrCharIndex integerValue];
                    
                    if (iPaths){
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
                                
                                    [self.tblChars beginUpdates];
                                    
                                    [cell setTag:iCharIDX];
                                  
                                    NSDictionary *grd = [cData objectForKey:@"character"],
                                                 *equip = [cData objectForKey:@"equipment"],
                                                 *grdData  = nil;
                                    
                                   
                                    grdData = [grd objectForKey:@"data"];
                                     
                                    
                                    if (grdData){
                                    
                                        classHash  = [grdData objectForKey:@"classHash"];
                                        genderHash = [grdData objectForKey:@"genderHash"];
                                        raceHash = [grdData objectForKey:@"raceType"];
                                         
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
                                    
                                [self.tblChars endUpdates];
                             }
                                
                            }
                            @catch (NSException *exception) {
                                NSLog(@"GuardianViewController:kDestinyLoadedCharacterNotification:Loading Char Exception->%@",exception.description);
                            }
                        }
                    }
                    

                    
                }
                completion:^(BOOL finished) {
                   NSLog( @"GuardianViewController:kDestinyLoadedCharacterNotification:LoadingChar[%@]Completed!",currentCharacter);
                }];
                
        }
        
    }];
    
 
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedPublicVendorsDetailsNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        NSLog(@"GuardianViewController:kDestinyLoadedPublicVendorsDetailsNotification:Invoked...");
        
        NSDictionary *userInfo = [note userInfo];
        
        NSMutableDictionary *publicVendorData = (NSMutableDictionary*) [note object];
        
        NSString *publicVendorHash = [userInfo objectForKey:@"CurrentPublicVendorHash"];
        
        if (![self->destPVendorData.allKeys containsObject:publicVendorHash]){
            
            [self->destPVendorData setValue:publicVendorData forKey:publicVendorHash];
            NSLog(@"GuardianViewController:kDestinyLoadedPublicVendorsDetailsNotification:%@ Processing...",publicVendorHash);
        }
        else{
            NSLog(@"GuardianViewController:kDestinyLoadedPublicVendorsDetailsNotification:%@ already loaded...",publicVendorHash);
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
                    
                    indexPath = [NSIndexPath indexPathForRow:iVendorRow inSection:1];
                    
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
                                            [cell.lblGuardianCareer setHidden:NO];
                                            [cell.lblGuardianCareer setText:vendorGroup];
                                      
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
                        [cell.lblGuardianRace setText:vendorTitle];
                        [cell.lblGuardianGender setText:@""];
                        [cell.lblLightLevel setText:@""];
                    }
                    
                 }
                
            }completion:^(BOOL finished) {
                if (finished){
                 NSLog(@"GuardianViewController:kDestinyLoadedPublicVendorsDetailsNotification:Completed for->%@",publicVendorHash);
                }
            }];
       
    }];
    
  
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedPublicVendorsNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        NSLog(@"GuardianViewController:kDestinyLoadedPublicVendorsNotification:Invoked...");
        
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
 
  
}

-(void) loadPublicVendorsDetails{
    
   
    MBRDestinyMemberships *membership = nil;
    
    VNDBaseClass* vendorBase = nil;
    
    NSDictionary *vendorResponse = nil,
                 *vendors        = nil,
                 *vendorsData    = nil,
                 *vendorData     = nil;
    
    
    NSArray *vendorKeys = nil;
    
    
    NSString *message    = @"1:GuardianViewController:loadPublicVendorsDetails called...",
             *vendorKey  = nil,
             *vendorHash = nil;
    
    @try {
        
        
        NSLog(@"%@",message);
        if (! self.memberships){
            message   = @"2:GuardianViewController:loadPublicVendorsDetails:Getting Membership Detail from Delegate...";
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
                
            NSLog(@"GuardianViewController:loadPublicVendorsDetails:%d[%@]",iVendors,message);
                
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
                    NSLog(@"loadCharacters:loadPublicVendorsDetails:getVendor:Exception->%@",exception.description);
                }];
                   
            
         }
      
        
    } @catch (NSException *exception) {
        NSLog(@"loadCharacters:loadPublicVendorsDetails:getVendor:Exception->%@",exception.description);
    } @finally {
        
    }
    
    
}

-(void) loadPublicVendors{
    
    
    NSString *message   = @"2:GuardianViewController:loadPublicVendors called...";
    
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
    
}

-(void) loadCharacterInventories{
 
    NSString *message   = @"1:GuardianViewController:loadCharacterInventories called...";
    
    MBRDestinyMemberships *membership = nil;
    
    @try {
        NSLog(@"%@",message);
        if (! self.memberships){
            message   = @"2:GuardianViewController:loadCharacterInventories:Getting Membership Detail from Delegate...";
            NSLog(@"%@",message);
            self.memberships = (NSArray *) [appDelegate destinyMemberships];
        }
        
        membership = (MBRDestinyMemberships *) [self.memberships objectAtIndex:0];
        
        if (! self->currentMembership){
            self->currentMembership  = membership.membershipId;
        }
      
        if (! destCharData){
            message   = @"3:GuardianViewController:loadCharacterInventories:Getting Characters Detail from Delegate...";
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
            
            NSLog(@"GuardianViewController:loadCharacterInventories:%d[%@]",iChars,message);
            
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
                   NSLog(@"loadCharacters:NetworkAPISingleClient:getCharacter:Exception->%@",exception.description);
               }];
               
            
        }
        
      
        
    } @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
    
}

 
-(void) loadCharacters{
 
    NSString *message   = @"1:GuardianViewController:loadCharacters called...";
    
    MBRDestinyMemberships *membership = nil;
    
    @try {
        NSLog(@"%@",message);
        if (! self.memberships){
            message   = @"2:GuardianViewController:loadCharacters:Getting Membership Detail from Delegate...";
            NSLog(@"%@",message);
            self.memberships = (NSArray *) [appDelegate destinyMemberships];
        }
        
        membership = (MBRDestinyMemberships *) [self.memberships objectAtIndex:0];
        
        if (! self->currentMembership){
            self->currentMembership  = membership.membershipId;
        }
      
        if (! destCharData){
            message   = @"3:GuardianViewController:loadCharacters:Getting Characters Detail from Delegate...";
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
            
            NSLog(@"GuardianViewController:loadCharacters:%d[%@]",iChars,message);
            
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
                   NSLog(@"loadCharacters:NetworkAPISingleClient:getCharacter:Exception->%@",exception.description);
               }];
               
            
        }
        
      
        
    } @catch (NSException *exception) {
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
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSInteger iRow =  [indexPath row];
    
    @try {
        
        self->selectedCharacter = [self.destChars objectAtIndex:iRow];
        
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
            
            [selectedCell.layer setMasksToBounds:YES];
            [selectedCell.layer setCornerRadius:5];
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
        NSInteger size = 100.0f;
     
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
   // return CGFLOAT_MIN;
    NSInteger size = CGFLOAT_MIN;
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSInteger size = 30;
    
    return size;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UILabel *header = nil;
        header = [[UILabel alloc] init];
        [header setFont:[UIFont fontWithName:@"Avenir Medium" size:20]];
        [header setTextAlignment:NSTextAlignmentLeft];
        [header setTextColor:[UIColor systemOrangeColor]];
        [header setBackgroundColor:[UIColor blackColor]];
        switch (section) {
            case 0:
                [header setText:@"Characters"];
                break;
            case 1:
                [header setText:@"Public Vendors"];
                break;
            }
        return header;
    
}

-(void) initTableView{
    
    NSString *message = nil;
    @try {
        
        
        if (! self.tblChars){
            self.tblChars = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f,self.view.frame.size.width, self.view.frame.size.height)];
            
            self.tblChars.contentInset = UIEdgeInsetsMake(0, 0, self.view.frame.size.height -20, 0);
            
            [self.view addSubview:self.tblChars];
            [self.tblChars setBackgroundColor:[UIColor blackColor]];
        }
        
        [self.tblChars registerNib:[UINib nibWithNibName:@"GuardianCellTableView"
                                                  bundle:nil]
            forCellReuseIdentifier:@"GuardianCellTableView"];
         
        
        [self.tblChars setDelegate:self];
        [self.tblChars setDataSource:self];
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
    
    int section = indexPath.section;
     
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
            case 0:
                
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
                
            case 1:
                
                /*
                 po vendorDetails.displayProperties
                 {
                     description = "A peddler of strange curios, X\U00fbr's motives are not his own. He bows to his distant masters, the Nine.";
                     hasIcon = 1;
                     icon = "/common/destiny2_content/icons/5659e5fc95912c079962376dfe4504ab.png";
                     largeIcon = "/common/destiny2_content/icons/801c07dc080b79c7da99ac4f59db1f66.jpg";
                     largeTransparentIcon = "/img/destiny_content/vendor/icons/xur_large_icon.png";
                     mapIcon = "/img/destiny_content/vendor/icons/xur_map_icon.png";
                     name = "X\U00fbr";
                     originalIcon = "/common/destiny2_content/icons/5659e5fc95912c079962376dfe4504ab.png";
                     requirementsDisplay =     (
                     );
                     smallTransparentIcon = "/img/destiny_content/vendor/icons/xur_small_icon.png";
                     subtitle = "Agent of the Nine";
                 }
                 
                 */
                
                if (cell.tag){
                    NSLog(@"Vendor Already loaded...");
                    return cell;
                }
                
                /*vendorHash =  [self.destPublicVendors objectAtIndex:indexPath.row];
                
                VNDDetails *vendorDetails =  (VNDDetails*)[destPVendorData objectForKey:vendorHash];
                
                VNDDetailsDisplayProperties *vDisplayProps = nil;
                
                NSString *vendorName = nil,
                         *vendorDesc = nil,
                         *vendorTitle = nil;
                
                
                
                if (vendorDetails){
                    vDisplayProps = (VNDDetailsDisplayProperties*) [vendorDetails displayProperties] ;
                    
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
                        [cell.lblGuardianRace setText:vendorTitle];
                        [cell.lblGuardianGender setText:@""];
                        [cell.lblLightLevel setText:@""];
                    }
                    
                 }
                
                */
                
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
            
              
              if (self.destPublicVendors != nil){
                  iRows = self.destPublicVendors.count;
              }
            

            
            break;
    }

    return iRows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSInteger iRows = 1;
    
    BOOL pVendorsLoaded = [appDelegate isPublicVendorsLoaded];
    
    iRows = (pVendorsLoaded ? 2 : 1);

    return iRows;
    
}

 

- (IBAction)categoryActionChanged:(UISegmentedControl *)sender {
    
    UIStoryboard *storyBoard = nil;
    
    UINavigationController *navVC = nil;
    
    WeaponsTableViewController *wVC = nil;
    
    ArmorTableViewController   *aVC = nil;
    
    @try {
        
        
        storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        
        switch (sender.selectedSegmentIndex) {
            case 0:
                
                wVC =   [storyBoard instantiateViewControllerWithIdentifier:@"sbWeapons"];
                
             
                
                if (wVC){
                   
                   
                    [wVC setDestWeapons:self->destCharWeaponsData];
                    [wVC setDestWeaponBuckets:self->weaponsArray];
                    [wVC setSelectedChar:self->selectedCharacter];
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
                    [aVC setDestArmor:self->destCharArmorData];
                    [aVC setDestArmorBuckets:self->armorArray];
                    [aVC setSelectedChar:self->selectedCharacter];
                    [aVC loadArmor];
                    [self presentViewController:aVC
                                       animated:YES completion:^{
                        
                        [sender setSelectedSegmentIndex:-1];
                        
                    }];
                }
                
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
