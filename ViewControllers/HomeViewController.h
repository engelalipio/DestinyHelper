//
//  ViewController.h
//  DestinyHelper
//
//  Created by Bertle on 9/28/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface HomeViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@property (weak, nonatomic) IBOutlet UIImageView *imgBackView;

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;


@property (nonatomic,strong) NSTimer   *timer;
@property (nonatomic,strong) NSRunLoop *loop;

@property (strong, nonatomic) IBOutlet UIButton *btnGuardians;

@property (strong, nonatomic) IBOutlet UIButton *btnInventory;
@property (strong, nonatomic) IBOutlet UIButton *btnLogin;

-(void) startTimer;
-(void) endTimer;

- (IBAction)loginAction:(UIButton *)sender;

- (IBAction)guardiansAction:(UIButton *)sender;

- (IBAction)GroupAction:(UIButton *)sender;

-(void) refreshUI;


@end

