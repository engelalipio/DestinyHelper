//
//  GuardianCellTableView.m
//  DestinyHelper
//
//  Created by Bertle on 10/14/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import "GuardianCellTableView.h"

@implementation GuardianCellTableView

@synthesize imgBackground = _imgBackground;
@synthesize lblGuardianClass = _lblGuardianClass;
@synthesize lblGuardianGender = _lblGuardianGender;
@synthesize lblLightLevel = _lblLightLevel;

+ (id)instanceFromNib
{
    NSString *className = @"GuardianCellTableView";
    
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
        
        
        
      if (! self.imgBackground){
            UIImage *defaultImage = [UIImage imageNamed:@"DefaultEmblem.png"];
            
            self.imgBackground = [[UIImageView alloc] initWithImage:defaultImage];
            
            [self.imgBackground setFrame:cFrame];
            
            [self.contentView addSubview:self.imgBackground];
        }
        
        if (! self.lblGuardianClass){
            
            self.lblGuardianClass = [[UILabel alloc] init];
            [self.lblGuardianClass setTextColor:[UIColor whiteColor]];
            [self.lblGuardianClass setText:@""];
            
            [self.contentView addSubview:self.lblGuardianClass];
        }
        
        if (! self.lblGuardianGender){
            
            self.lblGuardianGender = [[UILabel alloc] init];
            [self.lblGuardianGender setTextColor:[UIColor lightGrayColor]];
            [self.lblGuardianGender setText:@""];
            
            [self.contentView addSubview:self.lblGuardianGender];
        }
        
        
        if (! self.lblLightLevel){
            
            self.lblLightLevel = [[UILabel alloc] init];
            [self.lblLightLevel setTextColor:[UIColor yellowColor]];
            [self.lblLightLevel setText:@""];
            
            [self.contentView addSubview:self.lblLightLevel];
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


@end
