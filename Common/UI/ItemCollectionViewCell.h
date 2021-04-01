//
//  ItemCollectionViewCell.h
//  DestinyHelper
//
//  Created by Bertle on 3/25/21.
//  Copyright © 2021 Agile Mobile Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

 

@interface ItemCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgItemBurn;

@property (strong, nonatomic) IBOutlet UIImageView *imgItem;
@property (strong, nonatomic) IBOutlet UIImageView *imgBackground;
@property (strong, nonatomic) IBOutlet UILabel *lblItemName;
@property (strong, nonatomic) IBOutlet UILabel *lblDamageType;
@property (strong, nonatomic) IBOutlet UILabel *lblMisc;
@property (strong, nonatomic) IBOutlet UILabel *lblHash;
@property (strong, nonatomic) IBOutlet UILabel *lblItemType;
@property (strong, nonatomic) IBOutlet UIImageView *imgCareer;
@property (strong, nonatomic) IBOutlet UILabel *lblCharacterId;
@property (strong, nonatomic) IBOutlet UILabel *lblInstanceId;
@property (strong, nonatomic) IBOutlet UILabel *lblPowerLevel;
 
@property (strong, nonatomic) IBOutlet UIButton *btnLockAction;

@property (strong, nonatomic) IBOutlet UIButton *btnSendVault;

@property (weak) UITableView *parentTableView;
@property (weak) UICollectionView *parentCollectionView;
@property (weak) UIViewController *parentViewController;

- (IBAction)lockStateAction:(id)sender;

- (IBAction)sendVaultAction:(id)sender;


@end

 
