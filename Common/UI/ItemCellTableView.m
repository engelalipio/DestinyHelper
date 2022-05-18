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
        
        if (! self.lblItemName){
            
            self.lblItemName = [[UILabel alloc] init];
            [self.lblItemName setTextColor:[UIColor whiteColor]];
            [self.lblItemName setText:@""];
            
            [self.contentView addSubview:self.lblItemName];
        }
        
        if (! self.lblItemType){
            
            self.lblItemType = [[UILabel alloc] init];
            [self.lblItemType setTextColor:[UIColor darkGrayColor]];
            [self.lblItemType setText:@""];
            
            [self.contentView addSubview:self.lblItemType];
        }
        
        if (! self.lblDamageType){
            
            self.lblDamageType = [[UILabel alloc] init];
            [self.lblDamageType setTextColor:[UIColor lightGrayColor]];
            [self.lblDamageType setText:@""];
            
            [self.contentView addSubview:self.lblDamageType];
        }
        
        
        if (! self.lblPowerLevel){
            
            self.lblPowerLevel = [[UILabel alloc] init];
            [self.lblPowerLevel setTextColor:[UIColor yellowColor]];
            [self.lblPowerLevel setText:@""];
            
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
            
            [self.contentView addSubview:self.lblInstanceId];
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


- (IBAction)sendVaultAction:(id)sender {
    
    
    NSString *selectedTitle        = @"",
             *selectedItemHash     = @"",
             *selectedItemInstance = @"",
             *selectedCharacter    = @"",
             *vaultAction           = @"Send to Vault",
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
                                                [destinyItemsParentVC refreshItems];
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
                                    
                                    
                                    [NetworkAPISingleClient retrieveStaticEntityDefinitionByManifestType:@"DestinyInventoryItemDefinition" staticHashId:selectedItemHash completionBlock:^(NSArray *values) {
                                        
                                        if (values){
                                          
                                        NSLog(@"ItemCellViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Received->%@",selectedItemHash);
                                              
                                        INVDDestinyInventoryBaseClass *invItem = (INVDDestinyInventoryBaseClass *) [values firstObject];
                                        
                                        NSDictionary *callerInfo = [[NSDictionary alloc]
                                                          initWithObjectsAndKeys:@"ItemCellViewController",@"ClassName",
                                                          @"getStaticItem",@"MethodName",
                                                          strIdx,@"CurrentIndex",
                                                          strLocked, @"LockState",
                                                          selectedItemHash, @"itemHashKey",nil];
                                              
                                        [[NSNotificationCenter defaultCenter]
                                                postNotificationName:kDestinyLoadedStaticItemNotification
                                                              object:invItem
                                                                userInfo:callerInfo];
                                            
                                        NSLog(@"ItemCellViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Raised->%@",selectedItemHash);
                                        
                                        }
                                        
                                    } andErrorBlock:^(NSError *exception) {
                                     NSLog(@"ItemCellViewController:retrieveStaticEntityDefinitionByManifestType:loadItems:Exception->%@",exception.description);
                                    }];
                                    
                                     
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
