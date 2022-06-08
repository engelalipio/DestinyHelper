//
//  ItemCellTableView.m
//  DestinyHelper
//
//  Created by Bertle on 10/14/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import "ItemCellTableView.h"
#import "Utilities.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "NetworkAPISingleClient+LinkedProfiles.h"
#import "NetworkAPISingleClient+Definition.h"
#import "ItemsViewController.h"
#import "WeaponsTableViewController.h"
#import "ArmorTableViewController.h"

@implementation ItemCellTableView

@synthesize imgItem = _imgItem;
@synthesize imgBackground = _imgBackground;
@synthesize lblItemName = _lblItemName;
@synthesize lblDamageType = _lblDamageType;
@synthesize lblPowerLevel = _lblPowerLevel;
@synthesize lblItemType = _lblItemType;
@synthesize lblMisc = _lblMisc;
@synthesize imgCareer = _imgCareer;
@synthesize parentTableView = _parentTableView;
@synthesize parentViewController = _parentViewController;
@synthesize imgItemBurn = _imgItemBurn;
@synthesize imgCrafted = _imgCrafted;
@synthesize imgMaster = _imgMaster;
+ (id)instanceFromNib
{
    NSString *className = @"ItemCellTableView";
    
    return [self instanceFromNibWithName:className];
}


+ (id)instanceFromNibWithName:(NSString *)nibName
{
    return [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] objectAtIndex:0];
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGRect cFrame = self.contentView.frame;
        
        CGSize size = self.contentView.frame.size;
        
    
        
        if (! self.imgItem){
              UIImage *defaultImage = [UIImage imageNamed:@"WeaponFrame.png"];
            
              defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(75, 75)];
              
              self.imgItem = [[UIImageView alloc] initWithImage:defaultImage];
              
              //[self.imgEmblem setFrame:cFrame];
            
              
              
              [self.contentView addSubview:self.imgItem];
          }
        
        if (! self.imgBackground){
              UIImage *defaultImage = [UIImage imageNamed:@"primaryAmmo.png"];
            
              defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(30, 25)];
              
              self.imgBackground = [[UIImageView alloc] initWithImage:defaultImage];
              
              //[self.imgEmblem setFrame:cFrame];
              
              [self.contentView addSubview:self.imgBackground];
          }
        
        if (! self.imgCrafted){
              UIImage *defaultImage = [UIImage imageNamed:@"crafter.png"];
            
              defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(20, 20)];
              
              self.imgCrafted = [[UIImageView alloc] initWithImage:defaultImage];
              
              [self.contentView addSubview:self.imgCrafted];
          }
        
        if (! self.imgItemBurn){
              UIImage *defaultImage = [UIImage imageNamed:@"damage_kinetic.png"];
            
              defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(30, 25)];
              
              self.imgItemBurn = [[UIImageView alloc] initWithImage:defaultImage];
              
              //[self.imgEmblem setFrame:cFrame];
              
              [self.contentView addSubview:self.imgItemBurn];
          }
        
        
        if (! self.btnSendVault){
            
            UIImage *defaultImage =  [UIImage systemImageNamed:@"archivebox.circle"];
            
            defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(20  , 20)];
            
            [self.btnSendVault setImage:defaultImage forState:UIControlStateNormal];
            
            [self.contentView addSubview:self.btnSendVault];
        }
                
        if (! self.btnLockAction){
            
            UIImage *defaultImage =  [UIImage systemImageNamed:@"lock"];
            
            defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(20  , 20)];
            
            [self.btnLockAction setImage:defaultImage forState:UIControlStateNormal];
            
              [self.contentView addSubview:self.btnLockAction];
          }
          
        
      /*if (! self.imgBackground){
            UIImage *defaultImage = [UIImage imageNamed:@"DefaultEmblem.png"];
            
            self.imgBackground = [[UIImageView alloc] initWithImage:defaultImage];
            
            [self.imgBackground setFrame:cFrame];
            
            [self.contentView addSubview:self.imgBackground];
        }*/
        
        if (! self.imgCareer){
              UIImage *defaultImage = [UIImage imageNamed:@"Factions.png"];
            
              defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(35,size.height)];
            
              self.imgCareer = [[UIImageView alloc] initWithImage:defaultImage];
              
              //[self.imgCareer setFrame:cFrame];
              
              [self.contentView addSubview:self.imgCareer];
          }
        
        if (! self.imgMaster){
              UIImage *defaultImage = [UIImage imageNamed:@"weaponMaster.png"];
            
              defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(75,75)];
            
              self.imgMaster = [[UIImageView alloc] initWithImage:defaultImage];
              
              [self.imgMaster setFrame:cFrame];
              [self.imgMaster setHidden:YES];
              [self.contentView addSubview:self.imgCareer];
          }
        
        if (! self.lblItemName){
            
            self.lblItemName = [[UILabel alloc] init];
            [self.lblItemName setTextColor:[UIColor whiteColor]];
            [self.lblItemName setText:@""];
            
          
            [self.lblItemName setFont:[UIFont fontWithName:kDefaultFontName
                                                      size:self.lblItemName.font.pointSize]];
            
            
            [self.contentView addSubview:self.lblItemName];
        }
        
        if (! self.lblItemType){
            
            self.lblItemType = [[UILabel alloc] init];
            [self.lblItemType setTextColor:[UIColor darkGrayColor]];
            [self.lblItemType setText:@""];
            
            [self.lblItemType setFont:[UIFont fontWithName:kDefaultFontName
                                                      size:self.lblItemType.font.pointSize]];
            
            [self.contentView addSubview:self.lblItemType];
        }
        
        if (! self.lblDamageType){
            
            self.lblDamageType = [[UILabel alloc] init];
            [self.lblDamageType setTextColor:[UIColor lightGrayColor]];
            [self.lblDamageType setText:@""];
            
            [self.lblDamageType setFont:[UIFont fontWithName:kDefaultFontName
                                                      size:self.lblDamageType.font.pointSize]];
            
            [self.contentView addSubview:self.lblDamageType];
        }
        
        
        if (! self.lblPowerLevel){
            
            self.lblPowerLevel = [[UILabel alloc] init];
            [self.lblPowerLevel setTextColor:[UIColor yellowColor]];
            [self.lblPowerLevel setText:@""];
            
            [self.lblPowerLevel setFont:[UIFont fontWithName:kDefaultFontName
                                                      size:self.lblPowerLevel.font.pointSize]];
            
            [self.contentView addSubview:self.lblPowerLevel];
        }
        
        if (! self.lblMisc){
            
            self.lblMisc = [[UILabel alloc] init];
            [self.lblMisc setHidden:YES];
            [self.lblMisc setText:@""];
            
            [self.contentView addSubview:self.lblMisc];
        }
        
        if (! self.lblHash){
            
            self.lblHash = [[UILabel alloc] init];
            [self.lblHash setHidden:YES];
            [self.lblHash setText:@""];
            
            
            [self.contentView addSubview:self.lblHash];
        }
        
        if (! self.lblInstanceId){
            
            self.lblInstanceId = [[UILabel alloc] init];
            [self.lblInstanceId setHidden:YES];
            [self.lblInstanceId setText:@""];
            
            [self.contentView addSubview:self.lblInstanceId];
        }
        
        if (! self.lblCharacterId){
            
            self.lblCharacterId = [[UILabel alloc] init];
            [self.lblCharacterId setHidden:YES];
            [self.lblCharacterId setText:@""];
            
            [self.contentView addSubview:self.lblCharacterId];
        }
        
        
    }
    return self;
}
  


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size    = size;
    self.frame    = CGRectIntegral(frame);
}

- (IBAction)pullFromPostMaster:(id)sender{
    
    NSString *selectedTitle        = @"",
             *selectedItemHash     = @"",
             *selectedItemInstance = @"",
             *selectedCharacter    = @"",
             *vaultAction          = @"Pull from PostMaster",
             *strIdx               = @"";
    
    ItemCellTableView *selectedCell = nil;
    
    ItemsViewController *destinyItemsParentVC = nil;
    
    AppDelegate *appDelegate = nil;
    
    
    UIImage *lockImage = [UIImage systemImageNamed:@"lock"];
    
    NSIndexPath *indexPath = nil;
    @try {
        
        if (! self.parentTableView){
            return;
        }
        
        if ([self.parentTableView isKindOfClass:[UITableView class]]){
            indexPath =  [self.parentTableView indexPathForSelectedRow];
            
                if (! indexPath){
                    return;
                }
            
            strIdx = [NSString stringWithFormat:@"%d",indexPath.row ];
        }
        
        if (! self.parentViewController){
            return;
        }
        
        if ([self.parentViewController isKindOfClass:[ItemsViewController class]]){
          destinyItemsParentVC = (ItemsViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[WeaponsTableViewController class]]){
          destinyItemsParentVC = (WeaponsTableViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[ArmorTableViewController class]]){
          destinyItemsParentVC = (ArmorTableViewController*) self.parentViewController;
        }
        
        if (!appDelegate){
            appDelegate = [AppDelegate currentDelegate];
        }
        
        selectedCell = (ItemCellTableView*) [self.parentTableView cellForRowAtIndexPath:indexPath];
       
        if(selectedCell){
            
            selectedTitle = selectedCell.lblItemName.text;
            
            selectedItemHash = [selectedCell.lblHash text];
            
            selectedItemInstance = [selectedCell.lblInstanceId text];
            
            selectedCharacter  = [selectedCell.lblCharacterId text];
            
  
            if (selectedItemHash){
                
            
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:vaultAction
                                               message:[NSString stringWithFormat:@"Pull %@ from PostMaster?",selectedTitle]
                                               preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                   handler:^(UIAlertAction * action) {
                    NSLog(vaultAction);
                    
                    
                    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyPullFromPostMasterNotification
                        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                        
                        
                        NSDictionary *respData  = (NSDictionary*) [note object],
                                     *userInfo  = [note userInfo];
                        
                        
                        if (respData){
                         
                            NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                            
                            if (respStatus){
                                //SendToVault Action was Successfull!
                                if ([respStatus isEqualToString:@"Success"]){
                                    
                                    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Pull from PostMaster Action"
                                                                   message:@"Pull from PostMaster Action was Successfull!"
                                                                   preferredStyle:UIAlertControllerStyleAlert];
                                    
                                    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action) {
                                        NSLog(@"%@-",respStatus);
                                        
                                    
                                        if (destinyItemsParentVC){
                                            
                                            if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                                ItemsViewController *destinyItemParentVC = (ItemsViewController*) destinyItemsParentVC;
                                                [destinyItemParentVC refreshItems:selectedItemHash];
                                            }
                                            
                                            if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                                WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                                if (destinyWeaponsParentVC){
                                                    [destinyWeaponsParentVC removeWeaponAction:selectedItemHash];
                                                }
                                            }
                                                
                                                
                                            
                                            if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
                                                ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                                if (destinyArmorParentVC){
                                                    [destinyArmorParentVC loadArmor];
                                                }
                                            }
                                            
                                          
                                        }
                                         
                                    }];
                                    
                                  
                                    
                                    [alert addAction:defaultAction];
                                    if ( destinyItemsParentVC){
                                        [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
                                    }
                                   
                                }
                                //Pull from PostMaster Action Issue
                                else{
                                    
                                    NSString *errorCode = [respData objectForKey:@"ErrorCode"],
                                             *errorStatus = [respData objectForKey:@"ErrorStatus"],
                                             *errorMessage = [respData objectForKey:@"Message"];
                                    
                                    
                                    UIAlertController* alert = [UIAlertController alertControllerWithTitle:errorStatus
                                                                   message:errorMessage
                                                                   preferredStyle:UIAlertControllerStyleAlert];
                                    
                                    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action) {
                                        NSLog(@"%@-%@",errorCode,errorStatus);
                                         
                                    }];
                                    
                                  
                                    
                                    [alert addAction:defaultAction];
                                    if ( destinyItemsParentVC){
                                        [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
                                    }
                                }
                          }
                        }
                    }];
                     
                    TRXBaseClass *payload = [[TRXBaseClass alloc] init];
                    [payload setCharacterId:selectedCharacter];
                    [payload setStackSize:1];
                    [payload setMembershipType:appDelegate.currentMembershipType];
                    [payload setItemId:selectedItemInstance];
                    [payload setItemReferenceHash:selectedItemHash];
                    [payload setTransferToVault:NO];
                       
                    NSDictionary *dictData = [[NSDictionary alloc] initWithDictionary: [payload dictionaryRepresentation]];
                    NSArray *arrayData = [NSArray arrayWithObject:payload.dictionaryRepresentation];
                    payload  = nil;
                    NSError *writeError = nil;
                    
                    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrayData options:NSJSONReadingMutableContainers
                                                                             error:&writeError];
                        
                    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                                     encoding:NSUTF8StringEncoding];
                    NSLog(@"JSON Output: %@", jsonString);
                        
                    [NetworkAPISingleClient pullFromPostMaster:jsonString
                                            completionBlock:^(NSArray *values) {
                        
                        if (values){
                            //Not used
                            NSLog(@"pullFromPostMaster:Completion=%@",values);
                        }
                        
                        
                    } andErrorBlock:^(NSError *exception) {
                        NSLog(@"ItemCellTableView:pullFromPostMaster:Exception->%@",exception.description);
                    }];
                     
                }];
                
                UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                   handler:^(UIAlertAction * action) {
                    NSLog(@"ItemCellTableView:pullFromPostMaster:Cancelled Clicked");
                }];
                
                [alert addAction:defaultAction];
                [alert addAction:cancelAction];
                if ( destinyItemsParentVC){
                    [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
                }
                
            }
            

        }
        
        
    } @catch (NSException *exception) {
        NSLog(@"ItemCellTableView:pullFromPostMaster:Exception->%@",exception.description);
    } @finally {
        destinyItemsParentVC = nil;
        
        selectedTitle        = nil;
        selectedItemHash     = nil;
        selectedItemInstance = nil;
        selectedCharacter    = nil;
        
        selectedCell = nil;
        
        destinyItemsParentVC = nil;
        
        appDelegate = nil;

        lockImage = nil;
        
        indexPath = nil;
    }
    
    
}

- (IBAction)equipItem:(id)sender{

    NSString *selectedTitle        = @"",
             *selectedItemHash     = @"",
             *selectedItemInstance = @"",
             *selectedCharacter    = @"",
             *vaultAction          = @"Equip Item",
             *strIdx               = @"",
             *strMessage           = @"";
    
    ItemCellTableView *selectedCell = nil;
    
    ItemsViewController *destinyItemsParentVC = nil;
    
    AppDelegate *appDelegate = nil;
    
    
    UIImage *lockImage = [UIImage systemImageNamed:@"lock"];
    
    NSIndexPath *indexPath = nil;
    
    NSMutableDictionary *charData = nil,
                        *wData    = nil,
                        *tData    = nil,
                        *hData    = nil;
    
    BOOL isCurrentCharWarlock = NO,
         isCurrentCharTitan   = NO,
         isCurrentCharHunter  = NO;
    
    @try {
        
        if (! self.parentTableView){
            return;
        }
        
        
        if ([self.parentTableView isKindOfClass:[UITableView class]]){
            indexPath =  [self.parentTableView indexPathForSelectedRow];
            
                if (! indexPath){
                    return;
                }
            
            strIdx = [NSString stringWithFormat:@"%d",indexPath.row ];
            
            
        }
        
        if (! self.parentViewController){
            return;
        }
        
        if ([self.parentViewController isKindOfClass:[ItemsViewController class]]){
          destinyItemsParentVC = (ItemsViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[WeaponsTableViewController class]]){
          destinyItemsParentVC = (WeaponsTableViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[ArmorTableViewController class]]){
          destinyItemsParentVC = (ArmorTableViewController*) self.parentViewController;
        }
        
        if (!appDelegate){
            appDelegate = [AppDelegate currentDelegate];
        }
        
        selectedCell = (ItemCellTableView*) [self.parentTableView cellForRowAtIndexPath:indexPath];
        
        if (! selectedCell){
            return;
        }
        
        //Extract Data from Selected Cell
        selectedTitle = selectedCell.lblItemName.text;
        selectedItemHash = [selectedCell.lblHash text];
        selectedItemInstance = [selectedCell.lblInstanceId text];
        selectedCharacter  = [selectedCell.lblCharacterId text];
        
        if (sender){
            //Determine Characters
            charData  = (NSMutableDictionary*) sender;
            
            if (charData){
                
                NSArray *charKeys = [charData allKeys];
                
                wData = [[NSMutableDictionary alloc] init];
                tData = [[NSMutableDictionary alloc] init];
                hData = [[NSMutableDictionary alloc] init];
                
                for(int cIdx = 0 ; cIdx < charKeys.count ; cIdx++){
                
                NSString *currentCKey = [charKeys objectAtIndex:cIdx];
                    
                NSDictionary *currentChar = [charData objectForKey:currentCKey],
                             *chData      = [currentChar objectForKey:@"character"];
                    
                    if (chData){
                        NSDictionary *cData = [chData objectForKey:@"data"];
                        //Determine all of the character classes
                        if (cData){
                            NSString *classHash = [cData objectForKey:@"classHash"],
                                     *strClass = [Utilities decodeClassHash:classHash];
                            
                            if ([strClass isEqualToString:@"Warlock"]){
                                if (![wData.allKeys containsObject:currentCKey]){
                                     [wData setValue:strClass forKey:currentCKey];
                                }
                                
                                if ([currentCKey isEqualToString:selectedCharacter]){
                                    isCurrentCharWarlock = YES;
                                    isCurrentCharTitan = NO;
                                    isCurrentCharHunter = NO;
                                    NSLog(@"Warlock is the current Character!");
                                }
                            }
                            
                            if ([strClass isEqualToString:@"Titan"]){
                                if (![tData.allKeys containsObject:currentCKey]){
                                     [tData setValue:strClass forKey:currentCKey];
                                }
                                
                                if ([currentCKey isEqualToString:selectedCharacter]){
                                    isCurrentCharWarlock = NO;
                                    isCurrentCharTitan = YES;
                                    isCurrentCharHunter = NO;
                                    NSLog(@"Titan is the current Character!");
                                }
                            }
                            
                            if ([strClass isEqualToString:@"Hunter"]){
                                if (![hData.allKeys containsObject:currentCKey]){
                                    [hData setValue:strClass forKey:currentCKey];
                                }
                                
                                if ([currentCKey isEqualToString:selectedCharacter]){
                                    isCurrentCharWarlock = NO;
                                    isCurrentCharTitan = NO;
                                    isCurrentCharHunter = YES;
                                    NSLog(@"Hunter is the current Character!");
                                }
                            }
                            
                            
                        }
                    }
             
                }
            }
        }
        
    
  
        if (selectedItemHash){
            
            NSString *strCharacter  = @"Current Character",
                     *strCC         = @"";
            
            if(isCurrentCharTitan){
                strCharacter = @"Titan";
            }
            
            if(isCurrentCharWarlock){
                strCharacter = @"Warlock";
            }
            
            if(isCurrentCharHunter){
                strCharacter = @"Hunter";
            }
            
            strMessage   = [NSString stringWithFormat:@"Available '%@' [Actions]",selectedTitle];
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:strMessage
                                            message:@"*Select Action Below"
                                            preferredStyle:UIAlertControllerStyleActionSheet];
            
            
            
            strMessage = [NSString stringWithFormat:@"Equip '%@' on %@?",selectedTitle,strCharacter];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:strMessage style:UIAlertActionStyleDefault
                handler:^(UIAlertAction * action) {
                NSLog(vaultAction);
                
                [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyEquipItemNotification
                    object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                    
                    
                    NSDictionary *respData  = (NSDictionary*) [note object],
                                    *userInfo  = [note userInfo];
                    
                    
                    if (respData){
                        
                        NSString *respStatus  = [respData objectForKey:@"ErrorStatus"],
                                    *respMessage = [NSString stringWithFormat:
                                                    @"Successfully equipped '%@'",selectedTitle];
                        
                        if (respStatus){
                            //SendToVault Action was Successfull!
                            if ([respStatus isEqualToString:@"Success"]){
                                
                                UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Equip Item Action Result"
                                                                message:respMessage
                                                                preferredStyle:UIAlertControllerStyleAlert];
                                
                                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                    NSLog(@"%@-",respStatus);
                                    
                                
                                    if (destinyItemsParentVC){
                                        
                                        if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                            ItemsViewController *destinyItemParentVC = (ItemsViewController*) destinyItemsParentVC;
                                            [destinyItemParentVC refreshItems:selectedItemHash];
                                        }
                                        
                                        if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                            WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                            if (destinyWeaponsParentVC){
                                                [destinyWeaponsParentVC refreshEquippedWeaponAction:selectedItemHash];
                                            }
                                        }
                                            
                                            
                                        if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
                                            
                                            ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                            
                                            if (destinyArmorParentVC){
                                                [destinyArmorParentVC refreshEquippedArmorAction:selectedItemHash];
                                            }
                                        }
                                        
                                    }
                                        
                                }];
                                
                                [alert addAction:defaultAction];
                                if ( destinyItemsParentVC){
                                    [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
                                }
                                
                            }
                            //Equip Action Issue
                            else{
                                
                                NSString *errorCode = [respData objectForKey:@"ErrorCode"],
                                            *errorStatus = [respData objectForKey:@"ErrorStatus"],
                                            *errorMessage = [respData objectForKey:@"Message"];
                                
    
                                
                                UIAlertController* alert = [UIAlertController alertControllerWithTitle:errorStatus
                                                                message:errorMessage
                                                                preferredStyle:UIAlertControllerStyleAlert];
                                
                                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                    NSLog(@"%@-%@",errorCode,errorStatus);
                                    
                                    
                                        
                                }];
                                
                                
                                
                                [alert addAction:defaultAction];
                                if ( destinyItemsParentVC){
                                    [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
                                }
                            }
                        }
                    }
                }];
                    
                EQXBaseClass *payload = [[EQXBaseClass alloc] init];
                [payload setCharacterId:selectedCharacter];
                [payload setMembershipType:appDelegate.currentMembershipType];
                [payload setItemId:selectedItemInstance];
                    
                NSDictionary *dictData = [[NSDictionary alloc] initWithDictionary: [payload dictionaryRepresentation]];
                    
                NSArray *arrayData = [NSArray arrayWithObject:payload.dictionaryRepresentation];
                    
                payload  = nil;
                    
                NSError *writeError = nil;
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrayData options:NSJSONReadingMutableContainers
                                                                            error:&writeError];
                    
                NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                                    encoding:NSUTF8StringEncoding];
                NSLog(@"JSON Output: %@", jsonString);
                    
                [NetworkAPISingleClient equipItem:jsonString
                                        completionBlock:^(NSArray *values) {
                    
                    if (values){
                    //Not used
                    NSLog(@"equipItem:Completion=%@",values);
                    }
                    
                } andErrorBlock:^(NSError *exception) {
                    NSLog(@"ItemCellTableView:equipItem:Exception->%@",exception.description);
                }];
                    
            }];
            
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                handler:^(UIAlertAction * action) {
                NSLog(@"ItemCellTableView:equipItem:Cancelled Clicked");
            }];
            
            [alert addAction:defaultAction];
            [alert addAction:cancelAction];
            if ( destinyItemsParentVC){
                [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
            }
            
        }
            

    
        
    } @catch (NSException *exception) {
        NSLog(@"ItemCellTableView:equipItem:Exception->%@",exception.description);
    } @finally {
        destinyItemsParentVC = nil;
        
        selectedTitle        = nil;
        selectedItemHash     = nil;
        selectedItemInstance = nil;
        selectedCharacter    = nil;
        
        selectedCell = nil;
        
        destinyItemsParentVC = nil;
        
        appDelegate = nil;

        lockImage = nil;
        
        indexPath = nil;
    }
    
    
    
}

- (IBAction)pullFromVaultAction:(id)sender{
    
    
    NSString *selectedTitle        = @"",
             *selectedItemHash     = @"",
             *selectedItemInstance = @"",
             *selectedCharacter    = @"",
             *transferAction       = @"Pull Item",
             *strIdx               = @"",
             *strMessage           = @"";
    
    ItemCellTableView *selectedCell = nil;
    
    ItemsViewController *destinyItemsParentVC = nil;
    
    AppDelegate *appDelegate = nil;
    
    UIImage *lockImage = [UIImage systemImageNamed:@"lock"];
    
    NSIndexPath *indexPath = nil;
    
    NSMutableDictionary *charData = nil,
                        *wData    = nil,
                        *tData    = nil,
                        *hData    = nil;
    
    BOOL isCurrentCharWarlock = NO,
         isCurrentCharTitan   = NO,
         isCurrentCharHunter  = NO;
    
    @try {
        
        if (! self.parentTableView){
            return;
        }
        
        if ([self.parentTableView isKindOfClass:[UITableView class]]){
            indexPath =  [self.parentTableView indexPathForSelectedRow];
            
                if (! indexPath){
                    return;
                }
            
            strIdx = [NSString stringWithFormat:@"%d",indexPath.row ];
        }
        
        if (! self.parentViewController){
            return;
        }
        
        if ([self.parentViewController isKindOfClass:[ItemsViewController class]]){
          destinyItemsParentVC = (ItemsViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[WeaponsTableViewController class]]){
          destinyItemsParentVC = (WeaponsTableViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[ArmorTableViewController class]]){
          destinyItemsParentVC = (ArmorTableViewController*) self.parentViewController;
        }
        
        if (!appDelegate){
            appDelegate = [AppDelegate currentDelegate];
        }
        
        selectedCell = (ItemCellTableView*) [self.parentTableView cellForRowAtIndexPath:indexPath];

        if (! selectedCell){
            return;
        }
        //Extract Data from Selected Cell
        selectedTitle = selectedCell.lblItemName.text;
        selectedItemHash = [selectedCell.lblHash text];
        selectedItemInstance = [selectedCell.lblInstanceId text];
        selectedCharacter  = [selectedCell.lblCharacterId text];
        
        if (sender){
            //Determine Characters
            charData  = (NSMutableDictionary*) sender;
            
            if (charData){
                
                NSArray *charKeys = [charData allKeys];
                
                wData = [[NSMutableDictionary alloc] init];
                tData = [[NSMutableDictionary alloc] init];
                hData = [[NSMutableDictionary alloc] init];
                
                for(int cIdx = 0 ; cIdx < charKeys.count ; cIdx++){
                
                NSString *currentCKey = [charKeys objectAtIndex:cIdx];
                    
                NSDictionary *currentChar = [charData objectForKey:currentCKey],
                             *chData      = [currentChar objectForKey:@"character"];
                    
                    if (chData){
                        NSDictionary *cData = [chData objectForKey:@"data"];
                        //Determine all of the character classes
                        if (cData){
                            NSString *classHash = [cData objectForKey:@"classHash"],
                                     *strClass = [Utilities decodeClassHash:classHash];
                            
                            if ([strClass isEqualToString:@"Warlock"]){
                                if (![wData.allKeys containsObject:currentCKey]){
                                     [wData setValue:strClass forKey:currentCKey];
                                }
                                
                                if ([currentCKey isEqualToString:selectedCharacter]){
                                    isCurrentCharWarlock = YES;
                                    isCurrentCharTitan = NO;
                                    isCurrentCharHunter = NO;
                                    NSLog(@"Warlock is the current Character!");
                                }
                            }
                            
                            if ([strClass isEqualToString:@"Titan"]){
                                if (![tData.allKeys containsObject:currentCKey]){
                                     [tData setValue:strClass forKey:currentCKey];
                                }
                                
                                if ([currentCKey isEqualToString:selectedCharacter]){
                                    isCurrentCharWarlock = NO;
                                    isCurrentCharTitan = YES;
                                    isCurrentCharHunter = NO;
                                    NSLog(@"Titan is the current Character!");
                                }
                            }
                            
                            if ([strClass isEqualToString:@"Hunter"]){
                                if (![hData.allKeys containsObject:currentCKey]){
                                    [hData setValue:strClass forKey:currentCKey];
                                }
                                
                                if ([currentCKey isEqualToString:selectedCharacter]){
                                    isCurrentCharWarlock = NO;
                                    isCurrentCharTitan = NO;
                                    isCurrentCharHunter = YES;
                                    NSLog(@"Hunter is the current Character!");
                                }
                            }
                            
                            
                        }
                    }
             
                }
            }
        }
     

        if (selectedItemHash){
            
            NSString *strCharacter  = @"Current Character",
                     *strCC         = @"";
            
            if(isCurrentCharTitan){
               strCharacter = @"Titan";
            }
            
            if(isCurrentCharWarlock){
                strCharacter = @"Warlock";
            }
            
            if(isCurrentCharHunter){
                strCharacter = @"Hunter";
            }
            
            strMessage   = [NSString stringWithFormat:@"Available '%@' [Actions]",selectedTitle];
          
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:strMessage
                                            message:@"*Select Action Below"
                                            preferredStyle:UIAlertControllerStyleActionSheet];
            
            
            //BEGIN SEND TO WARLOCK
          
             
             strCC = @"Warlock";
             transferAction = [NSString stringWithFormat:@"Pull from Vault to %@?",strCC];
            
             UIAlertAction* warlockAction = [UIAlertAction actionWithTitle:transferAction
                                                                    style:UIAlertActionStyleDefault
                                                                    handler:^(UIAlertAction * action) {
            NSLog(transferAction);
                
            NSString* targetCharacter = (NSString *) [wData.allKeys firstObject];
                
                //BEGIN Warlock Notification
                [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyTransferToWarlockNotification
                                object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                                                        
                                                        
                NSDictionary *respData  = (NSDictionary*) [note object],
                             *userInfo  = [note userInfo];
                                                        
                if (respData){
                                
                    NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                                                            
                    if (respStatus){
                        //Transfer to Warlock Action was Successfull!
                        if ([respStatus isEqualToString:@"Success"]){
                                                
                            NSString *strMessage = [NSString stringWithFormat:@"Transfer '%@' to %@ Result",selectedTitle,strCC];
                            
                            UIAlertController* alertWarlockOk = [UIAlertController alertControllerWithTitle:strMessage
                                                message:respStatus
                                                preferredStyle:UIAlertControllerStyleAlert];
                                                
                            UIAlertAction* warlockActionOk = [UIAlertAction actionWithTitle:@"OK"
                                                style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                                
                                NSLog(@"Transfer to Warlock Action Status:[%@]",respStatus);
                                
                                if (destinyItemsParentVC){
                                                
                                    if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                        //TODO inventory refresh logic
                                    }
                                                
                                    if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                        
                                        WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                        
                                        if (destinyWeaponsParentVC){
                                           [destinyWeaponsParentVC removeWeaponAction:selectedItemHash];
                                        }
                                     }
                                            
                                    if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){

                                    }
                                        
                                }
                                                    
                            }];
                                                    
                            [alertWarlockOk addAction:warlockActionOk];
                                if ( destinyItemsParentVC){
                                //Display Warlock Transfer Item Ok
                                    [destinyItemsParentVC presentViewController:alertWarlockOk animated:YES completion:nil];
                                }
                                                
                        }
                        //BEGIN Transfer to Warlock Action Issue
                        else{
                        
                        NSLog(@"Transfer to Warlock Action Error Status:[%@]",respStatus);
                        NSString *errorCode    = [respData objectForKey:@"ErrorCode"],
                                 *errorStatus  = [respData objectForKey:@"ErrorStatus"],
                                 *errorMessage = [respData objectForKey:@"Message"];
                        //Display Error Details
                                    
                        UIAlertController* alertWarlockError = [UIAlertController alertControllerWithTitle:errorStatus
                                            message:errorMessage
                                        preferredStyle:UIAlertControllerStyleAlert];
                                                
                        UIAlertAction* warlockErrorAction = [UIAlertAction actionWithTitle:@"OK"
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                                NSLog(@"ItemCellTableView:warlockErrorAction=[%@-%@]",errorCode,errorStatus);
                                                    
                        }];
                                                
                         [alertWarlockError addAction:warlockErrorAction];
                             if ( destinyItemsParentVC){
                                //Display Warlock Transfer Item Error
                                [destinyItemsParentVC presentViewController:alertWarlockError animated:YES completion:nil];
                             }
                         }
                         //END Transfer to Warlock Action Issue
                      }
                }
                                    
                }];
                //END Warlock Notification
                 
                
            TRXBaseClass *payload = [[TRXBaseClass alloc] init];
            [payload setCharacterId:selectedCharacter];
            [payload setTargetCharacterId:targetCharacter];
            [payload setStackSize:1];
            [payload setMembershipType:appDelegate.currentMembershipType];
            [payload setItemId:selectedItemInstance];
            [payload setItemReferenceHash:selectedItemHash];
            [payload setTransferToVault:NO];
                        
            //BEGIN NetworkAPISingleClient transferItem API Call
       
            [NetworkAPISingleClient pullItemFromVault:payload
                                    completionBlock:^(NSArray *values) {
                //Json Response
                if (values){
                    //Not used
                    NSLog(@"Pull Vault Item to Warlock JSON Response->[%@]",values);
                }
                                
                }
                 andErrorBlock:^(NSError *exception) {
                    NSLog(@"Pull Vault Item to Warlock Response Exception->[%@]",exception.description);
                }];
            //END NetworkAPISingleClient transferItem API Call

                
            }];
             
            [alert addAction:warlockAction];
         
            //END SEND TO WARLOCK
            
            //BEGIN SEND TO TITAN
            
                
               strCC = @"Titan";
               transferAction = [NSString stringWithFormat:@"Pull from Vault to %@?",strCC];
            
            
            UIAlertAction* titanAction = [UIAlertAction actionWithTitle:transferAction
                                                                    style:UIAlertActionStyleDefault
                                                                    handler:^(UIAlertAction * action) {
                
            
            NSLog(transferAction);
                
            NSString* targetCharacter = (NSString *) [tData.allKeys firstObject];
                
                //BEGIN TITAN Notification
                [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyTransferToTitanNotification
                                object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                                                        
                                                        
                NSDictionary *respData  = (NSDictionary*) [note object],
                             *userInfo  = [note userInfo];
                                                        
                if (respData){
                                
                    NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                                                            
                    if (respStatus){
                        //Transfer to TITAN Action was Successfull!
                        if ([respStatus isEqualToString:@"Success"]){
                     
                            
                            NSString *strMessage = [NSString stringWithFormat:@"Transfer '%@' to %@ Result",selectedTitle,strCC];
                            
 
                            UIAlertController* alertTitanOk = [UIAlertController
                                                               alertControllerWithTitle:strMessage
                                                               message:respStatus
                                                               preferredStyle:UIAlertControllerStyleAlert];
                                                
                            UIAlertAction* titanActionOk = [UIAlertAction actionWithTitle:@"OK"
                                                style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                                
                                NSLog(@"Pull from Vault to Titan Action Status:[%@]",respStatus);
                                                
                                if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                    ItemsViewController *destinyItemParentVC = (ItemsViewController*) destinyItemsParentVC;
                                    [destinyItemParentVC refreshItems:selectedItemHash];
                                }
                                            
                                if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                    WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                    [destinyWeaponsParentVC removeWeaponAction:selectedItemHash];
                                
                                }
                                        
                                if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
                                    ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                    [destinyArmorParentVC removeArmorAction:selectedItemHash];
                                }
                   
                                                    
                            }];
                                                    
                            [alertTitanOk addAction:titanActionOk];
                                if ( destinyItemsParentVC){
                                //Display TITAN Transfer Item Ok
                                    [destinyItemsParentVC presentViewController:alertTitanOk animated:YES completion:nil];
                                }
                                                
                        }
                        //BEGIN Transfer to TITAN Action Issue
                        else{
                                                
                        NSString *errorCode    = [respData objectForKey:@"ErrorCode"],
                                 *errorStatus  = [respData objectForKey:@"ErrorStatus"],
                                 *errorMessage = [respData objectForKey:@"Message"];
                        //Display Error Details
                                    
                        UIAlertController* alertTitanError = [UIAlertController alertControllerWithTitle:errorStatus
                                            message:errorMessage
                                        preferredStyle:UIAlertControllerStyleAlert];
                                                
                        UIAlertAction* titanErrorAction = [UIAlertAction actionWithTitle:@"OK"
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                                NSLog(@"ItemCellTableView:TITANErrorAction=[%@-%@]",errorCode,errorStatus);
                                                    
                        }];
                                                
                            [alertTitanError addAction:titanErrorAction];
                              if ( destinyItemsParentVC){
                              //Display TITAN Transfer Item Error
                              [destinyItemsParentVC presentViewController:alertTitanError animated:YES completion:nil];
                             }
                          }
                        //END Transfer to TITAN Action Issue
                     }
                }
                                    
                }];
                //END TITAN Notification
            
            TRXBaseClass *payload = [[TRXBaseClass alloc] init];
            [payload setCharacterId:selectedCharacter];
            [payload setTargetCharacterId:targetCharacter];
            [payload setStackSize:1];
            [payload setMembershipType:appDelegate.currentMembershipType];
            [payload setItemId:selectedItemInstance];
            [payload setItemReferenceHash:selectedItemHash];
            [payload setTransferToVault:NO];
                    
            //BEGIN NetworkAPISingleClient transferItem API Call
                
            [NetworkAPISingleClient pullItemFromVault:payload
                                    completionBlock:^(NSArray *values) {
                //Json Response
                if (values){
                    //Not used
                    NSLog(@"Pull Vault Item to Titan JSON Response->[%@]",values);
                }
                                
              }
               andErrorBlock:^(NSError *exception) {
                    NSLog(@"Pull Vault Item to Titan Response Exception->[%@]",exception.description);
              }];
            //END NetworkAPISingleClient transferItem API Call

                
            }];
                
            [alert addAction:titanAction];
           
            //END SEND TO TITAN
            
            //BEGIN SEND TO HUNTER
      
                
                strCC = @"Hunter";
                transferAction = [NSString stringWithFormat:@"Pull from Vault to %@?",strCC];
                
            UIAlertAction *hunterAction = [UIAlertAction actionWithTitle:transferAction
                                                                    style:UIAlertActionStyleDefault
                                                                    handler:^(UIAlertAction * action) {
            NSLog(transferAction);
                
            NSString* targetCharacter = (NSString *) [hData.allKeys firstObject];
                
                //BEGIN HUNTER Notification
                [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyTransferToHunterNotification
                                object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                                                        
                                                        
                NSDictionary *respData  = (NSDictionary*) [note object],
                             *userInfo  = [note userInfo];
                                                        
                if (respData){
                                
                    NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                                                            
                    if (respStatus){
                        //Transfer to HUNTER Action was Successfull!
                        if ([respStatus isEqualToString:@"Success"]){
                                                
                            
                            NSString *strMessage = [NSString stringWithFormat:@"Transfer '%@' to %@ Result",selectedTitle,strCC];
                            
                            UIAlertController* alertHunterOk = [UIAlertController alertControllerWithTitle:strMessage
                                                message:respStatus
                                                preferredStyle:UIAlertControllerStyleAlert];
                                                
                            UIAlertAction* hunterActionOk = [UIAlertAction actionWithTitle:@"OK"
                                                style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                               
                                NSLog(@"Pull from Vault to Hunter Action Status:[%@]",respStatus);
                                            
                                if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                    //TODO inventory refresh logic
                                }
                                            
                                if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                   WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                    [destinyWeaponsParentVC removeWeaponAction:selectedItemHash];
                                }
                                        
                                if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
                                    ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                    [destinyArmorParentVC removeArmorAction:selectedItemHash];
                                }
                             
                                                    
                            }];
                                                    
                            [alertHunterOk addAction:hunterActionOk];
                                if ( destinyItemsParentVC){
                                //Display HUNTER Transfer Item Ok
                                    [destinyItemsParentVC presentViewController:alertHunterOk animated:YES completion:nil];
                                }
                                                
                        }
                        //BEGIN Transfer to HUNTER Action Issue
                        else{
                                                
                        NSString *errorCode    = [respData objectForKey:@"ErrorCode"],
                                 *errorStatus  = [respData objectForKey:@"ErrorStatus"],
                                 *errorMessage = [respData objectForKey:@"Message"];
                        //Display Error Details
                                    
                        UIAlertController* alertHunterError = [UIAlertController alertControllerWithTitle:errorStatus
                                            message:errorMessage
                                        preferredStyle:UIAlertControllerStyleAlert];
                                                
                        UIAlertAction* hunterErrorAction = [UIAlertAction actionWithTitle:@"OK"
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                              
                                                    
                        }];
                                                
                            [alertHunterError addAction:hunterErrorAction];
                            if ( destinyItemsParentVC){
                            //Display HUNTER Transfer Item Error
                                [destinyItemsParentVC presentViewController:alertHunterError animated:YES completion:nil];
                             }
                            }
                        //END Transfer to HUNTER Action Issue
                        }
                }
                                    
                }];
                //END HUNTER Notification
                
            TRXBaseClass *payload = [[TRXBaseClass alloc] init];
            [payload setCharacterId:selectedCharacter];
            [payload setTargetCharacterId:targetCharacter];
            [payload setStackSize:1];
            [payload setMembershipType:appDelegate.currentMembershipType];
            [payload setItemId:selectedItemInstance];
            [payload setItemReferenceHash:selectedItemHash];
            [payload setTransferToVault:NO];
                        
            //BEGIN NetworkAPISingleClient transferItem API Call
            [NetworkAPISingleClient pullItemFromVault:payload
                                    completionBlock:^(NSArray *values) {
                //Json Response
                if (values){
                    //Not used
                    NSLog(@"Vault Item to Hunter JSON Response->[%@]",values);
                }
                                
                }
                 andErrorBlock:^(NSError *exception) {
                    NSLog(@"Vault Item to Hunter Response Exception->[%@]",exception.description);
                }];
                
            //END NetworkAPISingleClient transferItem API Call

                
            }];
            
             [alert addAction:hunterAction];
           
            //END SEND TO HUNTER
        

            //BEGIN Lock Action
            
            transferAction = [NSString stringWithFormat:@"Lock '%@' in Vault?",selectedTitle];
            BOOL bLockAction = YES;
            NSString *strLocked = @"1";
            
            if ([selectedCell.btnLockAction.currentImage isEqual:lockImage]){
                transferAction = [NSString stringWithFormat:@"Unlock '%@' in Vault?",selectedTitle];
                bLockAction = NO;
                strLocked = @"0";
            }
            
            
            UIAlertAction* lockAction = [UIAlertAction actionWithTitle:transferAction style:UIAlertActionStyleDefault
               handler:^(UIAlertAction * action) {
                NSLog(transferAction);
                
                
                [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLockItemStateNotification
                    object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                    
                    
                    NSDictionary *respData  = (NSDictionary*) [note object],
                                 *userInfo  = [note userInfo];
                    
                    
                    if (respData){
                     
                        NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                        
                        if (respStatus){
                            if ([respStatus isEqualToString:@"Success"]){
                              
                                NSString *strMessage = [transferAction stringByReplacingOccurrencesOfString:@"?" withString:@"Result"];
                                 
                                 UIAlertController* alertLockItemOk = [UIAlertController alertControllerWithTitle: strMessage
                                                                message:respStatus
                                                                preferredStyle:UIAlertControllerStyleAlert];
                                 
                                 UIAlertAction* lockItemOkAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {

                                       NSLog(@"[%@]:Lock Vault Item Action Response:[%@]",selectedTitle, respStatus);
                                     
                                      if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                         //TODO:Refresh Items Logic
                                     }
                                     
                                     if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                         WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                        [destinyWeaponsParentVC refreshLockedWeaponAction:selectedItemHash];
                                    }
                                         
                                         
                                     if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
         
                                         ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                        
                                         if (destinyArmorParentVC){
                                             [destinyArmorParentVC refreshLockedArmorAction:selectedItemHash];
                                         }
                                     }
                                      
                                 }];
                                 
                                 [alertLockItemOk addAction:lockItemOkAction];
                                 if ( destinyItemsParentVC){
                                     [destinyItemsParentVC presentViewController: alertLockItemOk animated:YES completion:nil];
                                 }
                                
                                
                                 
                           }
                      }
                    }
                }];
                
                    
                    LCKBaseClass *payload = [[LCKBaseClass alloc] init];
                    [payload setCharacterId:selectedCharacter];
                    [payload setState:bLockAction];
                    [payload setMembershipType:appDelegate.currentMembershipType];
                    [payload setItemId:selectedItemInstance];
                   
                    NSDictionary *dictData = [[NSDictionary alloc] initWithDictionary: [payload dictionaryRepresentation]];
                    
                    NSArray *arrayData = [NSArray arrayWithObject:payload.dictionaryRepresentation];
                    
                    payload  = nil;
                    
                    NSError *writeError = nil;
                    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrayData options:NSJSONReadingMutableContainers
                                                                         error:&writeError];
                    
                    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                                 encoding:NSUTF8StringEncoding];
                    NSLog(@"JSON Output: %@", jsonString);
                    
                    [NetworkAPISingleClient lockStateItem:jsonString
                                            completionBlock:^(NSArray *values) {
                        
                        if (values){
                            //Not used
                        }
                        
                        
                    } andErrorBlock:^(NSError *exception) {
                        NSLog(@"ItemCellTableView:lockStateAction:Exception->%@",exception.description);
                    }];
                    
                 
            }];
 
            //END Lock Action
            
            
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                                    style:UIAlertActionStyleCancel
                handler:^(UIAlertAction * action) {
                NSLog(@"ItemCellTableView:transferItem:Cancelled Clicked");
                }];


            [alert addAction:lockAction];
            [alert addAction:cancelAction];
            
            if ( destinyItemsParentVC){
                [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
            }
            
            
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"ItemCellTableView:transferItem:Exception->%@",exception.description);
    } @finally {
        destinyItemsParentVC = nil;
        
        selectedTitle        = nil;
        selectedItemHash     = nil;
        selectedItemInstance = nil;
        selectedCharacter    = nil;
        
        selectedCell = nil;
        
        destinyItemsParentVC = nil;
        
        appDelegate = nil;

        lockImage = nil;
        
        indexPath = nil;
    }
    
    
}

- (IBAction)transferItemAction:(id)sender{
    
    NSString *selectedTitle        = @"",
             *selectedItemHash     = @"",
             *selectedItemInstance = @"",
             *selectedCharacter    = @"",
             *transferAction       = @"Transfer Item",
             *strIdx               = @"",
             *strMessage           = @"";
    
    ItemCellTableView *selectedCell = nil;
    
    ItemsViewController *destinyItemsParentVC = nil;
    
    AppDelegate *appDelegate = nil;
    
    UIImage *lockImage = [UIImage systemImageNamed:@"lock"];
    
    NSIndexPath *indexPath = nil;
    
    NSMutableDictionary *charData = nil,
                        *wData    = nil,
                        *tData    = nil,
                        *hData    = nil;
    
    BOOL isCurrentCharWarlock = NO,
         isCurrentCharTitan   = NO,
         isCurrentCharHunter  = NO;
    
    @try {
        
        if (! self.parentTableView){
            return;
        }
        
        if ([self.parentTableView isKindOfClass:[UITableView class]]){
            indexPath =  [self.parentTableView indexPathForSelectedRow];
            
                if (! indexPath){
                    return;
                }
            
            strIdx = [NSString stringWithFormat:@"%d",indexPath.row ];
        }
        
        if (! self.parentViewController){
            return;
        }
        
        if ([self.parentViewController isKindOfClass:[ItemsViewController class]]){
          destinyItemsParentVC = (ItemsViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[WeaponsTableViewController class]]){
          destinyItemsParentVC = (WeaponsTableViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[ArmorTableViewController class]]){
          destinyItemsParentVC = (ArmorTableViewController*) self.parentViewController;
        }
        
        if (!appDelegate){
            appDelegate = [AppDelegate currentDelegate];
        }
        
        selectedCell = (ItemCellTableView*) [self.parentTableView cellForRowAtIndexPath:indexPath];

        if (! selectedCell){
            return;
        }
        //Extract Data from Selected Cell
        selectedTitle = selectedCell.lblItemName.text;
        selectedItemHash = [selectedCell.lblHash text];
        selectedItemInstance = [selectedCell.lblInstanceId text];
        selectedCharacter  = [selectedCell.lblCharacterId text];
        
        if (sender){
            //Determine Characters
            charData  = (NSMutableDictionary*) sender;
            
            if (charData){
                
                NSArray *charKeys = [charData allKeys];
                
                wData = [[NSMutableDictionary alloc] init];
                tData = [[NSMutableDictionary alloc] init];
                hData = [[NSMutableDictionary alloc] init];
                
                for(int cIdx = 0 ; cIdx < charKeys.count ; cIdx++){
                
                NSString *currentCKey = [charKeys objectAtIndex:cIdx];
                    
                NSDictionary *currentChar = [charData objectForKey:currentCKey],
                             *chData      = [currentChar objectForKey:@"character"];
                    
                    if (chData){
                        NSDictionary *cData = [chData objectForKey:@"data"];
                        //Determine all of the character classes
                        if (cData){
                            NSString *classHash = [cData objectForKey:@"classHash"],
                                     *strClass = [Utilities decodeClassHash:classHash];
                            
                            if ([strClass isEqualToString:@"Warlock"]){
                                if (![wData.allKeys containsObject:currentCKey]){
                                     [wData setValue:strClass forKey:currentCKey];
                                }
                                
                                if ([currentCKey isEqualToString:selectedCharacter]){
                                    isCurrentCharWarlock = YES;
                                    isCurrentCharTitan = NO;
                                    isCurrentCharHunter = NO;
                                    NSLog(@"Warlock is the current Character!");
                                }
                            }
                            
                            if ([strClass isEqualToString:@"Titan"]){
                                if (![tData.allKeys containsObject:currentCKey]){
                                     [tData setValue:strClass forKey:currentCKey];
                                }
                                
                                if ([currentCKey isEqualToString:selectedCharacter]){
                                    isCurrentCharWarlock = NO;
                                    isCurrentCharTitan = YES;
                                    isCurrentCharHunter = NO;
                                    NSLog(@"Titan is the current Character!");
                                }
                            }
                            
                            if ([strClass isEqualToString:@"Hunter"]){
                                if (![hData.allKeys containsObject:currentCKey]){
                                    [hData setValue:strClass forKey:currentCKey];
                                }
                                
                                if ([currentCKey isEqualToString:selectedCharacter]){
                                    isCurrentCharWarlock = NO;
                                    isCurrentCharTitan = NO;
                                    isCurrentCharHunter = YES;
                                    NSLog(@"Hunter is the current Character!");
                                }
                            }
                            
                            
                        }
                    }
             
                }
            }
        }
     

        if (selectedItemHash){
            
            NSString *strCharacter  = @"Current Character",
                     *strCC         = @"";
            
            if(isCurrentCharTitan){
               strCharacter = @"Titan";
            }
            
            if(isCurrentCharWarlock){
                strCharacter = @"Warlock";
            }
            
            if(isCurrentCharHunter){
                strCharacter = @"Hunter";
            }
            
            strMessage   = [NSString stringWithFormat:@"Available '%@' [Actions]",selectedTitle];
          
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:strMessage
                                            message:@"*Select Action Below"
                                            preferredStyle:UIAlertControllerStyleActionSheet];
            
            
            //BEGIN SEND TO WARLOCK
            if (! isCurrentCharWarlock){
             
             strCC = @"Warlock";
             transferAction = [NSString stringWithFormat:@"Transfer to %@?",strCC];
            
             UIAlertAction* warlockAction = [UIAlertAction actionWithTitle:transferAction
                                                                    style:UIAlertActionStyleDefault
                                                                    handler:^(UIAlertAction * action) {
            NSLog(transferAction);
                
            NSString* targetCharacter = (NSString *) [wData.allKeys firstObject];
                
                //BEGIN Warlock Notification
                [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyTransferToWarlockNotification
                                object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                                                        
                                                        
                NSDictionary *respData  = (NSDictionary*) [note object],
                             *userInfo  = [note userInfo];
                                                        
                if (respData){
                                
                    NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                                                            
                    if (respStatus){
                        //Transfer to Warlock Action was Successfull!
                        if ([respStatus isEqualToString:@"Success"]){
                                                
                            NSString *strMessage = [NSString stringWithFormat:@"Transfer '%@' to %@ Result",selectedTitle,strCC];
                            
                            UIAlertController* alertWarlockOk = [UIAlertController alertControllerWithTitle:strMessage
                                                message:respStatus
                                                preferredStyle:UIAlertControllerStyleAlert];
                                                
                            UIAlertAction* warlockActionOk = [UIAlertAction actionWithTitle:@"OK"
                                                style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                                
                                NSLog(@"Transfer to Warlock Action Status:[%@]",respStatus);
                                
                                if (destinyItemsParentVC){
                                                
                                    if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                        //TODO inventory refresh logic
                                    }
                                                
                                    if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                        
                                        WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                        
                                        if (destinyWeaponsParentVC){
                                           [destinyWeaponsParentVC removeWeaponAction:selectedItemHash];
                                        }
                                     }
                                            
                                    if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){

                                    }
                                        
                                }
                                                    
                            }];
                                                    
                            [alertWarlockOk addAction:warlockActionOk];
                                if ( destinyItemsParentVC){
                                //Display Warlock Transfer Item Ok
                                    [destinyItemsParentVC presentViewController:alertWarlockOk animated:YES completion:nil];
                                }
                                                
                        }
                        //BEGIN Transfer to Warlock Action Issue
                        else{
                        
                        NSLog(@"Transfer to Warlock Action Error Status:[%@]",respStatus);
                        NSString *errorCode    = [respData objectForKey:@"ErrorCode"],
                                 *errorStatus  = [respData objectForKey:@"ErrorStatus"],
                                 *errorMessage = [respData objectForKey:@"Message"];
                        //Display Error Details
                                    
                        UIAlertController* alertWarlockError = [UIAlertController alertControllerWithTitle:errorStatus
                                            message:errorMessage
                                        preferredStyle:UIAlertControllerStyleAlert];
                                                
                        UIAlertAction* warlockErrorAction = [UIAlertAction actionWithTitle:@"OK"
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                                NSLog(@"ItemCellTableView:warlockErrorAction=[%@-%@]",errorCode,errorStatus);
                                                    
                        }];
                                                
                         [alertWarlockError addAction:warlockErrorAction];
                             if ( destinyItemsParentVC){
                                //Display Warlock Transfer Item Error
                                [destinyItemsParentVC presentViewController:alertWarlockError animated:YES completion:nil];
                             }
                         }
                         //END Transfer to Warlock Action Issue
                      }
                }
                                    
                }];
                //END Warlock Notification
                 
                
            TRXBaseClass *payload = [[TRXBaseClass alloc] init];
            [payload setCharacterId:selectedCharacter];
            [payload setTargetCharacterId:targetCharacter];
            [payload setStackSize:1];
            [payload setMembershipType:appDelegate.currentMembershipType];
            [payload setItemId:selectedItemInstance];
            [payload setItemReferenceHash:selectedItemHash];
            [payload setTransferToVault:NO];
                        
            //BEGIN NetworkAPISingleClient transferItem API Call
            [NetworkAPISingleClient transferItem:payload
                                    completionBlock:^(NSArray *values) {
                //Json Response
                if (values){
                    //Not used
                    NSLog(@"Transfer Item to Warlock JSON Response->[%@]",values);
                }
                                
                }
                 andErrorBlock:^(NSError *exception) {
                    NSLog(@"Transfer Item to Warlock Response Exception->[%@]",exception.description);
                }];
            //END NetworkAPISingleClient transferItem API Call

                
            }];
             
            [alert addAction:warlockAction];
            }
            //END SEND TO WARLOCK
            
            //BEGIN SEND TO TITAN
            if (! isCurrentCharTitan){
                
               strCC = @"Titan";
               transferAction = [NSString stringWithFormat:@"Transfer to %@?",strCC];
            
            
            UIAlertAction* titanAction = [UIAlertAction actionWithTitle:transferAction
                                                                    style:UIAlertActionStyleDefault
                                                                    handler:^(UIAlertAction * action) {
                
            
            NSLog(transferAction);
                
            NSString* targetCharacter = (NSString *) [tData.allKeys firstObject];
                
                //BEGIN TITAN Notification
                [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyTransferToTitanNotification
                                object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                                                        
                                                        
                NSDictionary *respData  = (NSDictionary*) [note object],
                             *userInfo  = [note userInfo];
                                                        
                if (respData){
                                
                    NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                                                            
                    if (respStatus){
                        //Transfer to TITAN Action was Successfull!
                        if ([respStatus isEqualToString:@"Success"]){
                     
                            
                            NSString *strMessage = [NSString stringWithFormat:@"Transfer '%@' to %@ Result",selectedTitle,strCC];
                            
 
                            UIAlertController* alertTitanOk = [UIAlertController
                                                               alertControllerWithTitle:strMessage
                                                               message:respStatus
                                                               preferredStyle:UIAlertControllerStyleAlert];
                                                
                            UIAlertAction* titanActionOk = [UIAlertAction actionWithTitle:@"OK"
                                                style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                                
                                NSLog(@"Transfer to Titan Action Status:[%@]",respStatus);
                                                
                                if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                    ItemsViewController *destinyItemParentVC = (ItemsViewController*) destinyItemsParentVC;
                                    [destinyItemParentVC refreshItems:selectedItemHash];
                                }
                                            
                                if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                    WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                    [destinyWeaponsParentVC removeWeaponAction:selectedItemHash];
                                
                                }
                                        
                                if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
                                    ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                    [destinyArmorParentVC removeArmorAction:selectedItemHash];
                                }
                   
                                                    
                            }];
                                                    
                            [alertTitanOk addAction:titanActionOk];
                                if ( destinyItemsParentVC){
                                //Display TITAN Transfer Item Ok
                                    [destinyItemsParentVC presentViewController:alertTitanOk animated:YES completion:nil];
                                }
                                                
                        }
                        //BEGIN Transfer to TITAN Action Issue
                        else{
                                                
                        NSString *errorCode    = [respData objectForKey:@"ErrorCode"],
                                 *errorStatus  = [respData objectForKey:@"ErrorStatus"],
                                 *errorMessage = [respData objectForKey:@"Message"];
                        //Display Error Details
                                    
                        UIAlertController* alertTitanError = [UIAlertController alertControllerWithTitle:errorStatus
                                            message:errorMessage
                                        preferredStyle:UIAlertControllerStyleAlert];
                                                
                        UIAlertAction* titanErrorAction = [UIAlertAction actionWithTitle:@"OK"
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                                NSLog(@"ItemCellTableView:TITANErrorAction=[%@-%@]",errorCode,errorStatus);
                                                    
                        }];
                                                
                            [alertTitanError addAction:titanErrorAction];
                              if ( destinyItemsParentVC){
                              //Display TITAN Transfer Item Error
                              [destinyItemsParentVC presentViewController:alertTitanError animated:YES completion:nil];
                             }
                          }
                        //END Transfer to TITAN Action Issue
                     }
                }
                                    
                }];
                //END TITAN Notification
            
            TRXBaseClass *payload = [[TRXBaseClass alloc] init];
            [payload setCharacterId:selectedCharacter];
            [payload setTargetCharacterId:targetCharacter];
            [payload setStackSize:1];
            [payload setMembershipType:appDelegate.currentMembershipType];
            [payload setItemId:selectedItemInstance];
            [payload setItemReferenceHash:selectedItemHash];
            [payload setTransferToVault:NO];
                    
            //BEGIN NetworkAPISingleClient transferItem API Call
                
            [NetworkAPISingleClient transferItem:payload
                                    completionBlock:^(NSArray *values) {
                //Json Response
                if (values){
                    //Not used
                    NSLog(@"Transfer Item to Titan JSON Response->[%@]",values);
                }
                                
              }
               andErrorBlock:^(NSError *exception) {
                    NSLog(@"Transfer Item to Titan Response Exception->[%@]",exception.description);
              }];
            //END NetworkAPISingleClient transferItem API Call

                
            }];
                
            [alert addAction:titanAction];
            }
            //END SEND TO TITAN
            
            //BEGIN SEND TO HUNTER
            if (! isCurrentCharHunter){
                
                strCC = @"Hunter";
                transferAction = [NSString stringWithFormat:@"Transfer to %@?",strCC];
                
            UIAlertAction *hunterAction = [UIAlertAction actionWithTitle:transferAction
                                                                    style:UIAlertActionStyleDefault
                                                                    handler:^(UIAlertAction * action) {
            NSLog(transferAction);
                
            NSString* targetCharacter = (NSString *) [hData.allKeys firstObject];
                
                //BEGIN HUNTER Notification
                [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyTransferToHunterNotification
                                object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                                                        
                                                        
                NSDictionary *respData  = (NSDictionary*) [note object],
                             *userInfo  = [note userInfo];
                                                        
                if (respData){
                                
                    NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                                                            
                    if (respStatus){
                        //Transfer to HUNTER Action was Successfull!
                        if ([respStatus isEqualToString:@"Success"]){
                                                
                            
                            NSString *strMessage = [NSString stringWithFormat:@"Transfer '%@' to %@ Result",selectedTitle,strCC];
                            
                            UIAlertController* alertHunterOk = [UIAlertController alertControllerWithTitle:strMessage
                                                message:respStatus
                                                preferredStyle:UIAlertControllerStyleAlert];
                                                
                            UIAlertAction* hunterActionOk = [UIAlertAction actionWithTitle:@"OK"
                                                style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                               
                                NSLog(@"Transfer to Hunter Action Status:[%@]",respStatus);
                                            
                                if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                    //TODO inventory refresh logic
                                }
                                            
                                if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                   WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                    [destinyWeaponsParentVC removeWeaponAction:selectedItemHash];
                                }
                                        
                                if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
                                    ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                    [destinyArmorParentVC removeArmorAction:selectedItemHash];
                                }
                             
                                                    
                            }];
                                                    
                            [alertHunterOk addAction:hunterActionOk];
                                if ( destinyItemsParentVC){
                                //Display HUNTER Transfer Item Ok
                                    [destinyItemsParentVC presentViewController:alertHunterOk animated:YES completion:nil];
                                }
                                                
                        }
                        //BEGIN Transfer to HUNTER Action Issue
                        else{
                                                
                        NSString *errorCode    = [respData objectForKey:@"ErrorCode"],
                                 *errorStatus  = [respData objectForKey:@"ErrorStatus"],
                                 *errorMessage = [respData objectForKey:@"Message"];
                        //Display Error Details
                                    
                        UIAlertController* alertHunterError = [UIAlertController alertControllerWithTitle:errorStatus
                                            message:errorMessage
                                        preferredStyle:UIAlertControllerStyleAlert];
                                                
                        UIAlertAction* hunterErrorAction = [UIAlertAction actionWithTitle:@"OK"
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                              
                                                    
                        }];
                                                
                            [alertHunterError addAction:hunterErrorAction];
                            if ( destinyItemsParentVC){
                            //Display HUNTER Transfer Item Error
                                [destinyItemsParentVC presentViewController:alertHunterError animated:YES completion:nil];
                             }
                            }
                        //END Transfer to HUNTER Action Issue
                        }
                }
                                    
                }];
                //END HUNTER Notification
                
            TRXBaseClass *payload = [[TRXBaseClass alloc] init];
            [payload setCharacterId:selectedCharacter];
            [payload setTargetCharacterId:targetCharacter];
            [payload setStackSize:1];
            [payload setMembershipType:appDelegate.currentMembershipType];
            [payload setItemId:selectedItemInstance];
            [payload setItemReferenceHash:selectedItemHash];
            [payload setTransferToVault:NO];
                        
            //BEGIN NetworkAPISingleClient transferItem API Call
            [NetworkAPISingleClient transferItem:payload
                                    completionBlock:^(NSArray *values) {
                //Json Response
                if (values){
                    //Not used
                    NSLog(@"Transfer Item to Hunter JSON Response->[%@]",values);
                }
                                
                }
                 andErrorBlock:^(NSError *exception) {
                    NSLog(@"Transfer Item to Hunter Response Exception->[%@]",exception.description);
                }];
                
            //END NetworkAPISingleClient transferItem API Call

                
            }];
            
             [alert addAction:hunterAction];
            }
            //END SEND TO HUNTER
            
            //BEGIN Equip Action
            
            transferAction = [NSString stringWithFormat:@"Equip '%@' on %@?",selectedTitle,strCharacter];
            
            UIAlertAction* equipAction = [UIAlertAction actionWithTitle:transferAction
                                                                    style:UIAlertActionStyleDefault
                handler:^(UIAlertAction * action) {
                NSLog(transferAction);
                
                [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyEquipItemNotification
                    object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                    
                    
                    NSDictionary *respData  = (NSDictionary*) [note object],
                                *userInfo  = [note userInfo];
                    
                    
                    if (respData){
                    
                        NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                        
                        if (respStatus){
                            //Equip Action was Successfull!
                            if ([respStatus isEqualToString:@"Success"]){
                                                                
                                NSString *strMessage = [NSString stringWithFormat:@"Equip '%@' on %@ Result",selectedTitle,strCharacter];
                                
                                UIAlertController* alertEquipOk = [UIAlertController alertControllerWithTitle:strMessage
                                                                message:respStatus
                                                                preferredStyle:UIAlertControllerStyleAlert];
                                
                                UIAlertAction* equipActionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                    
                                    NSLog(@"[%@]:Equip on %@ Action Response:[%@]",selectedTitle, strCharacter, respStatus);
                                    
                                   
                                        if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                            //TODO:Refresh Items Logic
                                        }
                                        
                                        if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                            WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                            if (destinyWeaponsParentVC){
                                                [destinyWeaponsParentVC refreshEquippedWeaponAction:selectedItemHash];
                                            }
                                        }
                                            
                                        if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
                                            ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                           
                                            if (destinyArmorParentVC){
                                                [destinyArmorParentVC refreshEquippedArmorAction:selectedItemHash];
                                            }
                                        }
                                        
                                
                                    
                                }];
                                
                                [alertEquipOk addAction:equipActionOk];
                                if ( destinyItemsParentVC){
                                    [destinyItemsParentVC presentViewController:alertEquipOk animated:YES completion:nil];
                                }
                                
                            }
                            //Equip Action Issue
                            else{
                                
                                NSString *errorCode = [respData objectForKey:@"ErrorCode"],
                                        *errorStatus = [respData objectForKey:@"ErrorStatus"],
                                        *errorMessage = [respData objectForKey:@"Message"];
                                
    
                                
                                UIAlertController* alertEquipError = [UIAlertController alertControllerWithTitle:errorStatus
                                                                message:errorMessage
                                                                preferredStyle:UIAlertControllerStyleAlert];
                                
                                UIAlertAction* equipActionError = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                    NSLog(@"%@-%@",errorCode,errorStatus);
                                    
                                }];
                                
                                
                                [alertEquipError addAction:equipActionError];
                                if ( destinyItemsParentVC){
                                    [destinyItemsParentVC presentViewController:alertEquipError animated:YES completion:nil];
                                }
                            }
                        }
                    }
                }];
                    
                EQXBaseClass *payload = [[EQXBaseClass alloc] init];
                [payload setCharacterId:selectedCharacter];
                [payload setMembershipType:appDelegate.currentMembershipType];
                [payload setItemId:selectedItemInstance];
                    
                NSDictionary *dictData = [[NSDictionary alloc] initWithDictionary: [payload dictionaryRepresentation]];
                    
                NSArray *arrayData = [NSArray arrayWithObject:payload.dictionaryRepresentation];
                    
                payload  = nil;
                    
                NSError *writeError = nil;
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrayData options:NSJSONReadingMutableContainers
                                                                        error:&writeError];
                    
                NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                                encoding:NSUTF8StringEncoding];
                NSLog(@"JSON Output: %@", jsonString);
                    
                [NetworkAPISingleClient equipItem:jsonString
                                        completionBlock:^(NSArray *values) {
                    
                    //Json Response
                    if (values){
                        //Not used
                        NSLog(@"Equip [%] on %@:{JSON Response->[%@]}",selectedTitle,strCharacter, values);
                    }
                                    
                    }
                     andErrorBlock:^(NSError *exception) {
                        NSLog(@"Equip [%] on %@:{Response Exception->[%@]}",selectedTitle,strCharacter, exception.description);
                    }];
                
                
            }];
            //END Equip Action
            
            //BEGIN SEND TO VAULT

            transferAction = [NSString stringWithFormat:@"Send '%@' on %@ to Vault?",selectedTitle,strCharacter];
    
             UIAlertAction* sendToVaultAction = [UIAlertAction actionWithTitle: transferAction style:UIAlertActionStyleDefault
                handler:^(UIAlertAction * action) {
                 NSLog(transferAction);
                 
                 
                 [[NSNotificationCenter defaultCenter] addObserverForName:kDestinySendToVaultNotification
                     object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                     
                     
                     NSDictionary *respData  = (NSDictionary*) [note object],
                                  *userInfo  = [note userInfo];
                     
                     
                     if (respData){
                      
                         NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                         
                         if (respStatus){
                             //SendToVault Action was Successfull!
                             if ([respStatus isEqualToString:@"Success"]){

                                NSString *strMessage = [NSString stringWithFormat:@"Send ‘%@‘ on %@ to Vault Result",selectedTitle,strCC];
                                 
                                 UIAlertController* alertSendToVaultOk = [UIAlertController alertControllerWithTitle: strMessage
                                                                message:respStatus
                                                                preferredStyle:UIAlertControllerStyleAlert];
                                 
                                 UIAlertAction* sendToVaultOkAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {

                                       NSLog(@"[%@]:Transfer to Vault From %@ Action Response:[%@]",selectedTitle, strCharacter, respStatus);
                                     
                                      if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                         //TODO:Refresh Items Logic
                                     }
                                     
                                     if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                         WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                        [destinyWeaponsParentVC removeWeaponAction:selectedItemHash];
                                    }
                                         
                                         
                                     if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
         
                                         ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                        
                                         if (destinyArmorParentVC){
                                             [destinyArmorParentVC removeArmorAction:selectedItemHash];
                                         }
                                     }
                                      
                                 }];
                                 
                                 [alertSendToVaultOk addAction:sendToVaultOkAction];
                                 if ( destinyItemsParentVC){
                                     [destinyItemsParentVC presentViewController: alertSendToVaultOk animated:YES completion:nil];
                                 }
                                
                             }
                             //SendToVault Action Issue
                             else{
                                 
                                 NSString *errorCode    = [respData objectForKey:@"ErrorCode"],
                                          *errorStatus  = [respData objectForKey:@"ErrorStatus"],
                                          *errorMessage = [respData objectForKey:@"Message"];
                                 
                                 /* ErrorCode = 1656;
                                  ErrorStatus = DestinyCannotPerformActionOnEquippedItem;
                                  Message = "You cannot perform this action on an equipped item.";
                                  MessageData =     {
                                  };
                                  Response = 0;
                                  ThrottleSeconds = 0;*/
                                 
                                 UIAlertController* sendToVaultAlertError = [UIAlertController alertControllerWithTitle:errorStatus
                                                                message:errorMessage
                                                                preferredStyle:UIAlertControllerStyleAlert];
                                 
                                 UIAlertAction* sendToVaultActionError = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                     NSLog(@"%@-%@",errorCode,errorStatus);
                                     
                                     
                                 }];
                                 
                               
                                 [sendToVaultAlertError addAction: sendToVaultActionError];
                                 if ( destinyItemsParentVC){
                                     [destinyItemsParentVC presentViewController: sendToVaultAlertError animated:YES completion:nil];
                                 }
                             }
                       }
                     }
                 }];
                 
                     
                     TRXBaseClass *payload = [[TRXBaseClass alloc] init];
                     [payload setCharacterId:selectedCharacter];
                     [payload setStackSize:1];
                     [payload setMembershipType:appDelegate.currentMembershipType];
                     [payload setItemId:selectedItemInstance];
                     [payload setItemReferenceHash:selectedItemHash];
                     [payload setTransferToVault:YES];
                    
                     NSDictionary *dictData = [[NSDictionary alloc] initWithDictionary: [payload dictionaryRepresentation]];
                     
                     NSArray *arrayData = [NSArray arrayWithObject:payload.dictionaryRepresentation];
                     
                     payload  = nil;
                     
                     NSError *writeError = nil;
                     NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrayData options:NSJSONReadingMutableContainers
                                                                          error:&writeError];
                     
                     NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                                  encoding:NSUTF8StringEncoding];
                     NSLog(@"JSON Output: %@", jsonString);
                     
                     [NetworkAPISingleClient sendItemToVault:jsonString
                                             completionBlock:^(NSArray *values) {
                         
                         if (values){
                             //Not used
                             NSLog(@"sendItemToVault:Completion=%@",values);
                         }
                         
                         
                     } andErrorBlock:^(NSError *exception) {
                         NSLog(@"ItemCellTableView:lockStateAction:Exception->%@",exception.description);
                     }];
                     
                  
             }];
             
             //END SEND TO VAULT
            
            
            //BEGIN Lock Action
            
            transferAction = [NSString stringWithFormat:@"Lock '%@' on %@ ?",selectedTitle,strCharacter];
            BOOL bLockAction = YES;
            NSString *strLocked = @"1";
            
            if ([selectedCell.btnLockAction.currentImage isEqual:lockImage]){
                transferAction = [NSString stringWithFormat:@"Unlock '%@' on %@ ?",selectedTitle,strCharacter];
                bLockAction = NO;
                strLocked = @"0";
            }
            
            
            UIAlertAction* lockAction = [UIAlertAction actionWithTitle:transferAction style:UIAlertActionStyleDefault
               handler:^(UIAlertAction * action) {
                NSLog(transferAction);
                
                
                [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLockItemStateNotification
                    object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                    
                    
                    NSDictionary *respData  = (NSDictionary*) [note object],
                                 *userInfo  = [note userInfo];
                    
                    
                    if (respData){
                     
                        NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                        
                        if (respStatus){
                            if ([respStatus isEqualToString:@"Success"]){
                              
                                NSString *strMessage = [transferAction stringByReplacingOccurrencesOfString:@"?" withString:@"Result"];
                                 
                                 UIAlertController* alertLockItemOk = [UIAlertController alertControllerWithTitle: strMessage
                                                                message:respStatus
                                                                preferredStyle:UIAlertControllerStyleAlert];
                                 
                                 UIAlertAction* lockItemOkAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {

                                       NSLog(@"[%@]:Lock Item On %@ Action Response:[%@]",selectedTitle, strCharacter, respStatus);
                                     
                                      if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                         //TODO:Refresh Items Logic
                                     }
                                     
                                     if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                         WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                        [destinyWeaponsParentVC refreshLockedWeaponAction:selectedItemHash];
                                    }
                                         
                                         
                                     if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
         
                                         ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                        
                                         if (destinyArmorParentVC){
                                             [destinyArmorParentVC refreshLockedArmorAction:selectedItemHash];
                                         }
                                     }
                                      
                                 }];
                                 
                                 [alertLockItemOk addAction:lockItemOkAction];
                                 if ( destinyItemsParentVC){
                                     [destinyItemsParentVC presentViewController: alertLockItemOk animated:YES completion:nil];
                                 }
                                
                                
                                 
                           }
                      }
                    }
                }];
                
                    
                    LCKBaseClass *payload = [[LCKBaseClass alloc] init];
                    [payload setCharacterId:selectedCharacter];
                    [payload setState:bLockAction];
                    [payload setMembershipType:appDelegate.currentMembershipType];
                    [payload setItemId:selectedItemInstance];
                   
                    NSDictionary *dictData = [[NSDictionary alloc] initWithDictionary: [payload dictionaryRepresentation]];
                    
                    NSArray *arrayData = [NSArray arrayWithObject:payload.dictionaryRepresentation];
                    
                    payload  = nil;
                    
                    NSError *writeError = nil;
                    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrayData options:NSJSONReadingMutableContainers
                                                                         error:&writeError];
                    
                    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                                 encoding:NSUTF8StringEncoding];
                    NSLog(@"JSON Output: %@", jsonString);
                    
                    [NetworkAPISingleClient lockStateItem:jsonString
                                            completionBlock:^(NSArray *values) {
                        
                        if (values){
                            //Not used
                        }
                        
                        
                    } andErrorBlock:^(NSError *exception) {
                        NSLog(@"ItemCellTableView:lockStateAction:Exception->%@",exception.description);
                    }];
                    
                 
            }];
 
            //END Lock Action
            
            
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                                    style:UIAlertActionStyleCancel
                handler:^(UIAlertAction * action) {
                NSLog(@"ItemCellTableView:transferItem:Cancelled Clicked");
                }];

            [alert addAction:equipAction];
            [alert addAction:sendToVaultAction];
            [alert addAction:lockAction];
            [alert addAction:cancelAction];
            
            if ( destinyItemsParentVC){
                [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
            }
            
            
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"ItemCellTableView:transferItem:Exception->%@",exception.description);
    } @finally {
        destinyItemsParentVC = nil;
        
        selectedTitle        = nil;
        selectedItemHash     = nil;
        selectedItemInstance = nil;
        selectedCharacter    = nil;
        
        selectedCell = nil;
        
        destinyItemsParentVC = nil;
        
        appDelegate = nil;

        lockImage = nil;
        
        indexPath = nil;
    }
    
}

- (IBAction)sendVaultAction:(id)sender {
    
    
    NSString *selectedTitle        = @"",
             *selectedItemHash     = @"",
             *selectedItemInstance = @"",
             *selectedCharacter    = @"",
             *vaultAction          = @"Send to Vault",
             *strIdx               = @"";
    
    ItemCellTableView *selectedCell = nil;
    
    ItemsViewController *destinyItemsParentVC = nil;
    
    AppDelegate *appDelegate = nil;
    
    
    UIImage *lockImage = [UIImage systemImageNamed:@"lock"];
    
    NSIndexPath *indexPath = nil;
    @try {
        
        if (! self.parentTableView){
            return;
        }
        
        if ([self.parentTableView isKindOfClass:[UITableView class]]){
            indexPath =  [self.parentTableView indexPathForSelectedRow];
            
                if (! indexPath){
                    return;
                }
            
            strIdx = [NSString stringWithFormat:@"%d",indexPath.row ];
        }
        
        if (! self.parentViewController){
            return;
        }
        
        if ([self.parentViewController isKindOfClass:[ItemsViewController class]]){
          destinyItemsParentVC = (ItemsViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[WeaponsTableViewController class]]){
          destinyItemsParentVC = (WeaponsTableViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[ArmorTableViewController class]]){
          destinyItemsParentVC = (ArmorTableViewController*) self.parentViewController;
        }
        
        if (!appDelegate){
            appDelegate = [AppDelegate currentDelegate];
        }
        
        selectedCell = (ItemCellTableView*) [self.parentTableView cellForRowAtIndexPath:indexPath];
        
       
        if(selectedCell){
            
            selectedTitle = selectedCell.lblItemName.text;
            
            selectedItemHash = [selectedCell.lblHash text];
            
            selectedItemInstance = [selectedCell.lblInstanceId text];
            
            selectedCharacter  = [selectedCell.lblCharacterId text];
            
  
            if (selectedItemHash){
                
                
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:vaultAction
                                               message:[NSString stringWithFormat:@"Send %@ To Vault?",selectedTitle]
                                               preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                   handler:^(UIAlertAction * action) {
                    NSLog(vaultAction);
                    
                    
                    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinySendToVaultNotification
                        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                        
                        
                        NSDictionary *respData  = (NSDictionary*) [note object],
                                     *userInfo  = [note userInfo];
                        
                        
                        if (respData){
                         
                            NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                            
                            if (respStatus){
                                //SendToVault Action was Successfull!
                                if ([respStatus isEqualToString:@"Success"]){
                                    
                                    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Send to Vault Action"
                                                                   message:@"SendToVault Action was Successfull!"
                                                                   preferredStyle:UIAlertControllerStyleAlert];
                                    
                                    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action) {
                                        NSLog(@"%@-",respStatus);
                                        
                                    
                                        if (destinyItemsParentVC){
                                            
                                            if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                                [destinyItemsParentVC refreshItems:selectedItemHash];
                                            }
                                            
                                            if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                                WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                                if (destinyWeaponsParentVC){
                                                    [destinyWeaponsParentVC removeWeaponAction:selectedItemHash];
                                                }
                                            }
                                                
                                            if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
                                                ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                               
                                                if (destinyArmorParentVC){
                                                    [destinyArmorParentVC removeArmorAction:selectedItemHash];
                                                }
                                            }
                                            
                                        }
                                         
                                    }];
                                    
                                    
                                    [alert addAction:defaultAction];
                                    if ( destinyItemsParentVC){
                                        [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
                                    }
                                   
                                }
                                //SendToVault Action Issue
                                else{
                                    
                                    NSString *errorCode = [respData objectForKey:@"ErrorCode"],
                                             *errorStatus = [respData objectForKey:@"ErrorStatus"],
                                             *errorMessage = [respData objectForKey:@"Message"];
                                    
                                    /* ErrorCode = 1656;
                                     ErrorStatus = DestinyCannotPerformActionOnEquippedItem;
                                     Message = "You cannot perform this action on an equipped item.";
                                     MessageData =     {
                                     };
                                     Response = 0;
                                     ThrottleSeconds = 0;*/
                                    
                                    
                                    UIAlertController* alert = [UIAlertController alertControllerWithTitle:errorStatus
                                                                   message:errorMessage
                                                                   preferredStyle:UIAlertControllerStyleAlert];
                                    
                                    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action) {
                                        NSLog(@"%@-%@",errorCode,errorStatus);
                                        
                                        
                                         
                                    }];
                                    
                                  
                                    
                                    [alert addAction:defaultAction];
                                    if ( destinyItemsParentVC){
                                        [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
                                    }
                                }
                          }
                        }
                    }];
                    
                        
                        TRXBaseClass *payload = [[TRXBaseClass alloc] init];
                        [payload setCharacterId:selectedCharacter];
                        [payload setStackSize:1];
                        [payload setMembershipType:appDelegate.currentMembershipType];
                        [payload setItemId:selectedItemInstance];
                        [payload setItemReferenceHash:selectedItemHash];
                        [payload setTransferToVault:YES];
                       
                        NSDictionary *dictData = [[NSDictionary alloc] initWithDictionary: [payload dictionaryRepresentation]];
                        
                        NSArray *arrayData = [NSArray arrayWithObject:payload.dictionaryRepresentation];
                        
                        payload  = nil;
                        
                        NSError *writeError = nil;
                        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrayData options:NSJSONReadingMutableContainers
                                                                             error:&writeError];
                        
                        NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                                     encoding:NSUTF8StringEncoding];
                        NSLog(@"JSON Output: %@", jsonString);
                        
                        [NetworkAPISingleClient sendItemToVault:jsonString
                                                completionBlock:^(NSArray *values) {
                            
                            if (values){
                                //Not used
                                NSLog(@"sendItemToVault:Completion=%@",values);
                            }
                            
                            
                        } andErrorBlock:^(NSError *exception) {
                            NSLog(@"ItemCellTableView:lockStateAction:Exception->%@",exception.description);
                        }];
                        
                     
                }];
                
                UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                   handler:^(UIAlertAction * action) {
                    NSLog(@"ItemCellTableView:sendVaultAction:Cancelled Clicked");
                }];
                
                [alert addAction:defaultAction];
                [alert addAction:cancelAction];
                if ( destinyItemsParentVC){
                    [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
                }
                
            }
            

        }
        
        
    } @catch (NSException *exception) {
        NSLog(@"ItemCellTableView:sendVaultAction:Exception->%@",exception.description);
    } @finally {
        destinyItemsParentVC = nil;
        
        selectedTitle        = nil;
        selectedItemHash     = nil;
        selectedItemInstance = nil;
        selectedCharacter    = nil;
        
        selectedCell = nil;
        
        destinyItemsParentVC = nil;
        
        appDelegate = nil;

        lockImage = nil;
        
        indexPath = nil;
    }
    
    
    
}

- (IBAction)lockStateAction:(id)sender {
        
    NSString *selectedTitle        = @"",
             *selectedItemHash     = @"",
             *selectedItemInstance = @"",
             *selectedCharacter    = @"",
             *lockAction           = @"Item Lock Action",
             *strIdx               = @"",
             *strLocked            = @"1";
    
    ItemCellTableView *selectedCell = nil;
    
    UIViewController *destinyItemsParentVC = nil;
    
    AppDelegate *appDelegate = nil;
    
    BOOL bLockAction = YES;
    
    UIImage *lockImage = [UIImage systemImageNamed:@"lock"];
    
    NSIndexPath *indexPath = nil;
    @try {
        
        if (! self.parentTableView){
            return;
        }
        
        if ([self.parentTableView isKindOfClass:[UITableView class]]){
            indexPath =  [self.parentTableView indexPathForSelectedRow];
            
                if (! indexPath){
                    return;
                }
            
            strIdx = [NSString stringWithFormat:@"%d",indexPath.row ];
        }
        
        if (! self.parentViewController){
            return;
        }
        
        if ([self.parentViewController isKindOfClass:[ItemsViewController class]]){
          destinyItemsParentVC = (ItemsViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[WeaponsTableViewController class]]){
          destinyItemsParentVC = (WeaponsTableViewController*) self.parentViewController;
        }
        
        if ([self.parentViewController isKindOfClass:[ArmorTableViewController class]]){
          destinyItemsParentVC = (ArmorTableViewController*) self.parentViewController;
        }
        
        
        if (!appDelegate){
            appDelegate = [AppDelegate currentDelegate];
        }
        
        selectedCell = (ItemCellTableView*) [self.parentTableView cellForRowAtIndexPath:indexPath];
        
        if(selectedCell){
            
            selectedTitle = selectedCell.lblItemName.text;
            
            selectedItemHash = [selectedCell.lblHash text];
            
            selectedItemInstance = [selectedCell.lblInstanceId text];
            
            selectedCharacter  = [selectedCell.lblCharacterId text];
            
            if (selectedItemHash){
                
                
                if ([selectedCell.btnLockAction.currentImage isEqual:lockImage]){
                    lockAction = @"Item Unlock Action";
                    bLockAction = NO;
                    strLocked = @"0";
                }
                
                
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:lockAction
                                               message:[NSString stringWithFormat:@"%@",selectedTitle]
                                               preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                   handler:^(UIAlertAction * action) {
                    NSLog(lockAction);
                    
                    
                    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLockItemStateNotification
                        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                        
                        
                        NSDictionary *respData  = (NSDictionary*) [note object],
                                     *userInfo  = [note userInfo];
                        
                        
                        if (respData){
                         
                            NSString *respStatus = [respData objectForKey:@"ErrorStatus"];
                            
                            if (respStatus){
                                if ([respStatus isEqualToString:@"Success"]){
                                    
                                     
                                     UIAlertController* alertLockItemOk = [UIAlertController alertControllerWithTitle: lockAction
                                                                    message:respStatus
                                                                    preferredStyle:UIAlertControllerStyleAlert];
                                     
                                     UIAlertAction* lockItemOkAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction * action) {

                                        
                                          if ([destinyItemsParentVC isKindOfClass:[ItemsViewController class]]){
                                             //TODO:Refresh Items Logic
                                         }
                                         
                                         if ([destinyItemsParentVC isKindOfClass:[WeaponsTableViewController class]]){
                                             WeaponsTableViewController *destinyWeaponsParentVC = (WeaponsTableViewController*) destinyItemsParentVC;
                                            [destinyWeaponsParentVC refreshLockedWeaponAction:selectedItemHash];
                                        }
                                             
                                             
                                         if ([destinyItemsParentVC isKindOfClass:[ArmorTableViewController class]]){
             
                                             ArmorTableViewController *destinyArmorParentVC = (ArmorTableViewController*) destinyItemsParentVC;
                                            
                                             if (destinyArmorParentVC){
                                                 [destinyArmorParentVC refreshLockedArmorAction:selectedItemHash];
                                             }
                                         }
                                          
                                     }];
                                     
                                     [alertLockItemOk addAction:lockItemOkAction];
                                     if ( destinyItemsParentVC){
                                         [destinyItemsParentVC presentViewController: alertLockItemOk animated:YES completion:nil];
                                     }
                                    
                                     
                               }
                          }
                        }
                    }];
                    
                        
                        LCKBaseClass *payload = [[LCKBaseClass alloc] init];
                        [payload setCharacterId:selectedCharacter];
                        [payload setState:bLockAction];
                        [payload setMembershipType:appDelegate.currentMembershipType];
                        [payload setItemId:selectedItemInstance];
                       
                        NSDictionary *dictData = [[NSDictionary alloc] initWithDictionary: [payload dictionaryRepresentation]];
                        
                        NSArray *arrayData = [NSArray arrayWithObject:payload.dictionaryRepresentation];
                        
                        payload  = nil;
                        
                        NSError *writeError = nil;
                        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrayData options:NSJSONReadingMutableContainers
                                                                             error:&writeError];
                        
                        NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                                     encoding:NSUTF8StringEncoding];
                        NSLog(@"JSON Output: %@", jsonString);
                        
                        [NetworkAPISingleClient lockStateItem:jsonString
                                                completionBlock:^(NSArray *values) {
                            
                            if (values){
                                //Not used
                            }
                            
                            
                        } andErrorBlock:^(NSError *exception) {
                            NSLog(@"ItemCellTableView:lockStateAction:Exception->%@",exception.description);
                        }];
                        
                     
                }];
                
                UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                   handler:^(UIAlertAction * action) {
                    NSLog(@"ItemCellTableView:lockStateAction:Cancelled Clicked");
                }];
                
                [alert addAction:defaultAction];
                [alert addAction:cancelAction];
                if ( destinyItemsParentVC){
                    [destinyItemsParentVC presentViewController:alert animated:YES completion:nil];
                }
                
            }
            

        }
        
        
    } @catch (NSException *exception) {
        NSLog(@"ItemCellTableView:lockStateAction:Exception->%@",exception.description);
    } @finally {
        destinyItemsParentVC = nil;
        
        selectedTitle        = nil;
        selectedItemHash     = nil;
        selectedItemInstance = nil;
        selectedCharacter    = nil;
        lockAction           = nil;
        
        selectedCell = nil;
        
        destinyItemsParentVC = nil;
        
        appDelegate = nil;
        
        bLockAction = NO;
        
        lockImage = nil;
        
        indexPath = nil;
    }
    

    
}
@end
