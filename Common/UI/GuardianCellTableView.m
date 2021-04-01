//
//  GuardianCellTableView.m
//  DestinyHelper
//
//  Created by Bertle on 10/14/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import "GuardianCellTableView.h"
#import "Utilities.h"

@implementation GuardianCellTableView

@synthesize imgEmblem = _imgEmblem;
@synthesize imgBackground = _imgBackground;
@synthesize lblGuardianClass = _lblGuardianClass;
@synthesize lblGuardianGender = _lblGuardianGender;
@synthesize lblLightLevel = _lblLightLevel;
@synthesize lblGuardianRace = _lblGuardianRace;
@synthesize lblGuardianCareer = _lblGuardianCareer;
@synthesize imgCareer = _imgCareer;
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
        
        if (! self.imgEmblem){
              UIImage *defaultImage = [UIImage imageNamed:@"PlaceHolder.png"];
            
              defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(75, 75)];
              
              self.imgEmblem = [[UIImageView alloc] initWithImage:defaultImage];
              
              //[self.imgEmblem setFrame:cFrame];
              
              [self.contentView addSubview:self.imgEmblem];
          }
          
        
      if (! self.imgBackground){
            UIImage *defaultImage = [UIImage imageNamed:@"DefaultEmblem.png"];
            
            self.imgBackground = [[UIImageView alloc] initWithImage:defaultImage];
            
            [self.imgBackground setFrame:cFrame];
            
            [self.contentView addSubview:self.imgBackground];
        }
        
        if (! self.imgCareer){
              UIImage *defaultImage = [UIImage imageNamed:@"Factions.png"];
            
              defaultImage = [Utilities imageResize:defaultImage andResizeTo:CGSizeMake(35,size.height)];
            
              self.imgCareer = [[UIImageView alloc] initWithImage:defaultImage];
              
              //[self.imgCareer setFrame:cFrame];
              
              [self.contentView addSubview:self.imgCareer];
          }
        
        if (! self.lblGuardianClass){
            
            self.lblGuardianClass = [[UILabel alloc] init];
            [self.lblGuardianClass setTextColor:[UIColor whiteColor]];
            [self.lblGuardianClass setText:@""];
            
            [self.contentView addSubview:self.lblGuardianClass];
        }
        
        if (! self.lblGuardianRace){
            
            self.lblGuardianRace = [[UILabel alloc] init];
            [self.lblGuardianRace setTextColor:[UIColor darkGrayColor]];
            [self.lblGuardianRace setText:@""];
            
            [self.contentView addSubview:self.lblGuardianRace];
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
        
        if (! self.lblGuardianCareer){
            
            self.lblGuardianCareer = [[UILabel alloc] init];
            [self.lblGuardianCareer setTextColor:[UIColor whiteColor]];
            [self.lblGuardianCareer setText:@""];
            
            [self.contentView addSubview:self.lblGuardianCareer];
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
