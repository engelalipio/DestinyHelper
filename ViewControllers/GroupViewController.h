//
//  GroupViewController.h
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NetworkAPISingleClient+Clan.h"
#import <SafariServices/SafariServices.h>
#import <AuthenticationServices/AuthenticationServices.h>

@interface GroupViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,
UISearchBarDelegate,UISearchDisplayDelegate,ASWebAuthenticationPresentationContextProviding>

@property (strong, nonatomic) IBOutlet UIButton *btnLogin;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (weak, nonatomic) IBOutlet UILabel *lblPlayerName;
@property (weak, nonatomic) IBOutlet UILabel *lblPlayerMotto;
@property (weak, nonatomic) IBOutlet UILabel *lblMembershipId;

@property (weak, nonatomic) IBOutlet UILabel *lblFirstAccessed;
@property (weak, nonatomic) IBOutlet UILabel *lblLastAccessed;

@property (strong, nonatomic) IBOutlet UITableView *tblGroups;


@property (weak, nonatomic) IBOutlet UIImageView *imgPlayerLogo;
@property (weak, nonatomic) IBOutlet UIImageView *imgPlayerBG;


@property (nonatomic,strong) NSTimer   *timer;
@property (nonatomic,strong) NSRunLoop *loop;

-(void) startTimer;
-(void) endTimer;


- (IBAction)loginAction:(UIButton *)sender;

- (void) searchBungieGroup: (NSString *) searchGroup;

- (void) loadGroupDetails: (CLNDetail *) anyProfile;

@end

 
