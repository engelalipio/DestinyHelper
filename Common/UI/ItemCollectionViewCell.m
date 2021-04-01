//
//  ItemCollectionViewCell.m
//  DestinyHelper
//
//  Created by Bertle on 3/25/21.
//  Copyright © 2021 Agile Mobile Solutions. All rights reserved.
//

#import "ItemCollectionViewCell.h"
#import "Utilities.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "NetworkAPISingleClient+LinkedProfiles.h"
#import "NetworkAPISingleClient+Definition.h"
#import "ItemsViewController.h"
#import "WeaponsTableViewController.h"
#import "ArmorTableViewController.h"
#import "UIImageView+AFNetworking.h"

@implementation ItemCollectionViewCell

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
@synthesize parentCollectionView = _parentCollectionView;
@synthesize imgItemBurn = _imgItemBurn;

-(id) initWithFrame:(CGRect)frame{
    
   self = [super initWithFrame:frame];
   
    if (self) {
        
        [self.backgroundView setBackgroundColor:[UIColor blackColor]];
       
        // Initialization code
        CGRect cFrame = self.contentView.frame;
        
        CGSize size =  CGSizeMake(80, 80);
        
        if (! self.imgItem){
              UIImage *defaultImage = [UIImage imageNamed:@"WeaponFrame.png"];
            
              defaultImage = [Utilities imageResize:defaultImage andResizeTo:size];
              
              self.imgItem = [[UIImageView alloc] initWithImage:defaultImage];
              
              [self.contentView addSubview:self.imgItem];
          }
        
        if (! self.imgCareer){
            UIImage *defaultImage = [UIImage imageNamed:@"WeaponFrame.png"];
          
            defaultImage = [Utilities imageResize:defaultImage andResizeTo:size];
            
             self.imgCareer = [[UIImageView alloc] initWithImage:defaultImage];
              
              [self.contentView addSubview:self.imgCareer];
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
          
        if (! self.imgItemBurn){
              UIImage *defaultImage = [UIImage imageNamed:@"damage_kinetic.png"];
              
              defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(20  , 15)];
            
              self.imgBackground = [[UIImageView alloc] initWithImage:defaultImage];
              
              [self.imgBackground setFrame:cFrame];
              
              [self.contentView addSubview:self.imgBackground];
          }
        
      if (! self.imgBackground){
            UIImage *defaultImage = [UIImage imageNamed:@"heavyAmmo.png"];
            
            defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(20  , 15)];
          
            self.imgBackground = [[UIImageView alloc] initWithImage:defaultImage];
            
            [self.imgBackground setFrame:cFrame];
            
            [self.contentView addSubview:self.imgBackground];
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

 

- (IBAction)lockStateAction:(id)sender{
    
}

- (IBAction)sendVaultAction:(id)sender{
    
}

@end
