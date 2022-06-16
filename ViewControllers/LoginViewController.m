//
//  LoginViewController.m
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "NetworkAPISingleClient+Definition.h"
#import "NetworkAPISingleClient+Auth.h"
#import "LoginViewController.h"
#import "DataModels.h"
#import "Constants.h"
#import "GuardianViewController.h"
#import "MembershipViewController.h"
#import "HomeViewController.h"
#import "Utilities.h"

@interface LoginViewController ()
{
    
    AppDelegate *appDelegate;
    
    NSArray *dMemberships,
            *destChars;
    
    ASWebAuthenticationSession *asWebAuthSession;
    
    NSString *AuthState;
    
    UIImage *bgImage;
}
@end



@implementation LoginViewController

@synthesize lblPlayerName = _lblPlayerName;
@synthesize lblPlayerMotto = _lblPlayerMotto;
@synthesize imgPlayerLogo = _imgPlayerLogo;
@synthesize imgPlayerBG   = _imgPlayerBG;
@synthesize activityIndicator = _activityIndicator;
@synthesize lblClanStatus = _lblClanStatus;

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    
    if (appDelegate){
        if ([appDelegate currentAccessTokenValue] && [appDelegate currentRefreshToken]){
          [self.btnLogin setHidden:YES];
        }
    }
}

-(void)setupBackgroundImage{
    
    UIImage *oImage = [UIImage imageNamed:@"Vanguard.jpg"] ;
    
    CGSize newSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 150);
    
    self->bgImage = [Utilities imageResize:oImage andResizeTo:newSize];
 
    self.view.backgroundColor = [UIColor colorWithPatternImage:self->bgImage];
   
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   appDelegate = [AppDelegate currentDelegate];
 
    
    [[UILabel appearance] setFont:[UIFont fontWithName:kDefaultFontName size:[UIFont labelFontSize]]];
    
    [[UIButton appearance] setFont:[UIFont fontWithName:kDefaultFontName size:[UIFont buttonFontSize]]];
    
   // [self setupBackgroundImage];
    [self registerNotifications];
   /* [self initTableView];*/
    [self initIndicator];
    [self resetLabelStatuses];
 
    /*if (! [appDelegate currentAccessToken]){
        [self loginAction:_btnLogin];
     }*/
    

 
}

-(void) resetLabelStatuses{
    
    [self.lblLoginStatus setText:@""];
    [self.lblMemberStatus setText:@""];
    [self.lblCharStatus setText:@""];
    [self.lblClanStatus setText:@""];
}

-(void) initIndicator{
   
    if (! self.activityIndicator){
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:self.tblMemberships.frame];
    }
    
    [self.view addSubview:_activityIndicator];
    [self.activityIndicator stopAnimating];
    
}

-(void) registerNotifications{
   
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedClanInfoNotification
          object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
          
        
            NSLog(@"ProfileViewController:kDestinyLoadedClanInfoNotification:Received");
          
         [self.lblClanStatus setText:@"Clan Details successfully loaded..."];
        
      }];

    
  
      [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedMembership
          object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
           
          NSArray *memberships = (NSArray *) [note object];
          
          NSLog(@"ProfileViewController:kDestinyLoadedMembership:Received");
          
          [self.lblMemberStatus setText:@"Profile successfully loaded..."];
                                                       
          
      }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedCharactersNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
          
        destChars = (NSArray*) [note object];
       
        [self.activityIndicator stopAnimating];
        [self.view setBackgroundColor:[UIColor blackColor]];
        
        NSLog(@"ProfileViewController:kDestinyLoadedCharactersNotification:Received");
        [self.lblCharStatus setText:@"Characters successfully loaded..."];
        
        if (self.lblCharStatus.text.length > 0 && self.lblMemberStatus.text.length >0){
            [self.activityIndicator stopAnimating];
            [self startTimer];
        }
        
    }];
    
}

 

- (nonnull ASPresentationAnchor)presentationAnchorForWebAuthenticationSession:(nonnull ASWebAuthenticationSession *)session {
    
    ASPresentationAnchor anchor = nil;
    
    NSString *message = nil;
    
    @try{
        
        if (session != nil){
           
            message = @"presentationAnchorForWebAuthenticationSession invoked with ASWebAuthenticationSession";
            
            self->asWebAuthSession.presentationContextProvider = (id<ASWebAuthenticationPresentationContextProviding>)
                                                                 [session presentationContextProvider];
        }
       
        anchor = (ASPresentationAnchor) self.view.window;
        
    }
    @catch(NSError *oEx){
        message = [NSString stringWithFormat:@"presentationAnchorForWebAuthenticationSession:Error = %@",oEx.description];
    }
    @finally{
        if (message){
            NSLog(@"%@",message);
        }
    }
    return anchor;
}

 

- (IBAction)closeAction:(UIButton *)sender {
    
    NSLog(@"LoginViewController:closeAction:Invoked...");
    
     
}

- (IBAction)loginAction:(UIButton *)sender {
    
    NSString *strURL   = kBungieBaseURL,
             *strClientID = kBungieClientID,
             *strLocale = appDelegate.currentLocale,
             *strGUID = [[NSUUID alloc] init].UUIDString,
             *strCallBack = kamsDHRedirect;
    
    
    NSURL *url = nil;
    
    [self.activityIndicator startAnimating];
    
    @try{
        
      //#define kDestinyOAuthAuthorize @"/{locale}/oauth/authorize?client_id={client_id}&response_type=code"
        
        strGUID = [strGUID stringByReplacingOccurrencesOfString:@"-" withString:@""];
        
        self->AuthState = strGUID;
        
        strURL = [NSString stringWithFormat:@"%@%@&state=%@",strURL,kDestinyOAuthAuthorize,strGUID];
        
        //strURL = [NSString stringWithFormat:@"%@%@",strURL,kDestinyOAuthAuthorize];
        
        strURL = [strURL stringByReplacingOccurrencesOfString:@"{locale}" withString:strLocale];
        strURL = [strURL stringByReplacingOccurrencesOfString:@"{client_id}" withString:strClientID];
        
        url = [[NSURL alloc] initWithString:strURL];
        
        
        self->asWebAuthSession = [[ASWebAuthenticationSession alloc] initWithURL:url
                                                        callbackURLScheme:strCallBack
                                                        completionHandler:^(NSURL *callbackURL, NSError *error){
            
            if (error != nil){
                NSLog(@"ASWebAuthenticationSession::Exception=>%@",error.description);
                return;
            }
            
            if (callbackURL != nil){
                NSString *authState = nil,
                         *authCode  = nil;
                
                NSLog(@"Response URL = %@",callbackURL.absoluteString);
                
                NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:callbackURL.absoluteString];
                
                if (urlComponents){
                    for (int iC = 0; iC < urlComponents.queryItems.count ; iC++) {
                        
                        NSURLQueryItem *qItem = [urlComponents.queryItems objectAtIndex:iC];
                        
                        if (qItem){
                            if ([qItem.name.lowercaseString isEqualToString:@"code"]){
                                authCode = qItem.value;
                            }
                            if ([qItem.name.lowercaseString isEqualToString:@"state"]){
                                authState = qItem.value;
                            }
                        }
                        
                    }
                }
                
                if ([self->AuthState isEqualToString:authState]){
                    //Matches the original request
                    
                    [NetworkAPISingleClient retrieveToken:authCode completionBlock:^(NSArray *values){
                        
                        if (values){
                            
                            [self.lblLoginStatus setText:@"Bungie Login successfully..."];
                            [self.btnLogin setHidden:YES];
                            [self.btnClose setHidden:NO];
                            
                            [[NSNotificationCenter defaultCenter]
                               postNotificationName:kDestinyOAuthSFNotification
                             object:values];
                            
                           
                        }
                        
                    } andErrorBlock:^(NSError* error){
                        NSLog(@"ASWebAuthenticationSession::Exception->%@",error.description);
                    }];
                  
                   
                }
               
            }
            
        }];
        
        [self->asWebAuthSession setPresentationContextProvider:self];
   
        [self->asWebAuthSession start];
  
        
    }
    @catch (NSException *exception){
        NSLog(@"%@",exception.description);
    }
    @finally{
        strURL = nil;
        url = nil;
        strGUID = nil;
    }
}



-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    MembershipViewController *targetVC = nil;
    NSArray *memberships = nil;
    @try {
        
        targetVC = (MembershipViewController *) segue.destinationViewController;
        
        memberships = (NSArray*) sender;
         
        if ([targetVC isKindOfClass:MembershipViewController.class]){
            [targetVC setMemberships:memberships];
            NSLog(@"LoginVC:prepareForSegue:loading MembershipVC->%@",memberships.description);
        }
        
        [self closeAction:self.btnClose];
        
    } @catch (NSException *exception) {
        NSLog(@"LoginVC:prepareForSegue:Exception->%@",exception.description);
    } @finally {
        targetVC = nil;
        memberships = nil;
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
        [self endTimer];
        [self performSegueWithIdentifier:@"segMembership" sender:nil];
     
            
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
                        [self->appDelegate setDestinyMemberships:membershipData];
                        
                        [self->appDelegate setCurrentMembershipID:memberResponse.primaryMembershipId];
                        
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
