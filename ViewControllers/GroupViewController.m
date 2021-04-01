//
//  GroupViewController.m
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "NetworkAPISingleClient+Definition.h"
#import "NetworkAPISingleClient+Auth.h"
#import "NetworkAPISingleClient+Clan.h"
#import "NetworkAPISingleClient+SearchUser.h"
#import "GroupViewController.h"
#import "DataModels.h"
#import "Constants.h"
#import "GuardianViewController.h"
#import "Utilities.h"

@interface GroupViewController ()
{
    
    AppDelegate *appDelegate;
    
    NSArray *gMembers,
            *destChars;
    
    ASWebAuthenticationSession *asWebAuthSession;
    
    NSString *AuthState;
    
 
}
@end



@implementation GroupViewController

@synthesize lblPlayerName = _lblPlayerName;
@synthesize lblPlayerMotto = _lblPlayerMotto;
@synthesize imgPlayerLogo = _imgPlayerLogo;
@synthesize imgPlayerBG   = _imgPlayerBG;
@synthesize searchBar = _searchBar;
@synthesize activityIndicator = _activityIndicator;

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
   // if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
   // }
 
    [_searchBar setDelegate:self];
  
    [self registerNotifications];
    [self initTableView];
    [self initIndicator];
    
    if (! gMembers){
        if (appDelegate.destinyMemberships){
            gMembers = [appDelegate destinyMemberships];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
   // }
 
    
 
    [_searchBar setDelegate:self];
  
    [self registerNotifications];
    [self initTableView];
    [self initIndicator];
 
}

-(void) initIndicator{
   
    if (! self.activityIndicator){
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:self.tblGroups.frame];
        [self.view addSubview:_activityIndicator];
        [self.activityIndicator stopAnimating];
    }
    
}

-(void) registerNotifications{
   
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedCharactersNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
          
        NSLog(@"GroupViewController:kDestinyLoadedCharactersNotification:Received");
        destChars = (NSArray*) [note object];
        
        
        appDelegate = [AppDelegate currentDelegate];
        
        if (appDelegate){
        
            BOOL isCLoaded = [appDelegate isCharsLoaded];
            UIViewController *targetVC =  [self presentedViewController];
            if (isCLoaded && ! targetVC){
                [self performSegueWithIdentifier:@"segMember" sender:destChars];
            }
        }
        
      
        
    }];
    
}


#pragma - SearchBar

 

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    NSString *message = nil,
             *searchTerm = nil;
    @try {
        
        message = [NSString stringWithFormat:@"searchBarSearchButtonClicked->%@",searchBar.text];
        
        if (searchBar.text.length > 0){
            [self.activityIndicator startAnimating];
            searchTerm = [searchBar text];
            
            searchTerm = [searchTerm stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            
  
            [appDelegate setIsCharsLoaded:NO];
            [self searchBungieGroup: searchTerm];
            
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

 

- (IBAction)loginAction:(UIButton *)sender {
    
    NSString *strURL   = kBungieBaseURL,
             *strClientID = kBungieClientID,
             *strLocale = appDelegate.currentLocale,
             *strGUID = [[NSUUID alloc] init].UUIDString,
             *strCallBack = kamsDHRedirect;
    
    
    NSURL *url = nil;
    
    
    
    @try{
        
      //#define kDestinyOAuthAuthorize @"/{locale}/oauth/authorize?client_id={client_id}&response_type=code"
        
        strGUID = [strGUID stringByReplacingOccurrencesOfString:@"-" withString:@""];
        
        self->AuthState = strGUID;
        
        strURL = [NSString stringWithFormat:@"%@%@&state=%@",strURL,kDestinyOAuthAuthorize,strGUID];
        
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
                
                NSLog(@"Reponse URL = %@",callbackURL.absoluteString);
                
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


-(void)loadMembership: (NSString *) anyMembership{
 
    
    NSLog(@"1:GroupViewController:loadMembership:Invoked for Membership->%@",anyMembership);
    
     
    NSString *message = [NSString stringWithFormat:@"%@/%@",anyMembership,@"1" ];
    
    
    [NetworkAPISingleClient retrieveMembershipData:message
                                   completionBlock:^(NSArray *userData){
     
        if(userData){
            
            MBRBaseClass *memberships =   (MBRBaseClass*) [userData firstObject];
            
            if (memberships){
                 
                MBRResponse *memberResponse = [[MBRResponse alloc] initWithDictionary:[memberships response]];
                
                NSArray *membershipData = (NSArray*) [memberResponse destinyMemberships];
        
                    if (membershipData){
                        
                        NSLog(@"2:GroupViewController:loadMembership:Membership Data Received:Count=%lu",(unsigned long)membershipData.count);
                        
                        //Set memberships to delegate
                        [appDelegate setDestinyMemberships:membershipData];
                        
                        NSLog(@"4:GroupViewController:loadMembership:Triggering kDestinyLoadedMembership Notification...");
                        //Trigger kDestinyLoadedMembership Notification
                        [[NSNotificationCenter defaultCenter]
                           postNotificationName:kDestinyLoadedMembership
                                         object:membershipData];
                        
                    //    [self performSegueWithIdentifier:@"segGuardians" sender:destChars];
                        
                    }
                    
                }
            
            }
            
            
    }
        andErrorBlock:^(NSError *errorData){
        if (errorData){
            NSLog(@"ProfileViewController:loadMembership:Exception->%@",errorData.description);
        }
        
    }];
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *selectedMembership = @"";
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    Founder *groupMember = nil;
    
    DestinyUserInfo *userInfo = nil;
    
    
    if(selectedCell){
        
        groupMember = (Founder*) [gMembers objectAtIndex:indexPath.row];
        
        if (groupMember){
            userInfo = groupMember.destinyUserInfo;
            
            if (userInfo){
                selectedMembership = [userInfo membershipId];
                [self loadMembership:selectedMembership];
            }
        }
        
        
       //[self performSegueWithIdentifier:@"segGuardians" sender:destChars];
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
        
        if (! self.tblGroups){
            
            self.tblGroups = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, self.lblPlayerMotto.frame.origin.y ,self.view.frame.size.width, self.view.frame.size.height)];
            
            self.tblGroups.contentInset = UIEdgeInsetsMake(0, 0, self.view.frame.size.height-20, 0);
            [self.view addSubview:self.tblGroups];
           
    
            [self.tblGroups setDelegate:self];
            [self.tblGroups setDataSource:self];
            
        }
        
      
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
            
           /* UIImage *cellImage = [UIImage imageNamed:@"PlaceHolder.jpg"];
            
            [cell.imageView setImage:cellImage];*/
               
           
            
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
             *memberName = nil,
             *baseURL   = nil,
             *onlineStatus = nil;
    
    
    Founder *groupMember = nil;
    
    CLNMDestinyUserInfo *userInfo = nil;
    CLNMBungieNetUserInfo *bUserInfo = nil;
    
    NSURL *imgURL = nil;
    
    UIImage *placeholderImg = nil;
    
    BOOL isOnline = NO;
    
    @try {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
        
        if (! cell){
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"imgCell"];
        }
        
        placeholderImg = [UIImage imageNamed:@"PlaceHolder.jpg"];
        
        groupMember = (Founder*) [gMembers objectAtIndex:indexPath.row];
        
        if (groupMember){
            
            userInfo =  [groupMember destinyUserInfo];
            
            bUserInfo = (CLNMBungieNetUserInfo*) [groupMember valueForKey:@"bungieNetUserInfo"];
            
            isOnline = [groupMember isOnline];
            
            onlineStatus = @"Offline";
            [cell.detailTextLabel setTextColor:[UIColor systemOrangeColor]];
            if (isOnline){
                onlineStatus = @"Currently Online";
                [cell.detailTextLabel setTextColor:[UIColor systemGreenColor]];
            }
            
            
            if (userInfo){
                imageName = [userInfo iconPath];
                
                memberName = [userInfo displayName];
            }
            
            if (bUserInfo){
                
                if (bUserInfo.iconPath){
                imageName = [bUserInfo iconPath];
                }
                
                if (bUserInfo.displayName){
                    memberName = [bUserInfo displayName];
                }
            }
            
            
            baseURL = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
            
            imgURL = [[NSURL alloc] initWithString:baseURL];
            
            
            [cell.imageView setImageWithURL:imgURL placeholderImage:placeholderImg];
            
           
            UIImage *nImage =  [Utilities imageResize:cell.imageView.image andResizeTo:CGSizeMake(60,60)];
            
            [cell.imageView setImage:nImage];
            
            [cell.textLabel setTextColor:[UIColor whiteColor]];

            [cell.textLabel setText:memberName];
            [cell.detailTextLabel setText:onlineStatus];
            
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
    
    if (gMembers != nil){
        iRows = gMembers.count;
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

-(void)loadGroupDetails: (CLNDetail *) anyProfile{
    
    NSString *message = nil,
             *baseURL = nil,
             *bgURL   = nil,
             *strFirst  = nil,
             *strLast   = nil,
             *strPC     = nil;
    
    CLNDetail *profile = nil;
    
    NSURL *imgURL = nil;
    
    NSDate *dteFirst = nil,
           *dteLast  = nil;
    
    NSDateFormatter *dateFormatter = nil;
    @try {
        
        
        dteFirst = [[NSDate alloc] init];
        dteLast  = [[NSDate alloc] init];
        
        dateFormatter = [[NSDateFormatter alloc] init];
        
            
        if (anyProfile){
            
            
            profile = (CLNDetail*) anyProfile;
            
            if (profile){
                
                
                baseURL = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,profile.avatarPath];
                
                bgURL =  [NSString stringWithFormat:@"%@%@", kBungieBaseURL,profile.bannerPath];
                
                imgURL = [[NSURL alloc] initWithString:baseURL];
                
                [self.imgPlayerBG setImageWithURL:[NSURL URLWithString:bgURL]];
                
                [self.imgPlayerLogo setImageWithURL:imgURL];
                

                
                [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:profile.locale]];
                
                [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
               
                dteFirst  = [dateFormatter dateFromString:profile.creationDate];
                //dteLast   = [dateFormatter dateFromString:profile.modificationDate];
                
                NSNumber *mCount = [NSNumber numberWithDouble:profile.memberCount];
                
                strPC  =  [NSString stringWithFormat:@"%d",mCount.integerValue] ;
                
                
                [self.lblMembershipId setText:strPC];
                
                dateFormatter.timeStyle = NSDateFormatterShortStyle;
                dateFormatter.dateStyle = NSDateIntervalFormatterMediumStyle;
                
                strFirst = [profile about];
                strLast  = [dateFormatter stringFromDate:dteFirst];
                
                
                [self.lblFirstAccessed setText:strFirst];
                [self.lblLastAccessed setText:strLast];
                
                [self.lblPlayerMotto setText:profile.motto];
                [self->_lblPlayerName setText:profile.name];
                
                enum Destiny2MembershipType mType = Xbox;
                
                //xbox = 1
                message = profile.groupId;
                
                
               // [self.tblMemberships reloadData];
                
                [self loadGroupMembers:message];
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

-(void)loadGroupMembers: (NSString *) anyMembership{
 
    
    NSLog(@"1:GroupViewController:loadGroupMembers:Invoked for GroupID->%@",anyMembership);
    
    [NetworkAPISingleClient retrieveGroupMembers:anyMembership
                                   completionBlock:^(NSArray *groupData){
     
        if(groupData){
            
            CLNMBaseClass *members =   (CLNMBaseClass*) [groupData firstObject];
            
            if (members){
                 
                CLNMResponse *groupResponse = [[CLNMResponse alloc] initWithDictionary: members.response];
                
                NSArray *results = (NSArray*) [groupResponse results];
                
              
                   if (results){
                        
                        NSLog(@"2:GroupViewController:loadGroupMembers:Group Members Data Received:Count=%lu",(unsigned long)results.count);
                        
                        //Set memberships to delegate
                        //[appDelegate setDestinyMemberships:membershipData];
                        
                        NSLog(@"3:GroupViewController:loadMembership:setDestinyMemberships on AppDelegate with the membershipData...");
                        gMembers = results;
                        
                        NSLog(@"4:GroupViewController:loadMembership:Refreshing tblMemberships DataSource...");
                        //Refresh Data with Group Members DataSource
                       [self.tblGroups reloadData];
                        
                        NSLog(@"4:GroupViewController:loadMembership:Triggering kDestinyLoadedMembership Notification...");
                        //Trigger kDestinyLoadedMembership Notification
                       /* [[NSNotificationCenter defaultCenter]
                           postNotificationName:kDestinyLoadedMembership
                                         object:membershipData];*/
                        
                    }
                    
                }
            
            }
            
            
    }
        andErrorBlock:^(NSError *errorData){
        if (errorData){
            NSLog(@"GroupViewController:loadMembership:Exception->%@",errorData.description);
        }
        
    }];
    
}

-(void) searchBungieGroup: (NSString *) searchGroup{
    
    NSString *bungieGroupName = searchGroup;
    
    [NetworkAPISingleClient searchGroupByName:bungieGroupName completionBlock:^(NSArray *groupData){
     
        if(groupData){
            
            CLNBaseClass *searchBase =  (CLNBaseClass*) [groupData firstObject];
            
            if (searchBase){
                
                CLNResponse *groupResponse = [[CLNResponse alloc] initWithDictionary:[searchBase response]];
    
                if (groupResponse){
                    
                    CLNDetail* groupDetail =  groupResponse.detail;
                        
                    if (groupDetail){
                        
                        
                        NSString *groupID = [groupDetail groupId];
                        
                        @try {
                            
                          
                            if (groupID){
                                
                                [self loadGroupDetails:groupDetail];
                                
                                [self.searchBar setText:@""];
                                [self.view endEditing:YES];
                                [self.activityIndicator stopAnimating];
                            }
                            else{
                               // [self setTitle:@"Profile Not Found"];
                            }
                        } @catch (NSException *exception) {
                            NSLog(@"%@",exception.description);
                          
                        } @finally {
                            NSLog(@"Profile Loaded");
                            groupDetail = nil;

                        }
                         
                       
                    }
                    else{
                        [self.lblPlayerName setText:@"Group Not Found"];
                        
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
