//
//  WeaponsTableViewController.h
//  DestinyHelper
//
//  Created by Bertle on 3/19/21.
//  Copyright © 2021 Agile Mobile Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WeaponsTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource,
UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UISegmentedControl *segTableView;

@property (nonatomic,strong) NSMutableDictionary  *selectedCharData;
@property (nonatomic,strong) NSMutableDictionary  *destWeapons;
@property (nonatomic,strong) NSMutableDictionary *destChars;
@property (nonatomic,strong) NSArray   *destWeaponBuckets;
@property (nonatomic,strong) NSString  *selectedChar;
@property (nonatomic,strong) UIImageView  *selectedCharEmblem;
@property (nonatomic,strong) NSString  *selectedMembership;
@property (nonatomic,strong) UIViewController *parentVC;

- (void)closeAction;
- (void)loadWeapons;
- (void)removeWeaponAction:(NSString *) weaponHash;
- (void)refreshEquippedWeaponAction:(NSString *) weaponHash;
- (void)refreshLockedWeaponAction:(NSString *) weaponHash;

- (IBAction)toggleTableAction:(UISegmentedControl *)sender;

@end

 
