//
//  MembershipViewController.m
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "NetworkAPISingleClient+Definition.h"
#import "NetworkAPISingleClient+Auth.h"
#import "MembershipViewController.h"
#import "DataModels.h"
#import "Constants.h"
#import "GuardianViewController.h"
#import "Utilities.h"

@interface MembershipViewController ()
{
    
    AppDelegate *appDelegate;
    
    NSArray *destChars;
    
    NSString *AuthState;
    
    NSInteger RowHeight,
              HeaderHeight,
              FooterHeight;
 
}
@end



@implementation MembershipViewController

@synthesize lblPlayerName = _lblPlayerName;
@synthesize lblPlayerMotto = _lblPlayerMotto;
@synthesize imgPlayerLogo = _imgPlayerLogo;
@synthesize imgPlayerBG   = _imgPlayerBG;
@synthesize activityIndicator = _activityIndicator;
@synthesize memberships = _memberships;
@synthesize VCName = _VCName;


-(NSString *) VCName{
    return _VCName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    NSLog(@"%@:viewDidLoad:Invoked",[self VCName]);
  
    
    self->RowHeight = 90;
    self->HeaderHeight = 25;
    self->FooterHeight = 10;
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
   
    if (appDelegate != nil){
        if (! self.memberships){
            self.memberships = (NSArray *) appDelegate.destinyMemberships;
        }
        
        MBRResponse *mResponse =  [appDelegate currentMembership];
        
        if (mResponse){
            [self loadProfile:mResponse];
        }
    }
    
 
    [self initIndicator];
    
    [self initTableView];
    
      if (self.memberships != nil){
          [self.activityIndicator startAnimating];
           [self.tblMemberships reloadData];
          [self.activityIndicator stopAnimating];
      }
}

-(void) initIndicator{
   
    if (! self.activityIndicator){
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:self.tblMemberships.frame];
    }
   
    [self.view addSubview:_activityIndicator];
    
    
}

-(void) registerNotifications{
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedMembership
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
          
        self.memberships = (NSArray*) [note object];
        NSLog(@"%@:kDestinyLoadedMembership:Received",[self VCName]);
        if (self.memberships != nil){
            [self.tblMemberships reloadData];
        }
       
        
    }];
    
}

 
-(void) endTimer{
    
    if (self.timer != nil){
        [self.timer invalidate];
    }
    NSLog(@"%@Timer Stopped",[self VCName]);
    self.timer = nil;
}


-(void) startTimer{
    

    double interval = 5;
    
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:interval sinceDate:[NSDate date]]
                                              interval:interval target:self
                                              selector:@selector(timerFireMethod:)
                                              userInfo:nil
                                               repeats:YES];
        
        self.loop = [NSRunLoop currentRunLoop];
    
        [self.loop addTimer:self.timer forMode:NSDefaultRunLoopMode];
 
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    GuardianViewController *targetVC = (GuardianViewController *) segue.destinationViewController;
    
     
    if ([targetVC isKindOfClass:[GuardianViewController class]]){
        [targetVC setDestChars:destChars];
        [targetVC setMemberships:self.memberships];
    }
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *selectedTitle = nil;
    UITableViewCell *selectedCell = nil;
    MBRDestinyMemberships *selectedMembership = nil;
    @try {
        
        selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        
        selectedMembership = (MBRDestinyMemberships*) [_memberships objectAtIndex:indexPath.row];
        
        if(selectedCell){
           
            switch (selectedCell.tag) {
                case 1:
                    [appDelegate setCurrentMembershipType:Xbox];
                    break;
                    
                case 2:
                    [appDelegate setCurrentMembershipType:Playstation];
                    break;
                    
                case 4:
                    [appDelegate setCurrentMembershipType:PC];
                    break;
            }
            
            if ( selectedMembership){
                [appDelegate setCurrentMembershipID:selectedMembership.membershipId];
            }
            
            [self performSegueWithIdentifier:@"segGuardians" sender:destChars];
        }
        
    } @catch (NSException *exception) {
        NSLog(@"%@:didSelectRowAtIndexPath:Exception->%@",[self VCName],exception.description);
    } @finally {
        
        selectedTitle = nil;
        selectedCell = nil;
        selectedMembership = nil;
        
    }
    
  
    
}


 

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        NSInteger size = self->RowHeight;
     
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
   
    NSInteger size = self->FooterHeight;
  
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSInteger size = self->FooterHeight;
    
    return size;
}

-(void) initTableView{
    
    NSString *message = nil;
    @try {
        
        if (! self.tblMemberships){
            self.tblMemberships = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, self.lblPlayerMotto.frame.origin.y ,self.view.frame.size.width, self.view.frame.size.height)];
            
            [self.view addSubview:self.tblMemberships];
        }
        
        [self.tblMemberships setDelegate:self];
        [self.tblMemberships setDataSource:self];
        [self.tblMemberships setRefreshControl:self.activityIndicator];
        
        
      }
        @catch (NSException *exception) {
            message = [exception description];
        }
        @finally {
            
            if ([message length] > 0){
                NSLog(@"%@",message);
            }
           
            message =  @"";
            
        }
    
}

 
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
 

    NSString *message   = nil;
 
    @try {
        message =  [NSString stringWithFormat:@"MembershipVC:tableView:willDisplayCell->Section:[%ld]|Row:[%ld]",
                    (long)indexPath.section,(long)indexPath.row];
       
        if (cell){
           [cell.contentView.superview setBackgroundColor:UIColor.blackColor];
           //[cell setAccessoryType:UITableViewCellAccessoryNone];
        }
   
        
    } @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
        message = nil;
    }
    
}

 
 
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
    NSString *message   = nil,
             *imageName = nil,
             *baseURL   = nil;
    
    
    MBRDestinyMemberships *membership = nil;
    
    NSDictionary *memberDict = nil;
    
    NSURL *imgURL = nil;
    
    UIImage *placeholderImg = nil;
    
    @try {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
        
        if (! cell){
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"imgCell"];
           // [cell setAccessoryType:UITableViewCellAccessoryNone];
        }
        
        placeholderImg = [UIImage imageNamed:@"PlaceHolder.jpg"];
        
        membership = (MBRDestinyMemberships*) [_memberships objectAtIndex:indexPath.row];
        
        memberDict = (NSDictionary*) [_memberships objectAtIndex:indexPath.row];
        
        
        if (membership){
            
           
            NSString *primaryMembership = [appDelegate currentMembershipID];
            
            if (primaryMembership){
                
                if ([membership.membershipId isEqualToString:primaryMembership]){
                    [cell.layer setMasksToBounds:YES];
                    [cell.layer setCornerRadius:5];
                    [cell.layer setBorderWidth:1];
                    [cell.layer setShadowOffset: CGSizeMake(0, 0)];
                    [cell.layer setBorderColor:[UIColor systemOrangeColor].CGColor];
                      
                    [cell setHighlighted:YES];
                    [cell.detailTextLabel setTextColor:[UIColor whiteColor]];
                    [cell.detailTextLabel setText:@"Primary Membership"];
                    
                    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                   
                }
            }
            
            imageName = [membership iconPath];
            
            enum Destiny2MembershipType mType = Xbox;
            
            if ([imageName containsString:@"xboxLiveLogo.png"]){
                mType = Xbox;
            }
            
            if ([imageName containsString:@"psnLogo.png"]){
                mType = Playstation;
            }
            
            if ([imageName containsString:@"steamLogo.png"]){
                mType = PC;
            }
            
            [cell setTag:mType];
            
            baseURL = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
            
            imgURL = [[NSURL alloc] initWithString:baseURL];
            
            [cell.imageView setImageWithURL:imgURL placeholderImage:placeholderImg];
            
            UIImage *nImage =  [Utilities imageResize:cell.imageView.image andResizeTo:CGSizeMake(60,60)];
            
            [cell.imageView setImage:nImage];
            
            
            [cell.textLabel setTextColor:[UIColor whiteColor]];
            
            [cell.textLabel setText:membership.displayName];
      
           
            
        }
        
       
        
        
    } @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger iRows = 0;
    
    if (_memberships != nil){
        iRows = _memberships.count;
    }
    
    return iRows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}


- (void)timerFireMethod:(NSTimer *)t{
    
    NSString *message         = @"";
    
    @try {
        
            
       // [self populateManifestDefinitions];
            
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
       
        
    }
    
    
}

-(void)loadProfile: (MBRResponse *) anyProfile{
    
    NSString *message = nil,
             *baseURL = nil,
             *bgURL   = nil,
             *strFirst  = nil,
             *strLast   = nil;
    
    MBRResponse *profile = nil;
    
    NSURL *imgURL = nil;
    
    NSDate *dteFirst = nil,
           *dteLast  = nil;
    
    NSDateFormatter *dateFormatter = nil;
    @try {
        
        
        dteFirst = [[NSDate alloc] init];
        dteLast  = [[NSDate alloc] init];
        
        dateFormatter = [[NSDateFormatter alloc] init];
        
            
        if (anyProfile){
            MBRBungieNetUser *bungieUser = nil;
            
            profile = (MBRResponse*) anyProfile;
            
            if (profile){
                
                bungieUser = [profile bungieNetUser];
                
                if (bungieUser){
                
                baseURL = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,bungieUser.profilePicturePath];
                
                bgURL =  [NSString stringWithFormat:@"%@%@/header.jpg", kBungieThemeURL,bungieUser.profileThemeName];
                
                imgURL = [[NSURL alloc] initWithString:baseURL];
                
                [self.imgPlayerBG setImageWithURL:[NSURL URLWithString:bgURL]];
                
                [self.imgPlayerLogo setImageWithURL:imgURL];
                
                [self.lblMembershipId setText:bungieUser.membershipId];
                
                [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:bungieUser.locale]];
                
                [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
               
                dteFirst  = [dateFormatter dateFromString:bungieUser.firstAccess];
                dteLast   = [dateFormatter dateFromString:bungieUser.lastUpdate];
                
                dateFormatter.timeStyle = NSDateFormatterNoStyle;
                dateFormatter.dateStyle = NSDateIntervalFormatterLongStyle;
                
                strFirst = [dateFormatter stringFromDate:dteFirst];
                strLast  = [dateFormatter stringFromDate:dteLast];
                
                [self.lblFirstAccessed setTextColor:[UIColor systemOrangeColor]];
                [self.lblFirstAccessed setText:strFirst];
                [self.lblLastAccessed setText:strLast];
                
                [self.lblPlayerMotto setText:bungieUser.statusText];
                 
                [self.lblPlayerName setTextColor:[UIColor whiteColor]];
                [self.lblPlayerName setText:bungieUser.uniqueName];
                
                
                [appDelegate setCurrentBungieName:bungieUser.uniqueName];
                    
                enum Destiny2MembershipType mType = Xbox;
                
                
                
                 
               
                //xbox = 1
                message = [NSString stringWithFormat:@"%@/%@",bungieUser.membershipId,@"1" ];
                
              /*  [appDelegate setCurrentLocale:profile.locale];
                [appDelegate setCurrentProfile:profile];*/
                    
                }
                
               // [self.tblMemberships reloadData];
                
                //[self loadMembership:message];
                //[self endTimer];
            }
        }
        
        
    } @catch (NSException *exception) {
        [self setTitle:exception.description];
    } @finally {
        message = nil;
        
        profile = nil;
        
        imgURL = nil;
    }
    
}

 
@end
