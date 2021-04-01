//
//  GuardianCellTableView.h
//  DestinyHelper
//
//  Created by Bertle on 10/14/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

 

@interface GuardianCellTableView : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgEmblem;
@property (strong, nonatomic) IBOutlet UIImageView *imgBackground;
@property (strong, nonatomic) IBOutlet UILabel *lblGuardianClass;
@property (strong, nonatomic) IBOutlet UILabel *lblGuardianGender;
@property (strong, nonatomic) IBOutlet UILabel *lblGuardianCareer;

@property (strong, nonatomic) IBOutlet UILabel *lblGuardianRace;
@property (strong, nonatomic) IBOutlet UIImageView *imgCareer;


@property (strong, nonatomic) IBOutlet UILabel *lblLightLevel;

@end

 
