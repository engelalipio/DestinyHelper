//
//  GuardianViewController.h
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
 

@interface GuardianViewController : UIViewController<UITabBarDelegate,UITableViewDataSource>


@property (strong, nonatomic) IBOutlet UISegmentedControl *segCategories;

@property (weak, nonatomic) IBOutlet UILabel *lblPlayerName;
@property (weak, nonatomic) IBOutlet UILabel *lblPlayerMotto;
@property (weak, nonatomic) IBOutlet UILabel *lblMembershipId;


@property (weak, nonatomic) IBOutlet UILabel *lblFirstAccessed;
@property (weak, nonatomic) IBOutlet UILabel *lblLastAccessed;

@property (strong, nonatomic) IBOutlet UITableView *tblChars;


@property (nonatomic, strong) dispatch_queue_t syncQueue;

@property (weak, nonatomic) IBOutlet UIImageView *imgPlayerLogo;
@property (weak, nonatomic) IBOutlet UIImageView *imgPlayerBG;

@property (strong, nonatomic) IBOutlet UIButton *btnClose;

- (IBAction)closeAction:(UIBarButtonItem *)sender;

- (IBAction)categoryActionChanged:(UISegmentedControl *)sender;


@property (nonatomic,strong) NSTimer   *timer;
@property (nonatomic,strong) NSRunLoop *loop;
@property (nonatomic,strong) NSArray   *destChars;
@property (nonatomic,strong) NSArray   *destPublicVendors;
@property (nonatomic,strong) NSArray   *memberships;
@property (nonatomic,strong) NSMutableArray   *clans;

-(void) startTimer;
-(void) endTimer;
 
-(void) refreshCharacterEquipment;

@end

 
