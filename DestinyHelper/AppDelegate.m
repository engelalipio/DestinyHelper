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
#import "NetworkAPISingleClient+SearchUser.h"
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
@synthesize  destinyVendors = _destinyVendors;
@synthesize  currentLocale = _currentLocale;
@synthesize  destinyClassDefinitions = _destinyClassDefinitions;
@synthesize  destinyGenderDefinitions = _destinyGenderDefinitions;
@synthesize  isCharsLoaded = _isCharsLoaded;
@synthesize  currentAuthResponse = _currentAuthResponse;
@synthesize  currentAccessToken = _currentAccessToken;
@synthesize  currentRefreshToken = _currentRefreshToken;
@synthesize  currentAccessTokenValue = _currentAccessTokenValue;
@synthesize  currentPublicVendors = _currentPublicVendors;
@synthesize  isPublicVendorsLoaded = _isPublicVendorsLoaded;
@synthesize  currentMembershipType = _currentMembershipType;
@synthesize  destinyInventoryBucketDefinitions = _destinyInventoryBucketDefinitions;
@synthesize  destinyItemCategoryDefinitions = _destinyItemCategoryDefinitions;
@synthesize  currentMembershipID = _currentMembershipID;
@synthesize  destinyItemVendorsDetailDefinitions = _destinyItemVendorsDetailDefinitions;
@synthesize  destinyVendorGroupDefinitions = _destinyVendorGroupDefinitions;
@synthesize  destinyInventoryItemDefinitions = _destinyInventoryItemDefinitions;
@synthesize  userSettings = _userSettings;

+(AppDelegate *) currentDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)saveCustomObject:(NSObject *)object key:(NSString *)key {
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:key];
    [defaults synchronize];
    
}

- (NSObject *)loadCustomObjectWithKey:(NSString *)key {
    if (! _userSettings){
        _userSettings = [NSUserDefaults standardUserDefaults];
    }
    NSData *encodedObject = [_userSettings objectForKey:key];
    NSArray *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}


-(void) checkAccessToken{
    
    if (! _userSettings){
        _userSettings = [NSUserDefaults standardUserDefaults];
    }
    
    AccessToken *aToken = (AccessToken*) [self loadCustomObjectWithKey:@"AccessToken"];
    
    if (aToken){
        NSLog(@"AppDelegate:checkAccessToken:Access Token already exists...");
        
        NSDate *dteNow = [[NSDate alloc] init];
    
        NSDateInterval *tokenExpInterval =  (NSDateInterval*) [self loadCustomObjectWithKey:@"tokenExpInterval"];
        
        if (tokenExpInterval){
            
            NSComparisonResult compResult =  [dteNow compare:tokenExpInterval.endDate];
            
            if (compResult == NSOrderedAscending){
                NSLog(@"AppDelegate:checkAccessToken:tokenExpInterval still valid...");
                [self setCurrentAccessToken:aToken];
            }
            else{
                NSLog(@"AppDelegate:checkAccessToken:tokenExpInterval needs to be refreshed!");
                return ;
            }
        }
        
        

    }
    
    RefreshToken *rToken = (RefreshToken*) [self loadCustomObjectWithKey:@"RefreshToken"];
    
    if (rToken){
        NSLog(@"AppDelegate:checkAccessToken:Refresh Token already exists...");
        [self setCurrentRefreshToken:rToken];
    }
    
    NSString *strTokenValue = (NSString*) [self loadCustomObjectWithKey:@"currentAccessTokenValue"];
    
    if (strTokenValue){
        NSLog(@"AppDelegate:checkAccessToken:Current Access Token Value already exists...");
        [self setCurrentAccessTokenValue:strTokenValue];
    }
    
    Response  *aResponse  = (Response*) [self loadCustomObjectWithKey:@"AuthResponse"];
    
    if (aResponse){
        NSLog(@"AppDelegate:checkAccessToken:AuthResponse already exists...");
        [self setCurrentAuthResponse:aResponse];
        [self loadMembership:aResponse.membershipId];
    }
    
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _interval  = 5;
    _isManifestLoaded = NO;
    _isCharsLoaded = NO;
    _isPublicVendorsLoaded = NO;
    _currentLocale = @"en";
    _isOffLine = YES;
    _currentMembershipType = Xbox;
    _userSettings = [NSUserDefaults standardUserDefaults];
    
    [self checkAccessToken];
    
    [self registerNotifications];
    
    [self loadDestinyManifest];
    
    return YES;
}


-(void) applicationDidReceiveMemoryWarning:(UIApplication *)application{
 
    NSLog(@"AppDelegate:applicationDidReceiveMemoryWarning:Invoked...");
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
        
        NSLog(@"AppDelegate:LoginOAuthResponse:kDestinyOAuthSFNotification:Received");
        
        if (oAuthResponse != nil){
            
            AccessToken *aToken  = nil;
            RefreshToken *rToken = nil;
            Response    *aResponse = [[Response alloc] init];
          
            NSString *strExpires = nil,
                     *strTokenValue = @"";
            
            double expAuth = 0,
                   expRefr = 0;
            
            
            if ([oAuthResponse objectForKey:@"access_token"] != nil){
                
                strTokenValue = (NSString*) [oAuthResponse objectForKey:@"access_token"];
                
                if ([strTokenValue length] > 0){
                
                  NSLog(@"AppDelegate:LoginOAuthResponse:AccessToken->%@",strTokenValue);
                    self->_currentAccessTokenValue = strTokenValue;
                    
                    [self saveCustomObject:strTokenValue key:@"currentAccessTokenValue"];
                    
                }
                
                aToken = [[AccessToken alloc] init];
                
                [aToken setValue:strTokenValue];
                
                strExpires = [oAuthResponse objectForKey:@"expires_in"];
                
                if (strExpires){
                    expAuth = [strExpires doubleValue];
                    [aToken setExpires:expAuth];
                    
                    NSDate *dteTokenStart = [[NSDate alloc] init];
                
                    NSDateInterval *tokenExpInterval =   [[NSDateInterval alloc] initWithStartDate:dteTokenStart
                                                                                          duration:expAuth];
                    
                    if (tokenExpInterval){
                        [self saveCustomObject:tokenExpInterval key:@"tokenExpInterval"];
                    }
                }
                
                if (aToken != nil){
                    [aResponse setAccessToken:aToken];
                    
                    [self setCurrentAccessToken:aToken];
                    
                    [self saveCustomObject:aToken key:@"AccessToken"];
                    
                    
                }
                
            }
            
            //Refresh Token
            if ([oAuthResponse objectForKey:@"refresh_token"] != nil){
                
                rToken = [[RefreshToken alloc] init];
                
                 
                [rToken setValue:[oAuthResponse objectForKey:@"refresh_token"]];
                
                strExpires = [oAuthResponse objectForKey:@"refresh_expires_in"];
                
                expRefr = [strExpires doubleValue];
                
                [rToken setExpires:expRefr];
                
                if (rToken != nil){
                    [aResponse setRefreshToken:rToken];
                    [self setCurrentRefreshToken:rToken];
                    
                    [self saveCustomObject:rToken key:@"RefreshToken"];
                    
                }
                
            }
            
            if ([oAuthResponse objectForKey:@"membership_id"] != nil){
                [aResponse setMembershipId:[oAuthResponse objectForKey:@"membership_id"]];
            }
            if (aResponse != nil){
                [self setCurrentAuthResponse:aResponse];
                
                [self saveCustomObject:aResponse key:@"AuthResponse"];
                
                [self loadMembership:aResponse.membershipId];
                 
            }
           
        }
        
    }];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedDestinyItemsNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        NSLog(@"AppDelegate:kDestinyLoadedDestinyItemsNotification called");
        
        NSDictionary *manifest = (NSDictionary*) [note object],
                     *userInfo = (NSDictionary*) [note userInfo];
        
       
        if (userInfo){
            for (int iUserData; iUserData < userInfo.allKeys.count; iUserData++) {
                NSString *keyName = [userInfo.allKeys objectAtIndex:iUserData],
                         *valueName = [userInfo objectForKey:keyName];
                
                NSLog(@"AppDelegate:kDestinyLoadedDestinyItemsNotification:PostedInfo:%d->[%@]:[%@]",iUserData,keyName,valueName);
            }
        }
        
        
                                                     
        
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyManifestNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        NSLog(@"AppDelegate:kDestinyManifestNotification called");
        
        NSDictionary *manifest = (NSDictionary*) [note object],
                     *userInfo = (NSDictionary*) [note userInfo];
        
       
        if (userInfo){
            for (int iUserData; iUserData < userInfo.allKeys.count; iUserData++) {
                NSString *keyName = [userInfo.allKeys objectAtIndex:iUserData],
                         *valueName = [userInfo objectForKey:keyName];
                
                NSLog(@"AppDelegate:kDestinyManifestNotification:PostedInfo:%d->[%@]:[%@]",iUserData,keyName,valueName);
            }
        }
        
        [self setDestinyManifest:manifest];
        [self setIsManifestLoaded:YES];
        
        [self populateManifestDefinitions :note];
                                                     
        
    }];
    
 
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedMembership
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        NSLog(@"AppDelegate:kDestinyLoadedMembership called");
        
        NSDictionary  *userInfo = (NSDictionary*) [note userInfo];
        
        NSArray       *membership = (NSArray*) [note object];
        
        MBRResponse *memberResponse = nil;
        
        if (userInfo){
            
            
            
            for (int iUserData = 0; iUserData < userInfo.allKeys.count; iUserData++) {
                NSString *keyName = [userInfo.allKeys objectAtIndex:iUserData],
                         *valueName = [userInfo objectForKey:keyName];
                
                if ([keyName isEqualToString:@"CurrentMemberShipResponse"]){
                    memberResponse = (MBRResponse*) valueName;
                    
                    if (memberResponse){
                        [self setCurrentMembership: memberResponse];
                    }
                }
                //NSLog(@"AppDelegate:kDestinyLoadedMembership:PostedInfo:%d->[%@]:[%@]",iUserData,keyName,valueName);
            }
        }
        
        
        
        if (membership){
            [self setDestinyMemberships:membership];
            [self loadCharacters:note];
        }
                                                     
        
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedCharactersNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        NSLog(@"AppDelegate:kDestinyLoadedCharactersNotification called");
        
        NSDictionary  *userInfo = (NSDictionary*) [note userInfo];
        NSArray *destChars = (NSArray*) [note object];
        
        
        if (userInfo){
            for (int iUserData; iUserData < userInfo.allKeys.count; iUserData++) {
                NSString *keyName = [userInfo.allKeys objectAtIndex:iUserData],
                         *valueName = [userInfo objectForKey:keyName];
                
                NSLog(@"AppDelegate:kDestinyLoadedCharactersNotification:PostedInfo:%d->[%@]:[%@]",iUserData,keyName,valueName);
            }
        }
        
        if (destChars){
            [self setDestinyCharacters:destChars];
            [self setIsCharsLoaded:YES];
            [self loadPublicVendors:note];
        }
                                                     
        
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kDestinyLoadedPublicVendorsNotification
        object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        NSLog(@"AppDelegate:kDestinyLoadedPublicVendorsNotification called");
        
        NSDictionary  *userInfo = (NSDictionary*) [note userInfo];
        VNDBaseClass *publicVendors = (VNDBaseClass*) [note object];
        
        
        if (userInfo){
            
            NSString *className =  [userInfo objectForKey:@"ClassName"],
                     *methodName =  [userInfo objectForKey:@"MethodName"];
            
            if ([className isEqualToString:@"AppDelegate"] && [methodName isEqualToString:@"loadPublicVendors"]){
                
                
                if (publicVendors){
                    [self setCurrentPublicVendors:publicVendors];
                    [self setIsPublicVendorsLoaded:YES];
                }
                
            }
            
        }

                                                     
        
    }];
    
}

-(void) populateManifestDefinitions : (NSNotification *) manifestNotification{
    
    
    dispatch_queue_t myCustomQueue;
    
    myCustomQueue = dispatch_queue_create("com.ams.DestinyHelper", NULL);
     
    dispatch_async(myCustomQueue, ^{
        
        NSLog(@"[Custom Queue Async ->com.ams.DestinyHelper Started...]");
        
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
                            
                            if ([defKeyName isEqualToString:@"DestinyVendorGroupDefinition"]){
                                
                                
                                jsonPath = [Utilities retrieveDataFromJSONFile:defKeyName
                                                                  andExtension:@"json"];
                                
                                if (jsonPath){
                                   
                                    NSMutableDictionary *vendorGroups = [[NSMutableDictionary alloc] initWithCapacity:jsonPath.allKeys.count];
                                    
                                    for (int iCat = 0; iCat < jsonPath.allKeys.count; iCat++) {
                                        
                                        NSString *vKey   = (NSString*) [jsonPath.allKeys objectAtIndex:iCat];
                                        
                                        NSDictionary *currentVendorGroup = [jsonPath objectForKey:vKey];
                                        
                                        if (currentVendorGroup){
                                            
                                            VendorGroupDefinition *vendorGroup = [[VendorGroupDefinition alloc] initWithDictionary:currentVendorGroup];
                                            
                                            if (vendorGroup){
                                                if (![vendorGroups.allKeys containsObject:vKey]){
                                                    [vendorGroups setValue:vendorGroup forKey:vKey];
                                                }
                                                
                                            }
                                        }
                                        
                                    }
                                    
                                    
                                    if (! _destinyVendorGroupDefinitions){
                                        self.destinyVendorGroupDefinitions = [[NSDictionary alloc] initWithDictionary:vendorGroups];
                                    }
                                    
                                    
                                }
                            }
                            
                            
                            //Has  @autoreleasepool
                            if ([defKeyName isEqualToString:@"DestinyVendorDefinition"]){
                                
                                
                                jsonPath = [Utilities retrieveDataFromJSONFile:defKeyName
                                                                  andExtension:@"json"];
                                
                                if (jsonPath){
                                   
                                    NSMutableDictionary *vendors = [[NSMutableDictionary alloc] initWithCapacity:jsonPath.allKeys.count];
                                    
                                    for (int iCat = 0; iCat < jsonPath.allKeys.count; iCat++) {
                                        
                                        NSString *vKey = nil;
                                        
                                        NSDictionary *currentVendor = nil;
                                        
                                        VNDDetails * vendorDetail = nil;
                                        
                                        @autoreleasepool{
                                            
                                            @try {
                                                
                                                vKey   = (NSString*) [jsonPath.allKeys objectAtIndex:iCat];
                                                
                                                currentVendor = [jsonPath objectForKey:vKey];
                                                
                                                if (currentVendor){
                                                    
                                                    vendorDetail = [[VNDDetails alloc] initWithDictionary:currentVendor];
                                                    
                                                    if (vendorDetail){
                                                        if (![vendors.allKeys containsObject:vKey]){
                                                            [vendors setValue:vendorDetail forKey:vKey];
                                                        }
                                                        
                                                    }
                                                }
                                                
                                            }
                                            @finally {
                                                
                                                vKey = nil;
                                                
                                                currentVendor = nil;
                                                
                                                vendorDetail = nil;
                                            }
                                        }
                                        
                                    }
                                    
                                    
                                    if (! _destinyItemVendorsDetailDefinitions){
                                        self.destinyItemVendorsDetailDefinitions = [[NSDictionary alloc] initWithDictionary:vendors];
                                        NSLog(@"AppDelegate:DestinyVendorDefinition:Load Completed:[%d]->Total Vendors.",vendors.count);
                                    }
                                    
                                    
                                }
                            }
                            
                            if ([defKeyName isEqualToString:(@"DestinyItemTierTypeDefinition")]){
                                
                                jsonPath = [Utilities retrieveDataFromJSONFile:defKeyName
                                                                  andExtension:@"json"];
                                
                                if (jsonPath){
                                    
                                    NSMutableDictionary *tiers = [[NSMutableDictionary alloc] initWithCapacity:jsonPath.allKeys.count];
                                    
                                    for (int iCat = 0; iCat < jsonPath.allKeys.count; iCat++) {
                                        
                                        NSString *cKey   = [jsonPath.allKeys objectAtIndex:iCat];
                                        
                                        NSDictionary *currentTier = [jsonPath objectForKey:cKey];
                                        
                                        if (currentTier){
                                            
                                            DestinyItemTierTypeDefinition *itemTierDef = [[DestinyItemTierTypeDefinition alloc] initWithDictionary:currentTier];
                                            
                                            if (itemTierDef){
                                                if (![tiers.allKeys containsObject:cKey]){
                                                    [tiers setValue:itemTierDef forKey:cKey];
                                                }
                                                
                                            }
                                        }
                                        
                                    }
                                    
                                    
                                    if (! _destinyItemCategoryDefinitions){
                                        self.destinyItemCategoryDefinitions = [[NSDictionary alloc] initWithDictionary:tiers];
                                    }
                                    
                                }
                                
                            }
                            
                            if ([defKeyName isEqualToString:(@"DestinyItemCategoryDefinition")]){
                             
                                jsonPath = [Utilities retrieveDataFromJSONFile:defKeyName
                                                                  andExtension:@"json"];
                                
                                if (jsonPath){
                                    
                                    NSMutableDictionary *categories = [[NSMutableDictionary alloc] initWithCapacity:jsonPath.allKeys.count];
                                    
                                    for (int iCat = 0; iCat < jsonPath.allKeys.count; iCat++) {
                                        
                                        NSString *cKey   = [jsonPath.allKeys objectAtIndex:iCat];
                                        
                                        NSDictionary *currentCategory = [jsonPath objectForKey:cKey];
                                        
                                        if (currentCategory){
                                            
                                            DestinyItemCategoryDefinition *itemCatDef = [[DestinyItemCategoryDefinition alloc] initWithDictionary:currentCategory];
                                            
                                            if (itemCatDef){
                                                if (![categories.allKeys containsObject:cKey]){
                                                    [categories setValue:itemCatDef forKey:cKey];
                                                }
                                                
                                            }
                                        }
                                        
                                    }
                                    
                                    
                                    if (! _destinyItemCategoryDefinitions){
                                        self.destinyItemCategoryDefinitions = [[NSDictionary alloc] initWithDictionary:categories];
                                    }
                                    
                                }
                                
                            }
                            
                            if ([defKeyName isEqualToString:(@"DestinyInventoryBucketDefinition")]){
                                
                                jsonPath = [Utilities retrieveDataFromJSONFile:defKeyName
                                                                  andExtension:@"json"];
                                
                                if (jsonPath){
                                    
                                    NSMutableDictionary *buckets = [[NSMutableDictionary alloc] initWithCapacity:jsonPath.allKeys.count];
                                    
                                    for (int iBuck = 0; iBuck < jsonPath.allKeys.count; iBuck++) {
                                        
                                        NSString *bKey   = [jsonPath.allKeys objectAtIndex:iBuck];
                                        
                                        NSDictionary *currentBucket = [jsonPath objectForKey:bKey];
                                        
                                        if (currentBucket){
                                            
                                            DestinyInventoryBucketDefinition *itemBucketDef = [[DestinyInventoryBucketDefinition alloc] initWithDictionary:currentBucket];
                                            
                                            if (itemBucketDef){
                                                if (![buckets.allKeys containsObject:bKey]){
                                                    [buckets setValue:itemBucketDef forKey:bKey];
                                                }
                                                
                                            }
                                        }
                                        
                                    }
                                    
                                    
                                    if (! self->_destinyInventoryBucketDefinitions){
                                        self.destinyInventoryBucketDefinitions = [[NSDictionary alloc] initWithDictionary:buckets];
                                    }
                                    
                                }
                                
                            }
                            
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
                                        
                                        NSString *cKey   = [jsonPath.allKeys objectAtIndex:iGender],
                                                 *mKey   = [[GenderedClassNamesByGenderHash class] maleHash],
                                                 *fKey   = [[GenderedClassNamesByGenderHash class] femaleHash];
                                        
                                       
                                        NSDictionary *currentGender = [jsonPath objectForKey:cKey];
                                        
                                        if ([cKey isEqualToString:mKey]){
                                            male = [[GenderedClassNamesByGenderHash alloc] initWithDictionary:currentGender];
                                            
                                            if (male){
                                                //NSLog(@"Adding Male to _destinyGenderDefinitions");
                                                [genders setValue:male forKey:mKey];
                                            }
                                        }
                                        
                                        if ([cKey isEqualToString:fKey]){
                                            female = [[GenderedClassNamesByGenderHash alloc] initWithDictionary:currentGender];
                                            
                                            if (female){
                                                //NSLog(@"Adding Female to _destinyGenderDefinitions");
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
                                        
                                        NSString *hKey   = [[Hunter class] key],
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
                            
                            //Has  @autoreleasepool
                            if ([defKeyName isEqualToString:@"DestinyInventoryItemDefinition"]){
                                
                                
                                BOOL loadfromFile = YES;
                                
                                NSMutableDictionary *savedItems = (NSMutableDictionary*) [self loadCustomObjectWithKey:@"DestinyInventoryItemDefinition"];
                                
                                if (savedItems){
                                    
                                    if (! _destinyInventoryItemDefinitions){
                                        
                                        self.destinyInventoryItemDefinitions = [[NSMutableDictionary alloc] initWithDictionary:savedItems];
                                        NSLog(@"AppDelegate:loadedCustomObjectWithKey:DestinyInventoryItemDefinition");
                                        
                                        loadfromFile = NO;
                                    }
                                    
                                }
                                
                                jsonPath = [Utilities retrieveDataFromJSONFile:defKeyName
                                                                  andExtension:@"json"];
                                
                                if (jsonPath && loadfromFile){
                                    
                                    NSMutableDictionary *items = nil;
                                    
                                    NSArray *itemsArray = nil;
                                    
                                    if ([jsonPath isKindOfClass:[NSDictionary class]]){
                                        items = [[NSMutableDictionary alloc] initWithCapacity:jsonPath.allKeys.count];
                                        
                                        for (int iCat = 0; iCat < jsonPath.allKeys.count; iCat++) {
                                          
                                            NSString *vKey   = (NSString*) [jsonPath.allKeys objectAtIndex:iCat];
                                            
                                            NSDictionary *itemDefDict = [jsonPath objectForKey:vKey];
                                            
                                            if (itemDefDict){
                                                
                                                INVDDestinyInventoryBaseClass *itemDef = [[INVDDestinyInventoryBaseClass alloc] initWithDictionary:itemDefDict];
                                                
                                                if (itemDef){
                                                    if (![items.allKeys containsObject:vKey]){
                                                        [items setValue:itemDef forKey:vKey];
                                                    }
                                                    
                                                }
                                            }
                                            
                                        }
                                        
                                    }else{
                                        
                                        itemsArray = (NSArray *) jsonPath;
                                        
                                        items = [[NSMutableDictionary alloc] initWithCapacity:itemsArray.count];
                                        
                                        for (int iCat = 0; iCat < itemsArray.count; iCat++) {
                                            
                                            NSDictionary *iDict = nil;
                                            
                                            NSString *vKey  = nil,
                                                     *jKey  = nil;
                                            
                                            NSNumber *objID = nil;
                                            
                                            NSString  *itemDefDict = nil,
                                                      *jsonDefDict = nil;
                                            @autoreleasepool{
                                            @try {
                                                
                                                iDict = (NSDictionary*) [itemsArray objectAtIndex:iCat];
                                                
                                                vKey  = (NSString*) [iDict.allKeys objectAtIndex:0];
                                                jKey  = (NSString*) [iDict.allKeys objectAtIndex:1];
                                                
                                                objID = (NSNumber*) [iDict objectForKey:vKey];
                                                
                                                itemDefDict = [NSString stringWithFormat:@"%@",objID];
                                                
                                                jsonDefDict = [iDict objectForKey:jKey];
                                                
                                                if (itemDefDict && jsonDefDict){
                                                    NSError *writeError = nil;
                                                    NSData *jsonData = nil;
                                                    NSDictionary *jsonDict = nil;
                                                    INVDResponse *itemDef = nil;
                                                    @try {
                                                        
                                                        jsonData = [jsonDefDict dataUsingEncoding:NSUTF8StringEncoding];
                                                        
                                                        jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                                                                 options:0
                                                                                                                   error:&writeError];
                                                
                                                        itemDef = [[INVDResponse alloc] initWithDictionary:jsonDict];
                                                        
                                                        if (itemDef){
                                                            if (![items.allKeys containsObject:itemDefDict]){
                                                                [items setValue:itemDef forKey:itemDefDict];
                                                            }
                                                           
                                                        }
                                                        
                                                    }
                                                     @finally {
                                                       writeError = nil;
                                                       jsonData = nil;
                                                       jsonDict = nil;
                                                        itemDef = nil;
                                                    }
                                                    
                                                }
                                                
                                            }
                                            @catch (NSException *exception) {
                                                NSLog(@"AppDelegate:DestinyInventoryItemDefinition:Exception->%@",exception.description);
                                            }
                                            @finally {
                                                
                                               iDict = nil;
                                                
                                                vKey  = nil;
                                                jKey  = nil;
                                                
                                                objID = nil;
                                                
                                                itemDefDict = nil;
                                                jsonDefDict = nil;
                                                
                                            }
                                          }
                                        }
                                        
                                    }
                                    
                                    
                                    if (! _destinyInventoryItemDefinitions){
                                        self.destinyInventoryItemDefinitions = [[NSMutableDictionary alloc] initWithDictionary:items];
                                        NSLog(@"AppDelegate:DestinyInventoryItemDefinition:Load Completed->%d",items.count);
                                        
                                        [self saveCustomObject:items key:@"DestinyInventoryItemDefinition"];
                                        
                                    }
                                    
                                }
                            }
                            
                        }
                        
                     //   [self loadCharacters];
                        
                    }
                    
                }
                
            }
            
        }
        
        
        NSLog(@"[Custom Queue Async ->com.ams.DestinyHelper Ended...]");
        
    });
 
    
 
}

-(void)loadMembership: (NSString *) anyMembership{
 
    
    NSString *message = [NSString stringWithFormat:@"%@/%@",anyMembership,kBungieDefaultMembership ];
    
    
    [NetworkAPISingleClient retrieveMembershipData:message
                                   completionBlock:^(NSArray *userData){
     
        if(userData){
            
            MBRBaseClass *memberships =   (MBRBaseClass*) [userData firstObject];
            
            if (memberships){
                 
                MBRResponse *memberResponse = [[MBRResponse alloc] initWithDictionary:[memberships response]];
                
                if (memberResponse){
                   [self setCurrentMembershipID:memberResponse.primaryMembershipId];
                }
                NSArray *membershipData = (NSArray*) [memberResponse destinyMemberships];
       
                NSDictionary *callerInfo = [[NSDictionary alloc]
                                            initWithObjectsAndKeys:@"AppDelegate",@"ClassName",
                                                                    @"loadMembership",@"MethodName",
                                                                    memberResponse, @"CurrentMemberShipResponse",
                                                                    nil];
                
        
                    if (membershipData){
                        
                        //This will invoke Membership View Controller
                        [[NSNotificationCenter defaultCenter]
                           postNotificationName:kDestinyLoadedMembership
                         object:membershipData userInfo:callerInfo];
                      
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

 


-(void) loadPublicVendors: (NSNotification *) anyMembership{
 
    NSString *message       = @"loadPublicVendors";
    
    
    //https://www.bungie.net/Platform/Destiny2/Vendors?components=400,401,402
    
    @try {
        
        
        [NetworkAPISingleClient getPublicVendors:message completionBlock:^(NSArray *values) {
            if (values){
                
                VNDBaseClass *baseClass =  (VNDBaseClass*) [values firstObject];
                
                if (baseClass){
                    
                    VNDResponse *response = [[VNDResponse alloc] initWithDictionary:[baseClass response]];
                    
                    if (response){
                        
                        VNDCurrencyLookups *currencyLookups = [response currencyLookups];
                        VNDVendorGroups *vendorGroups = [response vendorGroups];
                        VNDCategories *categories = [response categories];
                        VNDVendors *vendors = [response vendors];
                        VNDSales *sales = [response sales];
                        
                        
                        NSDictionary *callerInfo = [[NSDictionary alloc]
                                                    initWithObjectsAndKeys:@"AppDelegate",@"ClassName",
                                                                           @"loadPublicVendors",@"MethodName",nil];
                        
               
                            
                            //Raise the notification that characters is ready
                         [[NSNotificationCenter defaultCenter]
                            postNotificationName:kDestinyLoadedPublicVendorsNotification
                             object:baseClass userInfo:callerInfo];
                            
                       
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

-(void) loadCharacters: (NSNotification *) anyMembership{
 
    NSString *message       = @"loadCharacters",
             *url           = nil,
             *strMembership = nil;
    
    NSArray *memberships = nil;
    MBRDestinyMemberships *membership = nil;
    
    //https://www.bungie.net/Platform/Destiny2/1/Profile/4611686018450941209
    
    @try {
        
        if ([[anyMembership object] isKindOfClass:[NSArray class]]){
            memberships = (NSArray *) [anyMembership object];
            
            if (memberships){
                membership = (MBRDestinyMemberships *) [memberships firstObject];
            }
           
            strMembership = membership.membershipId;
            
        }
        
        if ([[anyMembership object] isKindOfClass:[NSString class]]){
            strMembership = (NSString *) [anyMembership object];
        }
        
        
       // url = [NSString stringWithFormat:@"%@/1/Profile/%@",kBungieAPIBaseD2URL,strMembership];
        
        [NetworkAPISingleClient getCharacters:strMembership completionBlock:^(NSArray *values) {
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
                                    
                                    NSDictionary *callerInfo = [[NSDictionary alloc]
                                                                initWithObjectsAndKeys:@"AppDelegate",@"ClassName",
                                                                                       @"loadCharacters",@"MethodName",nil];
                                    
                                    if (guardians){
                                        
                                        //Raise the notification that characters is ready
                                     [[NSNotificationCenter defaultCenter]
                                        postNotificationName:kDestinyLoadedCharactersNotification
                                         object:guardians userInfo:callerInfo];
                                        
                                        
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
        
        NSLog(@"AppDelegate:Invoking %@...",message);
        
        @try {

            BaseClass *bClass = nil;
            
            NSDictionary *manifest = nil,
                         *callerInfo = nil;
            
            if (values){
                
                 bClass = (BaseClass *) [values firstObject];
                
                if (bClass){
                    
                    manifest = [[NSDictionary alloc] initWithDictionary:bClass.response];
                    
                    callerInfo = [[NSDictionary alloc] initWithObjectsAndKeys:@"AppDelegate",
                                                                              @"ClassName",
                                                                              @"loadDestinyManifest",
                                                                              @"MethodName",nil];
                    
                    if (manifest){
                        
                         //Raise the notification that Manifest is ready
                         /*[[NSNotificationCenter defaultCenter]
                            postNotificationName:kDestinyManifestNotification
                          object:manifest];*/
                        
                        [[NSNotificationCenter defaultCenter] postNotificationName:kDestinyManifestNotification
                                                                            object:manifest
                                                                          userInfo:callerInfo];
                     }
                    
                }
            }
            
            
        } @catch (NSException *exception) {
            NSLog(@"AppDelegate:loadDestinyManifest:Exception->%@",exception.description);
        } @finally {
           
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
