//
//  ProfileViewController.m
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "NetworkAPISingleClient+Definition.h"
#import "ProfileViewController.h"
#import "DataModels.h"
#import "Constants.h"
#import "GuardianViewController.h"
 

@interface ProfileViewController ()
{
    
    AppDelegate *appDelegate;
    
    NSArray *dMemberships,
            *destChars;
    
    SFSafariViewController *webView;
}
@end



@implementation ProfileViewController

@synthesize lblPlayerName = _lblPlayerName;
@synthesize lblPlayerMotto = _lblPlayerMotto;
@synthesize imgPlayerLogo = _imgPlayerLogo;
@synthesize imgPlayerBG   = _imgPlayerBG;
@synthesize searchBar = _searchBar;
@synthesize activityIndicator = _activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
 
 
    [_searchBar setDelegate:self];
  
    [self registerNotifications];
    [self initTableView];
    [self initIndicator];
 
}

-(void) initIndicator{
   
    if (! self.activityIndicator){
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:self.tblMemberships.frame];
    }
    
    [self.view addSubview:_activityIndicator];
    
}

-(void) registerNotifications{

    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedCharactersNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
          
        destChars = (NSArray*) [note object];
       
        NSLog(@"ProfileViewController:kDestinyLoadedCharactersNotification:Received");
                                                     
        
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyOAuthSFNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note){
         
        NSDictionary *oAuthResponse = (NSDictionary *) [note object];
        
        if (oAuthResponse != nil){
            
        }
         
        [self->webView dismissViewControllerAnimated:true completion:nil];
       
        NSLog(@"ProfileViewController:kDestinyOAuthSFNotification:Received");
                                                     
        
    }];
    
    
    
}


#pragma - SearchBar

 

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    NSString *message = nil,
             *searchTerm = nil;
    @try {
        
        message = [NSString stringWithFormat:@"searchBarSearchButtonClicked->%@",searchBar.text];
        
        if (searchBar.text.length > 0){
            searchTerm = [searchBar text];
            [self.activityIndicator setHidden:NO];
            [self.activityIndicator startAnimating];
                [appDelegate setIsCharsLoaded:NO];
                [self searchBungieUser: searchTerm];
            [self.activityIndicator stopAnimating];
        }
         
        
    } @catch (NSException *exception) {
        message = exception.description;
    } @finally {
        if (message){
            NSLog(@"%@",message);
        }
        
        message = nil;
    }
}


-(void) safariViewControllerWillOpenInBrowser:(SFSafariViewController *)controller{
    NSLog(@"safariViewControllerWillOpenInBrowser Invoked...");
}

-(void) safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully{
    NSLog(@"didCompleteInitialLoad Invoked...");
}

 
-(void) safariViewControllerDidFinish:(SFSafariViewController *)controller{
    
    NSLog(@"initialLoadDidRedirectToURL Invoked...");
    
    [self dismissViewControllerAnimated:true completion:nil];
}
 

-(void) safariViewController:(SFSafariViewController *)controller initialLoadDidRedirectToURL:(NSURL *)URL{
    NSLog(@"initialLoadDidRedirectToURL Invoked...for %@", URL.absoluteString);
}

- (IBAction)loginAction:(UIButton *)sender {
    
    NSString *strURL   = kBungieBaseURL,
             *strClientID = kBungieClientID,
             *strLocale = appDelegate.currentLocale,
             *strGUID = [[NSUUID alloc] init].UUIDString;
    
    NSURL *url = nil;
    
    @try{
        
      //#define kDestinyOAuthAuthorize @"/{locale}/oauth/authorize?client_id={client_id}&response_type=code"
        
        strGUID = [strGUID stringByReplacingOccurrencesOfString:@"-" withString:@""];
        
        strURL = [NSString stringWithFormat:@"%@%@&state=%@",strURL,kDestinyOAuthAuthorize,strGUID];
        
        strURL = [strURL stringByReplacingOccurrencesOfString:@"{locale}" withString:strLocale];
        strURL = [strURL stringByReplacingOccurrencesOfString:@"{client_id}" withString:strClientID];
        
        url = [[NSURL alloc] initWithString:strURL];
         
        SFSafariViewControllerConfiguration *sfConfig = [[SFSafariViewControllerConfiguration alloc] init];
        [sfConfig setEntersReaderIfAvailable:YES];
        
 
     
        
      self->webView = [[SFSafariViewController alloc] initWithURL:url configuration:sfConfig];
           
       [self->webView setDelegate:self];
        
       [self presentViewController:self->webView
                            animated:NO completion:nil];
    
        
    }
    @catch (NSException *exception){
        NSLog(@"%@",exception.description);
    }
    @finally{
        
    }
}

-(void) endTimer{
    
    if (self.timer != nil){
        [self.timer invalidate];
    }
    NSLog(@"Profile Timer Stopped");
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
    
     
    if (targetVC){
        [targetVC setDestChars:destChars];
        [targetVC setMemberships:dMemberships];
    }
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *selectedTitle = @"";
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
 
    
    if(selectedCell){
       
        [self performSegueWithIdentifier:@"segGuardians" sender:destChars];
    }
    
}


 

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        NSInteger size = 120;
     
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
   // return CGFLOAT_MIN;
    NSInteger size =1.0f;//90;

    
  
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSInteger size = 1.0f;//90;
    
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
    NSString *message   = @"";
    
    
    @try {
        
        if (cell){
            //This will set the background of all of the views within the tablecell
            cell.contentView.superview.backgroundColor = UIColor.blackColor;
            
            UIImage *cellImage = [UIImage imageNamed:@"PlaceHolder.jpg"];
            
            [cell.imageView setImage:cellImage];
               
           
            
        }
        
    }
    @catch (NSException *exception) {
        message = [exception description];
    }
    @finally {
        message = @"";
    }

}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
    NSString *message   = nil,
             *imageName = nil,
             *baseURL   = nil;
    
    
    MBRDestinyMemberships *membership = nil;
    
    NSURL *imgURL = nil;
    
    UIImage *placeholderImg = nil;
    
    @try {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
        
        if (! cell){
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"imgCell"];
        }
        
        placeholderImg = [UIImage imageNamed:@"PlaceHolder.jpg"];
        
        membership = (MBRDestinyMemberships*) [dMemberships objectAtIndex:indexPath.row];
        
        if (membership){
            
            /*
            
             NSString *const kMBRDestinyMembershipsMembershipId = @"membershipId";
             NSString *const kMBRDestinyMembershipsIconPath = @"iconPath";
             NSString *const kMBRDestinyMembershipsDisplayName = @"displayName";
             NSString *const kMBRDestinyMembershipsMembershipType = @"membershipType";
             */
            
            imageName = [membership iconPath];
            baseURL = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
            
            imgURL = [[NSURL alloc] initWithString:baseURL];
            
            [cell.imageView setImageWithURL:imgURL placeholderImage:placeholderImg];
            
           // [cell.imageView setFrame:CGRectMake(0.0, 100.0, 80, 80)];
            
            [cell.textLabel setTextColor:[UIColor whiteColor]];
            
            [cell.textLabel setText:membership.displayName];
            [cell.detailTextLabel setText:membership.membershipId];
            
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
           
            
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
    
    if (dMemberships != nil){
        iRows = dMemberships.count;
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

-(void)loadProfile: (USRResponse *) anyProfile{
    
    NSString *message = nil,
             *baseURL = nil,
             *bgURL   = nil,
             *strFirst  = nil,
             *strLast   = nil;
    
    USRResponse *profile = nil;
    
    NSURL *imgURL = nil;
    
    NSDate *dteFirst = nil,
           *dteLast  = nil;
    
    NSDateFormatter *dateFormatter = nil;
    @try {
        
        
        dteFirst = [[NSDate alloc] init];
        dteLast  = [[NSDate alloc] init];
        
        dateFormatter = [[NSDateFormatter alloc] init];
        
            
        if (anyProfile){
            
            
            profile = (USRResponse*) anyProfile;
            
            if (profile){
                
                
                baseURL = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,profile.profilePicturePath];
                
                bgURL =  [NSString stringWithFormat:@"%@%@/header.jpg", kBungieThemeURL,profile.profileThemeName];
                
                imgURL = [[NSURL alloc] initWithString:baseURL];
                
                [self.imgPlayerBG setImageWithURL:[NSURL URLWithString:bgURL]];
                
                [self.imgPlayerLogo setImageWithURL:imgURL];
                
                [self.lblMembershipId setText:profile.membershipId];
                
                [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:profile.locale]];
                
                [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
               
                dteFirst  = [dateFormatter dateFromString:profile.firstAccess];
                dteLast   = [dateFormatter dateFromString:profile.lastUpdate];
                
                dateFormatter.timeStyle = NSDateFormatterShortStyle;
                dateFormatter.dateStyle = NSDateIntervalFormatterMediumStyle;
                
                strFirst = [dateFormatter stringFromDate:dteFirst];
                strLast  = [dateFormatter stringFromDate:dteLast];
                

                [self.lblFirstAccessed setText:strFirst];
                [self.lblLastAccessed setText:strLast];
                
                [self.lblPlayerMotto setText:profile.statusText];
                [self->_lblPlayerName setText:profile.displayName];
                
                enum Destiny2MembershipType mType = Xbox;
               
                //xbox = 1
                message = [NSString stringWithFormat:@"%@/%@",profile.membershipId,@"1" ];
                
                [appDelegate setCurrentLocale:profile.locale];
                [appDelegate setCurrentProfile:profile];
                
                [self.tblMemberships reloadData];
                
                [self loadMembership:message];
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

-(void)loadMembership: (NSString *) anyMembership{
 
    
    [NetworkAPISingleClient retrieveMembershipData:anyMembership
                                   completionBlock:^(NSArray *userData){
     
        if(userData){
            
            MBRBaseClass *memberships =   (MBRBaseClass*) [userData firstObject];
            
            if (memberships){
                 
                MBRResponse *memberResponse = [[MBRResponse alloc] initWithDictionary:[memberships response]];
                
                NSArray *membershipData = (NSArray*) [memberResponse destinyMemberships];
       
        
                    if (membershipData){
                        
                        //Set memberships to delegate
                        [appDelegate setDestinyMemberships:membershipData];
                        
                        [[NSNotificationCenter defaultCenter]
                           postNotificationName:kDestinyLoadedMembership
                         object:membershipData];
                        
                        dMemberships = membershipData;
                        
                        [self.tblMemberships reloadData];
                        
                    }
                    
                }
            
            }
            
            
              
     
    }
        andErrorBlock:^(NSError *errorData){
        if (errorData){
            NSLog(@"%@",errorData.description);
        }
        
    }];
    
}

-(void) searchBungieUser: (NSString *) searchUser{
    
    NSString *bungieUserName = searchUser;
    
    [NetworkAPISingleClient searchUser:bungieUserName completionBlock:^(NSArray *userData){
     
        if(userData){
            
            SRCBaseClass *searchBase =  (SRCBaseClass*) [userData firstObject];
            
            if (searchBase){
                
                NSArray *searchedUser = (NSArray*) [searchBase response];
   
    
                if (searchedUser){
                    
                    
                    NSDictionary* user =  (NSDictionary*) [searchedUser firstObject];
                        
                    if (user){
                        
                        USRResponse *userProfile = nil;
                        
                        @try {
                            userProfile = [[USRResponse alloc] initWithDictionary:user];
                            if (userProfile){
                                
                                [self loadProfile:userProfile];
                                
                            }
                            else{
                               // [self setTitle:@"Profile Not Found"];
                            }
                        } @catch (NSException *exception) {
                            NSLog(@"%@",exception.description);
                          
                        } @finally {
                            NSLog(@"Profile Loaded");
                            userProfile = nil;
                            
                            [self.searchBar setText:@""];
                            
                        }
                        
                        
                       
                    }
                    else{
                        [self.lblPlayerName setText:@"Profile Not Found"];
                        
                    }
                    
                }
                
            }
            
        }
     
    }
        andErrorBlock:^(NSError *errorData){
        if (errorData){
            NSLog(@"%@",errorData.description);
        }
        
    }];
    
     
    
}

@end