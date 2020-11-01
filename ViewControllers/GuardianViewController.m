//
//  GuardianViewController.m
//  DestinyHelper
//
//  Created by Bertle on 10/8/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "GuardianViewController.h"
#import "NetworkAPISingleClient+LinkedProfiles.h"
#import "DataModels.h"
#import "Constants.h"
#import "GuardianCellTableView.h"

@interface GuardianViewController ()
{
    AppDelegate *appDelegate;
    
    NSMutableDictionary *destCharData;
    
}
@end



@implementation GuardianViewController

@synthesize lblPlayerName = _lblPlayerName;
@synthesize lblPlayerMotto = _lblPlayerMotto;
@synthesize imgPlayerLogo = _imgPlayerLogo;
@synthesize imgPlayerBG   = _imgPlayerBG;
@synthesize destChars = _destChars;
@synthesize memberships = _memberships;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    [self registerNotifications];
    [self initTableView];
    //if (! appDelegate.isCharsLoaded){
        [self loadCharacters];
    //}
}
 

-(void) registerNotifications{

    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedCharactersNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        
        NSMutableDictionary *cData = (NSMutableDictionary*) [note object];
        
        
        NSMutableArray *aData = [[NSMutableArray alloc] initWithCapacity:cData.count];
        
        for (int iData = 0; iData < cData.count; iData++) {
            
            NSIndexPath *iPath = [NSIndexPath indexPathForRow:iData inSection:0];
            
        
            if (! [aData containsObject:iPath]){
                [aData addObject:iPath];
            }
            
        }
        
        [self.tblChars beginUpdates];
        NSLog(@"ProfileViewController:kDestinyLoadedCharactersNotification:Received->%lu",(unsigned long)aData.count);
        [self.tblChars reloadRowsAtIndexPaths:aData
                             withRowAnimation:UITableViewRowAnimationFade];
        [self.tblChars endUpdates];
        
        
        
        if (cData.count == self.destChars.count){
            NSLog(@"ProfileViewController:kDestinyLoadedCharactersNotification:Reloading Table...");
            [self->appDelegate setIsCharsLoaded:YES];
                                  
           // [self.tblChars reloadData];
        }
       
     
        
    }];
    
}
 
-(void) loadCharacters{
 
    NSString *message   = @"loadCharacters called...";
    
    MBRDestinyMemberships *membership = nil;
    
    @try {
        
        
        if (! self.memberships){
            self.memberships = [appDelegate destinyMemberships];
        }
        
        membership = (MBRDestinyMemberships *) [self.memberships objectAtIndex:0];
      
        if (! destCharData){
            destCharData = [[NSMutableDictionary alloc] initWithCapacity:self.destChars.count];
        }
    
        for (int iChars = 0; iChars < self.destChars.count; iChars++) {
         
          
            message = [NSString stringWithFormat:@"1/Profile/%@/Character/%@", membership.membershipId, [_destChars objectAtIndex:iChars]];
            
            // Path: MembershipType/Profile/{destinyMembershipId}/Character/{characterId}/
               
               [NetworkAPISingleClient getCharacter:message completionBlock:^(NSArray *values){
                   
                   if (values){
                       
                       if (values){
                           GLSBaseClass *baseClass = (GLSBaseClass*) [values firstObject];
                           
                           if (baseClass){
                               
                               NSArray *respArray = (NSArray*) [baseClass response];
                               
                               if (respArray){
                                   
                                   NSDictionary* profile =  [[NSDictionary alloc] initWithDictionary:respArray];
                                   
                                   if (profile){
                                       
                                       NSDictionary *grd = [profile objectForKey:@"character"];
                                       if (grd){
                                           NSDictionary *grdData = [grd objectForKey:@"data"];
                                           if (grdData){
                                           
                                               NSString *charKey =  [self.destChars objectAtIndex:iChars];
                                                      
                                             
                                               [destCharData setValue:grdData forKey:charKey];
                                            
                                               //Raise the notification that characters is ready
                                               [[NSNotificationCenter defaultCenter]
                                                  postNotificationName:kDestinyLoadedCharactersNotification
                                                object:self->destCharData];
                                               
                                               
                                           }
                                       }
                                   }
                               }
                           }
                       }
                   }
                   
               }
               andErrorBlock:^(NSError *exception){
                   NSLog(@"loadCharacters:NetworkAPISingleClient:getCharacter:Exception->%@",exception.description);
               }];
               
            
        }
        
      
        
    } @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
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




- (void)timerFireMethod:(NSTimer *)t{
    
    NSString *message         = @"";
    
    @try {
        
            
       //TODO:something
            
        
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

 
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *selectedTitle = @"";
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(selectedCell){
        selectedTitle = selectedCell.textLabel.text;
        
        [self setTitle:selectedTitle];
    }
    
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        NSInteger size = 120;
     
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
   // return CGFLOAT_MIN;
    NSInteger size = 5.0f;//90;
    return size;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSInteger size = 5.0f;//90;
    
    return size;
}

-(void) initTableView{
    
    NSString *message = nil;
    @try {
        
        if (! self.tblChars){
            self.tblChars = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f,self.view.frame.size.width, self.view.frame.size.height)];
            
            [self.view addSubview:self.tblChars];
        }
        
        [self.tblChars registerNib:[UINib nibWithNibName:@"GuardianCellTableView"
                                                  bundle:nil]
            forCellReuseIdentifier:@"GuardianCellTableView"];
         
        
        [self.tblChars setDelegate:self];
        [self.tblChars setDataSource:self];
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
 
/*
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSString *message   = nil;
    
    MBRDestinyMemberships *membership = nil;
    
    @try {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
        
        if (! cell){
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"imgCell"];
        }
        
        cell.contentView.superview.backgroundColor = [UIColor blackColor];
       
        
    } @catch (NSException *exception) {
        message = [exception description];
    } @finally {
        if ([message length] > 0){
            NSLog(@"%@",message);
        }
    }
 
}
 */

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GuardianCellTableView *cell = nil;
    
    static NSString *cellId = @"GuardianCellTableView";
    
    NSString *message   = nil,
             *imageName = nil,
             *baseURL   = nil,
             *classHash = nil,
             *genderHash = nil,
             *lightLevel = nil,
             *seal       = nil,
             *progHash   = nil,
             *emblem     = nil;
    
    
    NSDictionary *classDefinitions = nil,
                 *genderDefinitions = nil,
                 *grdData = nil;
    
    NSURL *imageURL = nil;
     
    @try {
        
        cell = (GuardianCellTableView*) [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (! cell){
            //cell = [[GuardianCellTableView alloc] init];
            cell = [[GuardianCellTableView alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:cellId];
             
        }
        
        [cell.contentView setBackgroundColor:[UIColor blackColor]];
        
        if ([self.destChars isKindOfClass:[NSArray class]]){
            message =  [self.destChars objectAtIndex:indexPath.row];
        }else{
            NSArray *destCharKeys = [(NSDictionary*) self.destChars allKeys];
            
            message =  [destCharKeys objectAtIndex:indexPath.row];
            
        }

        
        grdData =  [destCharData objectForKey:message];
        
        if (grdData){
        
            classHash  = [grdData objectForKey:@"classHash"];
            genderHash = [grdData objectForKey:@"genderHash"];
            
            lightLevel = [grdData objectForKey:@"light"];
            progHash   = [grdData objectForKey:@"progressionHash"];
            seal       = [grdData objectForKey:@"titleRecordHash"];
            
            imageName  = [grdData objectForKey:@"emblemPath"];
            
            emblem = [grdData objectForKey:@"emblemBackgroundPath"];
            
            
            baseURL    = [NSString stringWithFormat:@"%@%@", kBungieBaseURL,imageName];
            
            emblem = [NSString stringWithFormat:@"%@%@",kBungieBaseURL,emblem];
            
            
            if (appDelegate.destinyClassDefinitions){
                classDefinitions = [appDelegate destinyClassDefinitions];
                
                
                NSString *strClassHash = [NSString stringWithFormat:@"%@",classHash],
                         *strHKey = [[Hunter class] key],
                         *strTKey = [[Titan class] key],
                         *strWKey = [[Warlock class] key],
                         *strText = nil,
                         *strLight = [NSString stringWithFormat:@"%@",lightLevel];
               
                //imageURL = [[NSURL alloc] initWithString:baseURL];
                
                imageURL = [[NSURL alloc] initWithString:emblem];
                
                [cell.imgBackground setImageWithURL:imageURL];
              
                [cell.lblLightLevel setText:strLight];
  

                if ([strClassHash isEqualToString:strHKey]){
                    Hunter *hunter = (Hunter*) [classDefinitions objectForKey:strClassHash];
                    
                    if (hunter){
                        strText  = [NSString stringWithFormat:@"%@", hunter.className];
                       }
                }
                
                if ([strClassHash isEqualToString:strTKey]){
                    Titan *titan = (Titan*) [classDefinitions objectForKey:strClassHash];
                    
                    if (titan){
                        strText  = [NSString stringWithFormat:@"%@", titan.className];
                    }
                }
                
                if ([strClassHash isEqualToString:strWKey]){
                    Warlock *warlock = (Warlock*) [classDefinitions objectForKey:strClassHash];
                    
                    if (warlock){
                        strText  = [NSString stringWithFormat:@"%@", warlock.className];
                    }
                }
                
                [cell.lblGuardianClass setText:strText];
                
            }
            
            if (appDelegate.destinyGenderDefinitions){
                
                genderDefinitions = [appDelegate destinyGenderDefinitions];
                
                
                GenderedClassNamesByGenderHash *male   = [[GenderedClassNamesByGenderHash alloc] init],
                                               *female = [[GenderedClassNamesByGenderHash alloc] init];
                
                NSString *strGenderHash = [NSString stringWithFormat:@"%@",genderHash],
                         *strMKey       = [[GenderedClassNamesByGenderHash class] maleHash],
                         *strFKey       = [[GenderedClassNamesByGenderHash class] femaleHash],
                         *strGender     = nil;
                
                NSDictionary *cGender = [genderDefinitions objectForKey:strGenderHash];
                
                if ([strGenderHash isEqualToString:strFKey]){
                    female = [[GenderedClassNamesByGenderHash alloc] initWithDictionary:cGender];
                    
                    if (female){
                       
                        strGender = [[GenderedClassNames class] femaleKey];
                    }
                }
                
                
                if ([strGenderHash isEqualToString:strMKey]){
                    male = [[GenderedClassNamesByGenderHash alloc] initWithDictionary:cGender];
                    
                    if (male){
                       
                        strGender =  [[GenderedClassNames class] maleKey];
                    }
                }
                
                [cell.lblGuardianGender setText:strGender];
            }
            
        }else{
           // [cell.textLabel setText:@"Loading Character..."];
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
    
 
    if(!self.destChars){
        self.destChars = [appDelegate destinyCharacters];
    }
    
    if (self.destChars != nil){
        iRows = self.destChars.count;
    }
    
    return iRows;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

 

@end
