//
//  ArmorTableViewController.h
//  DestinyHelper
//
//  Created by Bertle on 3/19/21.
//  Copyright © 2021 Agile Mobile Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

 

@interface ArmorTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableDictionary  *destArmor;
@property (nonatomic,strong) NSArray   *destArmorBuckets;
@property (nonatomic,strong) NSString  *selectedChar;
@property (nonatomic,strong) NSString  *selectedMembership;
@property (nonatomic,strong) UIImageView  *selectedCharEmblem;
@property (nonatomic,strong) NSMutableDictionary *destChars;
@property (nonatomic,strong) UIViewController *parentVC;

-(void) closeAction;
-(void) loadArmor;

- (void)removeArmorAction:(NSString *) armorHash;
- (void)refreshEquippedArmorAction:(NSString *) armorHash;
- (void)refreshLockedArmorAction:(NSString *) armorHash;
@end

 
