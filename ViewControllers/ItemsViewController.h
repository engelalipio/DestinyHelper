//
//  GuardianViewController.h
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
 

@interface ItemsViewController : UIViewController<UITabBarDelegate,UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UILabel *lblPlayerName;
@property (weak, nonatomic) IBOutlet UILabel *lblPlayerMotto;
@property (weak, nonatomic) IBOutlet UILabel *lblMembershipId;

@property (weak, nonatomic) IBOutlet UILabel *lblFirstAccessed;
@property (weak, nonatomic) IBOutlet UILabel *lblLastAccessed;

@property (strong, nonatomic) IBOutlet UITableView *tblItems;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segCategories;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *progressIndicator;

@property (weak, nonatomic) IBOutlet UIImageView *imgPlayerLogo;
@property (weak, nonatomic) IBOutlet UIImageView *imgItemScreenShot;

@property (strong, nonatomic) IBOutlet UIButton *btnClose;

- (IBAction)closeAction:(UIBarButtonItem *)sender;
- (IBAction)categoryChangedAction:(UISegmentedControl *)sender;

@property (nonatomic,strong) NSTimer   *timer;
@property (nonatomic,strong) NSRunLoop *loop;
@property (nonatomic,strong) NSMutableDictionary  *destChars;
@property (nonatomic,strong) NSString  *selectedChar;
@property (nonatomic,strong) NSString  *selectedMembership;



-(void) startTimer;
-(void) endTimer;
-(void) loadItems;
-(void) refreshItems;

@end

 
