//
//  AppDelegate.m
//  DestinyHelper
//
//  Created by Bertle on 9/28/20.
//  Copyright © 2020 Agile Mobile Solutions. All rights reserved.
//

#import "AppDelegate.h"
#import "DataModels.h"
#import "Constants.h"
#import "NetworkAPISingleClient+LinkedProfiles.h"
#import "NetworkAPISingleClient+Definition.h"
#import "NetworkAPISingleClient+Auth.h"
#import "Utilities.h"
#import "GuardianViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize  interval = _interval;
@synthesize  isManifestLoaded = _isManifestLoaded;
@synthesize  currentProfile = _currentProfile;
@synthesize  currentMembership = _currentMembership;
@synthesize  destinyManifest = _destinyManifest;
@synthesize  destinyMemberships = _destinyMemberships;
@synthesize  destinyCharacters = _destinyCharacters;
@synthesize  currentLocale = _currentLocale;
@synthesize  destinyClassDefinitions = _destinyClassDefinitions;
@synthesize  destinyGenderDefinitions = _destinyGenderDefinitions;
@synthesize  isCharsLoaded = _isCharsLoaded;
@synthesize  currentAuthResponse = _currentAuthResponse;
@synthesize  currentAccessToken = _currentAccessToken;
@synthesize  currentRefreshToken = _currentRefreshToken;

+(AppDelegate *) currentDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _interval  = 5;
    _isManifestLoaded = NO;
    _isCharsLoaded = NO;
    _currentLocale = @"en";
    _isOffLine = YES;
    
    [self registerNotifications];
    
    [self loadDestinyManifest];
    
    return YES;
}

 

-(BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    
    BOOL result = NO;
    
    NSString *requestValue = @"",
             *sourceApplication = @"",
             *oAuthToken = @"";
    
    NSDictionary *userInfo  = nil;
    
    NSNotificationCenter *notCenter = nil;
    @try {
        
    
        NSLog(@"application openURL options is called");
           
          sourceApplication = [options objectForKey:@"UIApplicationOpenURLOptionsSourceApplicationKey"];
        
        
        // Check the calling application Bundle ID
            if ([[url scheme] isEqualToString:@"amsdh"] )
            {
                NSLog(@"URL scheme:%@", [url scheme]);
                requestValue = [url query];
                
                userInfo  = [[NSDictionary alloc]initWithObjectsAndKeys:requestValue, @"access_token", nil];
                notCenter = [NSNotificationCenter defaultCenter];
                [notCenter postNotificationName:kDestinyOAuthSFNotification object:self userInfo:userInfo];
                result = YES;
              
            }
             
        
    } @catch (NSException *exception) {
        NSLog(@"Open URL Error -> %@",exception.description);
    } @finally {
        oAuthToken = nil;
    }
    
    return result;
}

-(void) registerNotifications{

    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyOAuthSFNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note){
         
        NSDictionary *oAuthResponse = (NSDictionary *) [note object];
        
        NSLog(@"ProfileViewController:kDestinyOAuthSFNotification:Received");
        
        if (oAuthResponse != nil){
            
            AccessToken *aToken = [[AccessToken alloc] init];
            RefreshToken *rToken = [[RefreshToken alloc] init];
            Response    *aResponse = [[Response alloc] init];
            
            NSString *strExpires = nil;
            
            double expAuth = 0,
                   expRefr = 0;
            
            
            [aResponse setMembershipId:[oAuthResponse objectForKey:@"membership_id"]];
            
            strExpires = [oAuthResponse objectForKey:@"expires_in"];
            
            expAuth = [strExpires doubleValue];
            
            [aToken setValue:[oAuthResponse objectForKey:@"access_token"]];
            [aToken setExpires:expAuth];
            
            [rToken setValue:[oAuthResponse objectForKey:@"refresh_token"]];
            
            strExpires = [oAuthResponse objectForKey:@"refresh_expires_in"];
            
            expRefr = [strExpires doubleValue];
            
            [aToken setExpires:expRefr];
            
            [aResponse setAccessToken:aToken];
            [aResponse setRefreshToken:rToken];
            
            if (aResponse != nil){
                
                [self setCurrentAuthResponse:aResponse];
                
                if (aToken != nil){
                    [self setCurrentAccessToken:aToken];
                    
                }
                
               
                if (rToken != nil){
                    [self setCurrentRefreshToken:rToken];
                }
                
            }
            
            
        }
        
                                                    
        
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyManifestNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                                                          
        [self populateManifestDefinitions :note];
                                                     
        
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedMembership
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
                                                          
        [self loadCharacters:note];
                                                     
        
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedCharactersNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
             
        NSArray *destChars = (NSArray*) [note object];
        
        if (destChars){
            [self setDestinyCharacters:destChars];
        }
        NSLog(@"AppDelegate:kDestinyLoadedCharactersNotification called");
                                                     
        
    }];
    
   

    
}

-(void) populateManifestDefinitions : (NSNotification *) manifestNotification{
    
    
    NSDictionary *manifest = nil,
                 *response = nil,
                 *jsonPaths = nil,
                 *jsonPath  = nil;
    
    if (self.isManifestLoaded){
    
        manifest = (NSDictionary*) [manifestNotification object];
        
        response = [manifest objectForKey:@"jsonWorldComponentContentPaths"];
        
        if (response){
            
            if (self.currentLocale){
                
                jsonPaths = [response objectForKey:self.currentLocale];
                
                if (jsonPaths){
                    
                    NSArray *definitionKeys = [jsonPaths allKeys];
                    
                    for (int iPath = 0; iPath < definitionKeys.count; iPath++) {
                        
                        NSString *defKeyName = [definitionKeys objectAtIndex:iPath];
                        
                        if ([defKeyName isEqualToString:(@"DestinyGenderDefinition")]){
                            
                            jsonPath = [Utilities retrieveDataFromJSONFile:defKeyName
                                                              andExtension:@"json"];
                            
                            if (jsonPath){
                             
                                GenderedClassNamesByGenderHash *male   = nil,
                                                               *female = nil;
                                
                                NSMutableDictionary *genders = [[NSMutableDictionary alloc] initWithCapacity:jsonPath.allKeys.count];
                                
                                for (int iGender = 0; iGender < jsonPath.allKeys.count; iGender++) {
                                    
                                    male = [[GenderedClassNamesByGenderHash alloc] init];
                                    female = [[GenderedClassNamesByGenderHash alloc] init];
                                    
                                    NSString *cKey   =  [jsonPath.allKeys objectAtIndex:iGender],
                                             *mKey   = [[GenderedClassNamesByGenderHash class] maleHash],
                                             *fKey   = [[GenderedClassNamesByGenderHash class] femaleHash];
                                    
                                   
                                    NSDictionary *currentGender = [jsonPath objectForKey:cKey];
                                    
                                    if ([cKey isEqualToString:mKey]){
                                        male = [[GenderedClassNamesByGenderHash alloc] initWithDictionary:currentGender];
                                        
                                        if (male){
                                            NSLog(@"Adding Male to _destinyGenderDefinitions");
                                            [genders setValue:male forKey:mKey];
                                        }
                                    }
                                    
                                    if ([cKey isEqualToString:fKey]){
                                        female = [[GenderedClassNamesByGenderHash alloc] initWithDictionary:currentGender];
                                        
                                        if (female){
                                            NSLog(@"Adding Female to _destinyGenderDefinitions");
                                            [genders setValue:female forKey:fKey];
                                        }
                                    }
                                }
                                
                                if (! _destinyGenderDefinitions){
                                    self.destinyGenderDefinitions = [[NSDictionary alloc] initWithDictionary:genders];
                                }
                                
                            }
                        }
                        
                        if ([defKeyName isEqualToString:(@"DestinyClassDefinition")]){
                            
                            
                            jsonPath = [Utilities retrieveDataFromJSONFile:defKeyName
                                                              andExtension:@"json"];
                            
                            if (jsonPath){
                               
                                Hunter *hunter = nil;
                                Warlock *warlock = nil;
                                Titan *titan = nil;
                                
                                NSMutableDictionary *classes = [[NSMutableDictionary alloc] initWithCapacity:jsonPath.allKeys.count];

                                
                                for (int iChars = 0; iChars < jsonPath.allKeys.count; iChars++) {
                                    
                                    NSString *hKey   =  [[Hunter class] key],
                                             *tKey   = [[Titan class] key],
                                             *wKey   = [[Warlock class] key],
                                             *cKey   = [jsonPath.allKeys objectAtIndex:iChars];
                                    
                                    NSDictionary *currentCharacter = [jsonPath objectForKey:cKey];
                                    
                                  
                                    if ([hKey isEqualToString:cKey]){
                                        
                                        hunter = [[Hunter alloc] initWithDictionary:currentCharacter];
                                        
                                        if (hunter){
                                            [hunter setClassName:@"Hunter"];
                                            
                                            [classes setValue:hunter forKey:cKey];
                                        }
                                    }
                                    
                                    if ([tKey isEqualToString:cKey]){
                                        titan = [[Titan alloc] initWithDictionary:currentCharacter];
                                        
                                        if (titan){
                                            [titan setClassName:@"Titan"];
                                            
                                            [classes setValue:titan forKey:cKey];
      
                                        }
                                    }
                                    
                                    
                                    if ([wKey isEqualToString:cKey]){
                                        warlock = [[Warlock alloc] initWithDictionary:currentCharacter];
                                        
                                        if (warlock){
                                            [warlock setClassName:@"Warlock"];
                                        
                                            [classes setValue:warlock forKey:cKey];
 
                                        }
                                    }
                                    
                                }
                                
                                
                                if (! _destinyClassDefinitions){
                                     self.destinyClassDefinitions = [[NSDictionary alloc] initWithDictionary:classes];
                                }
                            }
                          
                            
                        }
                        
                        
                    }
                    
                 //   [self loadCharacters];
                    
                }
                
            }
            
        }
        
    }
}


-(void) loadCharacters: (NSNotification *) anyMembership{
 
    NSString *message  = @"loadCharacters",
              *url      = nil;
    
    NSArray *memberships = nil;
    MBRDestinyMemberships *membership = nil;
    
    //https://www.bungie.net/Platform/Destiny2/1/Profile/4611686018450941209
    
    @try {
        
        memberships = (NSArray *) [anyMembership object];
        
        if (memberships){
            
            membership = (MBRDestinyMemberships *) [memberships firstObject];
        }
       
        
        url = [NSString stringWithFormat:@"%@/1/Profile/%@",kBungieAPIBaseD2URL,membership.membershipId];
        
        [NetworkAPISingleClient getCharacters:url completionBlock:^(NSArray *values) {
            if (values){
                
                GLSBaseClass *baseClass =  (GLSBaseClass*) [values firstObject];
                
                if (baseClass){
                    
                    NSArray *respArray = (NSArray*) [baseClass response];
                    
                    if (respArray){
                        
                        NSDictionary* profile =  [[NSDictionary alloc] initWithDictionary:respArray];
                        
                        if (profile){
                            
                            NSDictionary *data =  [profile objectForKey:@"profile"];
                            
                            if (data)
                            {
                                NSDictionary *chars =  [data objectForKey:@"data"];
                                
                                if (chars){
                                    NSArray *guardians = (NSArray*) [chars objectForKey:@"characterIds"];
                                    
                                    if (guardians){
                                        
                                        [self setDestinyCharacters:guardians];
                                        
                                        //Raise the notification that characters is ready
                                        [[NSNotificationCenter defaultCenter]
                                           postNotificationName:kDestinyLoadedCharactersNotification
                                         object:guardians];
                                        
                                    }
                                }
                            }
                        }
                        
                    }
                }
                
                
                
            }
            
            
        } andErrorBlock:^(NSError *exception){
            NSLog(@"%@",exception.description);
        }];
           
        
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


-(void) validateOAuthToken{
    
    @try{
        
       /* [NetworkAPISingleClient retrieveToken:<#(NSString *)#> completionBlock:<#^(NSArray *values)completionBlock#> andErrorBlock:<#^(NSError *)errorBlock#>]
        
        [NetworkAPISingleClient authorize:@"en" completionBlock:^(NSArray *data){
            
            if (data){
                
            }
            
        } andErrorBlock:^(NSError *error){
            NSLog(@"%@",error.description);
        }];*/
        
  
        
    }
    @catch(NSException *oEx){
        
    }
    @finally{
        
    }
    
}

-(void) loadDestinyManifest{
    
    NSString *message = @"loadDestinyManifest";
    
    [NetworkAPISingleClient retrieveManifest:@"Fubar" completionBlock:^(NSArray *values){
        
        NSLog(@"Invoking %@...",message);
        
        if (values){
            
             BaseClass *bClass = (BaseClass *) [values firstObject];
            
            if (bClass){
                
                NSDictionary *manifest = [[NSDictionary alloc] initWithDictionary:bClass.response];
                
                if (manifest){
                    
                    [self setDestinyManifest:manifest];
                    [self setIsManifestLoaded:YES];
                     //Raise the notification that Manifest is ready
                     [[NSNotificationCenter defaultCenter]
                        postNotificationName:kDestinyManifestNotification
                      object:manifest];
                 
                }
                
                
            }
        }
        
        
    }
    andErrorBlock:^(NSError * exception){
        if (exception){
            NSLog(@"%@",exception.description);
        }
    }];
    
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}



@end
