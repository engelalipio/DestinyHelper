
#import "NetworkAPISingleClient+LinkedProfiles.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "DataModels.h"

//https://www.bungie.net/Platform/Destiny2/1/Profile/4611686018450941209?components=100

@implementation NetworkAPISingleClient(LinkedProfiles)

#pragma mark
+ (NSString *)getProfileComponentQueryString:(NSArray *)dictComponents {
    
    NSString   *message     = @"";
    
 
    @try {

        
        if (dictComponents){
            for (int iC; iC <= dictComponents.count; iC++) {
                
                
                
            }
        }
        
 
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
 
    }
    return message;
    
}

+ (NSString*) getAuthorizationTokenHeaderValue{
    
    NSString *tokenValue  = nil,
             *headerValue = nil;
    
    AppDelegate *appDelegate = nil;
    
    @try {
        
          appDelegate = [AppDelegate currentDelegate];
        
            if (appDelegate){
                tokenValue = [appDelegate currentAccessTokenValue];
        
                if (tokenValue ){
                    headerValue = [NSString stringWithFormat:@"Bearer %@",tokenValue];
                    NSLog(@"NetworkAPISingleClient(LinkedProfiles):getAuthorizationTokenHeaderValue:Token->%@",headerValue);
                }
            }
        
    } @catch (NSException *exception) {
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getAuthorizationTokenHeaderValue:Exception->%@",exception.description);
    } @finally {
        tokenValue = nil;
        appDelegate = nil;
    }
    
    return headerValue;
}

///Destiny2/{membershipType}/Profile/{destinyMembershipId}/Item/{itemInstanceId}/
+ (AFJSONRequestOperation *)getInstancedItem:(NSString *)anyInstancedId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message           = @"",
                *servicePath       = @"",
                *tokenValue        = @"",
                *currentMembership = @"",
                *componentOptions  = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    enum Destiny2ComponentType itemInstancesEnum = ITEMINSTANCES,    //300
                               itemPerskEnum     = ITEMPERKS,        //302
                               itemRenderEnum    = ITEMRENDERDATA,   //303
                               itemStatsEnum     = ITEMSTATS,        //304
                               itemSocketsEnum   = ITEMSOCKETS,      //305
                               itemCommonEnum    = ITEMCOMMONDATA,   //307
                               itemPlugObjEnum   = ITEMPLUGOBJECTIVES,//309
                               itemPlugsEnum     = ITEMREUSABLEPLUGS;//310
   
    
    enum Destiny2MembershipType mType = Xbox;
    
    AppDelegate *appDelegate = nil;
 
    @try {

        appDelegate = [AppDelegate currentDelegate];
        
        if (appDelegate){
            mType =  appDelegate.currentMembershipType ;
            
            currentMembership = appDelegate.currentMembershipID;
        }
        
        componentOptions = [NSString stringWithFormat:@"components=%d,%d,%d,%d,%d,%d,%d,%d",
                            itemInstancesEnum,itemPerskEnum,itemRenderEnum,itemStatsEnum,
                            itemSocketsEnum,itemCommonEnum,itemPlugObjEnum,itemPlugsEnum];
        
        ///Destiny2/{membershipType}/Profile/{destinyMembershipId}/Item/{itemInstanceId}/
        
        servicePath = [NSString stringWithFormat:@"%@/%d/Profile/%@/Item/%@/?%@",kBungieAPIBaseD2URL,mType,currentMembership,anyInstancedId,componentOptions];
        
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getInstancedItem->%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseD2URL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [api setDefaultHeader:@"Authorization" value:tokenValue];
        }
        
        request = [api makeGetOperationWithObjecModel:[INSTBaseClass class]
                                               atPath:servicePath
                                      completionBlock:completionBlock
                                        andErrorBlock:errorBlock];
        
       
        message = servicePath;
        
        NSLog(@"Completed::%@",message);
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
}

+ (AFJSONRequestOperation *)getPublicVendors:(NSString *)anyComponents
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *urlPath         = @"",
                *tokenValue      = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
  
    @try {
        
        appDelegate = [AppDelegate currentDelegate];
        
        
        urlPath = [NSString stringWithFormat:@"%@/Vendors/?components=101,400,402",kBungieAPIBaseD2URL];
        
       // servicePath = [NSString stringWithFormat:@"%@?components=%u", urlPath,cType];
        
        servicePath = urlPath;
 
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getPublicVendors=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseURL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [api setDefaultHeader:@"Authorization" value:tokenValue];
        }
        
        
        request = [api makeGetOperationWithObjecModel:[VNDBaseClass class]
                                               atPath:servicePath
                                      completionBlock:completionBlock
                                        andErrorBlock:errorBlock];
        
        message = servicePath;
        
        NSLog(@"Completed::%@",message);
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
}


#pragma mark-> MembershipType/Profile/MembershipId?components=400
+ (AFJSONRequestOperation *)getVendors:(NSString *)anyComponents
                             completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *charID          = @"",
                *strMembership   = @"",
                *urlPath         = @"",
                *tokenValue      = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    enum Destiny2ComponentType cType = VENDORS;
 
    @try {

         
        appDelegate = [AppDelegate currentDelegate];
        
        charID = anyComponents;
        
        if ( appDelegate){
            strMembership = appDelegate.currentMembershipID;
        ///Destiny2/{membershipType}/Profile/{destinyMembershipId}/Character/{characterId}/Vendors/
        }
        
        urlPath = [NSString stringWithFormat:@"%@/1/Profile/%@/Character/%@/Vendors/?components=%d",kBungieAPIBaseD2URL,strMembership,charID,cType];
        
       // servicePath = [NSString stringWithFormat:@"%@?components=%u", urlPath,cType];
        
        servicePath = urlPath;
 
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getVendors=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseURL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [api setDefaultHeader:@"Authorization" value:tokenValue];
        }
        
        request = [api makeGetOperationWithObjecModel:[VNDBaseClass class]
                                               atPath:servicePath
                                      completionBlock:completionBlock
                                        andErrorBlock:errorBlock];
        
        message = servicePath;
        
        NSLog(@"Completed::%@",message);
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
        appDelegate = nil;
    }
    return request;
    
}


#pragma mark-> Path: MembershipType/Profile/{destinyMembershipId}/?components
+ (AFJSONRequestOperation *)getVaultItems:(NSString *)anyMembershipType
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *tokenValue      = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    enum Destiny2ComponentType cType = PROFILEINVENTORIES;
    
    @try {
        
        servicePath = [NSString stringWithFormat:@"%@/%@/?components=%d,201", kBungieAPIBaseD2URL,anyMembershipType,cType];
 
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getVaultItems->%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseD2URL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [api setDefaultHeader:@"Authorization" value:tokenValue];
        }
         
        
        request = [api makeGetOperationWithObjecModel:[VAULTBaseClass class]
                                               atPath:servicePath
                                      completionBlock:completionBlock
                                        andErrorBlock:errorBlock];
        
       
        message = servicePath;
        
        NSLog(@"Completed::%@",message);
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
}

#pragma mark-> MembershipType/Profile/{MembershipId}/?components=100
+ (AFJSONRequestOperation *)getCharacters:(NSString *)anyComponents
                             completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    enum Destiny2ComponentType cType = PROFILES;
 
    @try {
        
        
        servicePath = [NSString stringWithFormat:@"%@/1/Profile/%@/?components=%u",kBungieAPIBaseD2URL,anyComponents,cType];
        
        //servicePath = [NSString stringWithFormat:@"%@?components=%u", anyComponents,cType];
 
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getCharacters->%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseURL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        request = [api makeGetOperationWithObjecModel:[GLSBaseClass class]
                                               atPath:servicePath
                                      completionBlock:completionBlock
                                        andErrorBlock:errorBlock];
        
       
        message = servicePath;
        
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getCharacters:Completed->%@",message);
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getCharacters:Error->%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
    
}

#pragma mark-> Path: MembershipType/Profile/{destinyMembershipId}/Character/{characterId}/Vendors/{vendorId}/
+ (AFJSONRequestOperation *)getVendor:(NSString *)anyVendorId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
 
    NSString    *message         = @"",
                *servicePath     = @"",
                *tokenValue      = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
 
    @try {

        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath = [NSString stringWithFormat:@"%@?components=400,401,402", anyVendorId];
 
        NSLog(@"Invoking::getVendor=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseD2URL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [api setDefaultHeader:@"Authorization" value:tokenValue];
        }
        
        request = [api makeGetOperationWithObjecModel:[VNDDetails class]
                                               atPath:servicePath
                                      completionBlock:completionBlock
                                        andErrorBlock:errorBlock];
        
       
        message = servicePath;
        
        NSLog(@"Completed::%@",message);
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
    
}


+ (AFJSONRequestOperation *)getCharacterInventoryItems:(NSString *)anyCharId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *tokenValue      = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    enum Destiny2ComponentType cType = CHARACTERINVENTORIES;
 
    @try {
        
        servicePath = [NSString stringWithFormat:@"%@?components=200,%d", anyCharId,cType];
 
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getCharacterInventoryItems->%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseD2URL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [api setDefaultHeader:@"Authorization" value:tokenValue];
        }
         
        
        request = [api makeGetOperationWithObjecModel:[INVCBaseClass class]
                                               atPath:servicePath
                                      completionBlock:completionBlock
                                        andErrorBlock:errorBlock];
        
       
        message = servicePath;
        
        NSLog(@"Completed::%@",message);
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
    
}

#pragma mark-> Path: MembershipType/Profile/{destinyMembershipId}/Character/{characterId}/
+ (AFJSONRequestOperation *)getCharacterEquipedItems:(NSString *)anyCharId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *tokenValue      = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    enum Destiny2ComponentType cType = CHARACTEREQUIPMENT;
 
    @try {

        servicePath = [NSString stringWithFormat:@"%@?components=200,%d", anyCharId,cType];
 
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getCharacterEquipedItems->%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseD2URL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [api setDefaultHeader:@"Authorization" value:tokenValue];
        }
        
        request = [api makeGetOperationWithObjecModel:[GRDBaseClass class]
                                               atPath:servicePath
                                      completionBlock:completionBlock
                                        andErrorBlock:errorBlock];
        
       
        message = servicePath;
        
        NSLog(@"Completed::%@",message);
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
    
}


#pragma mark -> Path {membershiptypeid}/Account/{membershipid}/Character/{characterid}/Stats/UniqueWeapons/
+ (AFJSONRequestOperation *)getCharacterUniqueWeaponsStats:(NSString *)anyCharId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
   
    NSString    *message         = @"",
                *servicePath     = @"",
                *charID          = @"",
                *strMembership   = @"",
                *urlPath         = @"",
                *tokenValue      = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
 
    @try {

    
        appDelegate = [AppDelegate currentDelegate];
        
        charID = anyCharId;
        
        if ( appDelegate){
            strMembership = appDelegate.currentMembershipID;
 
        }
        
        urlPath = [NSString stringWithFormat:@"%@/1/Account/%@/Character/%@/Stats/UniqueWeapons",kBungieAPIBaseD2URL,strMembership,charID];
        
       // servicePath = [NSString stringWithFormat:@"%@?components=%u", urlPath,cType];
        
        servicePath = urlPath;
 
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getCharacterUniqueWeaponsStats=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseURL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [api setDefaultHeader:@"Authorization" value:tokenValue];
        }
        
        request = [api makeGetOperationWithObjecModel:[UWHBaseClass class]
                                               atPath:servicePath
                                      completionBlock:completionBlock
                                        andErrorBlock:errorBlock];
        
        message = servicePath;
        
        NSLog(@"Completed::%@",message);
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
        appDelegate = nil;
    }
    return request;
    
    
    
    
}

#pragma mark-> Path: MembershipType/Profile/{destinyMembershipId}/Character/{characterId}/
+ (AFJSONRequestOperation *)getCharacterSummary:(NSString *)anyCharId
                             completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *tokenValue      = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
 
    @try {

        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath = [NSString stringWithFormat:@"%@?components=102,200,201,300", anyCharId];
 
        NSLog(@"Invoking::getCharacter=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseD2URL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [api setDefaultHeader:@"Authorization" value:tokenValue];
        }
        
        request = [api makeGetOperationWithObjecModel:[GLSBaseClass class]
                                               atPath:servicePath
                                      completionBlock:completionBlock
                                        andErrorBlock:errorBlock];
        
       
        message = servicePath;
        
        NSLog(@"Completed::%@",message);
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
    
}


+ (AFJSONRequestOperation *)lockStateItem:(NSString *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = nil,
                *servicePath     = nil,
                *tokenValue      = nil,
                *payload         = nil;
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    NSData *postData = nil;
    
    @try {

        
        if (anyInstancedItem){
            payload = anyInstancedItem;
            payload = [payload stringByReplacingOccurrencesOfString:@"[" withString:@""];
            payload = [payload stringByReplacingOccurrencesOfString:@"]" withString:@""];
        }
        
        postData = [payload dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath =  [NSString stringWithFormat:@"%@/Actions/Items/SetLockState/",kBungieAPIBaseD2URL];
 
        NSLog(@"Invoking::lockStateItem=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:servicePath];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        [request setHTTPMethod:@"POST"];
        
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:kDestinyOriginHeader forHTTPHeaderField:@"Origin"];
        [request setValue:@"www.bungie.net" forHTTPHeaderField:@"Authority" ];
        [request setValue:kBungieAPIKey forHTTPHeaderField:@"X-API-Key"];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [request setValue:tokenValue forHTTPHeaderField:@"Authorization"];
        }
    
        [request setHTTPBody:postData];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config
                                                              delegate:nil
                                                         delegateQueue:[NSOperationQueue mainQueue]];
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData * _Nullable data,
                                                                    NSURLResponse * _Nullable response,
                                                                    NSError * _Nullable error) {
                NSLog(@"NetworkAPISingleClient(LinkedProfiles):lockStateItem:completionHandler...");

                NSHTTPURLResponse *asHTTPResponse = (NSHTTPURLResponse *) response;
            
                NSLog(@"The Response: %@", asHTTPResponse);
                // set a breakpoint on the last NSLog and investigate the response in the debugger

                // if you get data, you can inspect that, too. If it's JSON, do one of these:
                NSDictionary *forJSONObject = [NSJSONSerialization JSONObjectWithData:data
                                                                            options:kNilOptions
                                                                                error:nil];
                // or
                NSArray *forJSONArray = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:kNilOptions
                                                                          error:nil];

                NSLog(@"One of these might exist - object: %@ \n array: %@", forJSONObject, forJSONArray);
            
            
            NSDictionary *callerInfo = [[NSDictionary alloc]
                            initWithObjectsAndKeys:@"NetworkAPISingleClient",@"ClassName",
                                                   @"lockStateItem",@"MethodName",
                                                  anyInstancedItem,@"anyInstancedItem", nil];
                
            [[NSNotificationCenter defaultCenter]
                    postNotificationName:kDestinyLockItemStateNotification
                                    object:forJSONObject
                                    userInfo:callerInfo];
                
            NSLog(@"NetworkAPISingleClient(LinkedProfiles):lockStateItem:completionHandler:Raised->%@",kDestinyLockItemStateNotification);
            
             
                
        }];
       
        [task resume];
         
        NSLog(@"Completed::lockStateItem=%@",servicePath);
    
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
}




+ (AFJSONRequestOperation *)lockStateItemWithAction:(NSObject *)anyInstancedItem
                         lockAction:(NSString *) anyAction
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = nil,
                *servicePath     = nil,
                *tokenValue      = nil,
                *payload         = nil;
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    NSData *postData = nil;
    
    @try {

        
        if (anyInstancedItem){
            payload = anyInstancedItem;
            payload = [payload stringByReplacingOccurrencesOfString:@"[" withString:@""];
            payload = [payload stringByReplacingOccurrencesOfString:@"]" withString:@""];
        }
        
        postData = [payload dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath =  [NSString stringWithFormat:@"%@/Actions/Items/SetLockState/",kBungieAPIBaseD2URL];
 
        NSLog(@"Invoking::lockStateItem=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:servicePath];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        [request setHTTPMethod:@"POST"];
        
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:kDestinyOriginHeader forHTTPHeaderField:@"Origin"];
        [request setValue:@"www.bungie.net" forHTTPHeaderField:@"Authority" ];
        [request setValue:kBungieAPIKey forHTTPHeaderField:@"X-API-Key"];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [request setValue:tokenValue forHTTPHeaderField:@"Authorization"];
        }
    
        [request setHTTPBody:postData];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config
                                                              delegate:nil
                                                         delegateQueue:[NSOperationQueue mainQueue]];
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData * _Nullable data,
                                                                    NSURLResponse * _Nullable response,
                                                                    NSError * _Nullable error) {
                NSLog(@"NetworkAPISingleClient(LinkedProfiles):lockStateItem:completionHandler...");

                NSHTTPURLResponse *asHTTPResponse = (NSHTTPURLResponse *) response;
            
                NSLog(@"The Response: %@", asHTTPResponse);
                // set a breakpoint on the last NSLog and investigate the response in the debugger

                // if you get data, you can inspect that, too. If it's JSON, do one of these:
                NSDictionary *forJSONObject = [NSJSONSerialization JSONObjectWithData:data
                                                                            options:kNilOptions
                                                                                error:nil];
                // or
                NSArray *forJSONArray = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:kNilOptions
                                                                          error:nil];

                NSLog(@"One of these might exist - object: %@ \n array: %@", forJSONObject, forJSONArray);
            
            
            NSDictionary *callerInfo = [[NSDictionary alloc]
                            initWithObjectsAndKeys:@"NetworkAPISingleClient",@"ClassName",
                                @"lockStateItem",@"MethodName",
                                anyInstancedItem,@"InstancedItem",
                                anyAction,@"lockAction", nil];
                
            [[NSNotificationCenter defaultCenter]
                    postNotificationName:kDestinyLockItemStateNotification
                                    object:forJSONObject
                                    userInfo:callerInfo];
                
            NSLog(@"NetworkAPISingleClient(LinkedProfiles):lockStateItem:completionHandler:Raised->%@",kDestinyLockItemStateNotification);
            
             
                
        }];
       
        [task resume];
         
        NSLog(@"Completed::lockStateItem=%@",servicePath);
    
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
}

+ (AFJSONRequestOperation *)pullFromPostMaster:(NSObject *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = nil,
                *servicePath     = nil,
                *tokenValue      = nil,
                *payload         = nil;
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    NSData *postData = nil;
    
    @try {

        
        if (anyInstancedItem){
            payload = anyInstancedItem;
            payload = [payload stringByReplacingOccurrencesOfString:@"[" withString:@""];
            payload = [payload stringByReplacingOccurrencesOfString:@"]" withString:@""];
        }
        
        postData = [payload dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath =  [NSString stringWithFormat:@"%@/Actions/Items/PullFromPostMaster/",kBungieAPIBaseD2URL];
 
        NSLog(@"Invoking::pullFromPostMaster=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:servicePath];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        [request setHTTPMethod:@"POST"];
        
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:kDestinyOriginHeader forHTTPHeaderField:@"Origin"];
        [request setValue:@"www.bungie.net" forHTTPHeaderField:@"Authority" ];
        [request setValue:kBungieAPIKey forHTTPHeaderField:@"X-API-Key"];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [request setValue:tokenValue forHTTPHeaderField:@"Authorization"];
        }
    
        [request setHTTPBody:postData];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config
                                                              delegate:nil
                                                         delegateQueue:[NSOperationQueue mainQueue]];
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData * _Nullable data,
                                                                    NSURLResponse * _Nullable response,
                                                                    NSError * _Nullable error) {
                NSLog(@"NetworkAPISingleClient(LinkedProfiles):pullFromPostMaster:completionHandler...");

                NSHTTPURLResponse *asHTTPResponse = (NSHTTPURLResponse *) response;
            
                NSLog(@"The Response: %@", asHTTPResponse);
                // set a breakpoint on the last NSLog and investigate the response in the debugger

                // if you get data, you can inspect that, too. If it's JSON, do one of these:
                NSDictionary *forJSONObject = [NSJSONSerialization JSONObjectWithData:data
                                                                            options:kNilOptions
                                                                                error:nil];
                // or
                NSArray *forJSONArray = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:kNilOptions
                                                                          error:nil];

                NSLog(@"One of these might exist - object: %@ \n array: %@", forJSONObject, forJSONArray);
            
            
            NSDictionary *callerInfo = [[NSDictionary alloc]
                            initWithObjectsAndKeys:@"NetworkAPISingleClient",@"ClassName",
                                                    @"pullFromPostMaster",@"MethodName", nil];
                
            [[NSNotificationCenter defaultCenter]
                    postNotificationName:kDestinyPullFromPostMasterNotification
                                    object:forJSONObject
                                    userInfo:callerInfo];
                
            NSLog(@"NetworkAPISingleClient(LinkedProfiles):pullFromPostMaster:completionHandler:Raised->%@",kDestinyPullFromPostMasterNotification);
            
             
                
        }];
       
        [task resume];
         
        NSLog(@"Completed::pullFromPostMaster=%@",servicePath);
    
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
}


+ (AFJSONRequestOperation *)equipItem:(NSObject *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = nil,
                *servicePath     = nil,
                *tokenValue      = nil,
                *payload         = nil;
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    NSData *postData = nil;
    
    @try {

        
        if (anyInstancedItem){
            payload = anyInstancedItem;
            payload = [payload stringByReplacingOccurrencesOfString:@"[" withString:@""];
            payload = [payload stringByReplacingOccurrencesOfString:@"]" withString:@""];
        }
        
        postData = [payload dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath =  [NSString stringWithFormat:@"%@/Actions/Items/EquipItem/",kBungieAPIBaseD2URL];
 
        NSLog(@"Invoking::EquipItem=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:servicePath];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        [request setHTTPMethod:@"POST"];
        
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:kDestinyOriginHeader forHTTPHeaderField:@"Origin"];
        [request setValue:@"www.bungie.net" forHTTPHeaderField:@"Authority" ];
        [request setValue:kBungieAPIKey forHTTPHeaderField:@"X-API-Key"];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [request setValue:tokenValue forHTTPHeaderField:@"Authorization"];
        }
    
        [request setHTTPBody:postData];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config
                                                              delegate:nil
                                                         delegateQueue:[NSOperationQueue mainQueue]];
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData * _Nullable data,
                                                                    NSURLResponse * _Nullable response,
                                                                    NSError * _Nullable error) {
                NSLog(@"NetworkAPISingleClient(LinkedProfiles):equipItem:completionHandler...");

                NSHTTPURLResponse *asHTTPResponse = (NSHTTPURLResponse *) response;
            
                NSLog(@"The Response: %@", asHTTPResponse);
                // set a breakpoint on the last NSLog and investigate the response in the debugger

                // if you get data, you can inspect that, too. If it's JSON, do one of these:
                NSDictionary *forJSONObject = [NSJSONSerialization JSONObjectWithData:data
                                                                            options:kNilOptions
                                                                                error:nil];
                // or
                NSArray *forJSONArray = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:kNilOptions
                                                                          error:nil];

                NSLog(@"One of these might exist - object: %@ \n array: %@", forJSONObject, forJSONArray);
            
            
            NSDictionary *callerInfo = [[NSDictionary alloc]
                            initWithObjectsAndKeys:@"NetworkAPISingleClient",@"ClassName",
                                                    @"EquipItem",@"MethodName", nil];
                
            [[NSNotificationCenter defaultCenter]
                    postNotificationName:kDestinyEquipItemNotification
                                    object:forJSONObject
                                    userInfo:callerInfo];
                
            NSLog(@"NetworkAPISingleClient(LinkedProfiles):EquipItem:completionHandler:Raised->%@",kDestinyEquipItemNotification);
            
             
                
        }];
       
        [task resume];
         
        NSLog(@"Completed::EquipItem=%@",servicePath);
    
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
}

+ (AFJSONRequestOperation *)transferItem:(NSObject *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    NSString    *message         = nil,
                *servicePath     = nil,
                *tokenValue      = nil,
                *payload         = nil,
                *vaultPayLoad    = nil,
                *jsonVaultString = nil,
                *jsonString      = nil;
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    NSData *postData = nil;
    
    TRXBaseClass *trxObject = nil,
                 *trxVaultObject = nil;
    
    @try {

        
        if (anyInstancedItem){
            
            trxObject = (TRXBaseClass *) [anyInstancedItem copy];
            trxVaultObject = (TRXBaseClass *) [anyInstancedItem copy];

            if( trxVaultObject){
                trxVaultObject.transferToVault = YES;
            }
            
            if( trxObject){
                trxObject.characterId = trxObject.targetCharacterId;
            }
            
            //BEGIN SENT TO VAULT FIRST
            if (trxVaultObject){
                
                NSDictionary *dictVaultData = [trxVaultObject dictionaryRepresentation];
                            
                NSArray *arrayVaultData = [NSArray arrayWithObject:trxVaultObject.dictionaryRepresentation];
                            
                trxVaultObject  = nil;
                            
                NSError *writeVaultError = nil;
                NSData *jsonVaultData = [NSJSONSerialization dataWithJSONObject:arrayVaultData
                                                                   options:NSJSONReadingMutableContainers
                                                                     error:&writeVaultError];
                            
                NSString *jsonVaultString = [[NSString alloc] initWithData:jsonVaultData
                                                                     encoding:NSUTF8StringEncoding];
                
                jsonVaultString = [jsonVaultString stringByReplacingOccurrencesOfString:@"[" withString:@""];
                jsonVaultString = [jsonVaultString stringByReplacingOccurrencesOfString:@"]" withString:@""];
                
                NSLog(@"JSON Vault Output: %@", jsonVaultString);
                
                postData = [jsonVaultString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
                
                appDelegate = [AppDelegate currentDelegate];
                
                servicePath =  [NSString stringWithFormat:@"%@/Actions/Items/TransferItem/",kBungieAPIBaseD2URL];
         
                NSLog(@"Invoking::transferItem to Vault =%@",servicePath);
                
                url = [[NSURL alloc] initWithString:servicePath];
                
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                                       cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                                   timeoutInterval:60.0];
                [request setHTTPMethod:@"POST"];
                
                [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                [request setValue:kDestinyOriginHeader forHTTPHeaderField:@"Origin"];
                [request setValue:@"www.bungie.net" forHTTPHeaderField:@"Authority" ];
                [request setValue:kBungieAPIKey forHTTPHeaderField:@"X-API-Key"];
                
                tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
                
                if (tokenValue ){
                    [request setValue:tokenValue forHTTPHeaderField:@"Authorization"];
                }
            
                [request setHTTPBody:postData];
                
                NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
                
                NSURLSession *session = [NSURLSession sessionWithConfiguration:config
                                                                      delegate:nil
                                                                 delegateQueue:[NSOperationQueue mainQueue]];
                
                NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                        completionHandler:^(NSData * _Nullable data,
                                                                            NSURLResponse * _Nullable response,
                                                                            NSError * _Nullable error) {
                NSLog(@"NetworkAPISingleClient(LinkedProfiles):transferItem to Vault First:completionHandler...");

                NSHTTPURLResponse *asHTTPResponse = (NSHTTPURLResponse *) response;
                    
                NSLog(@"The Response: %@", asHTTPResponse);
                // set a breakpoint on the last NSLog and investigate the response in the debugger

                // if you get data, you can inspect that, too. If it's JSON, do one of these:
                NSDictionary *forJSONObject = [NSJSONSerialization JSONObjectWithData:data
                                                                              options:kNilOptions
                                                                                error:nil];
                // or
                NSArray *forJSONArray = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:kNilOptions
                                                                          error:nil];

                NSLog(@"One of these might exist - object: %@ \n array: %@", forJSONObject, forJSONArray);
                    
                        
                NSLog(@"NetworkAPISingleClient(LinkedProfiles):TransferItem To Vault :Completed->%@",kDestinyTransferItemNotification);
                    
                
                if (asHTTPResponse.statusCode == 200){
                    
                    //BEGIN SENT TO CHAR FROM VAULT SECOND
                    if (trxObject){
                        
                       [self pullItemFromVault:trxObject
                               completionBlock:^(NSArray *values){
                           NSLog(@"BEGIN SENT TO CHAR FROM VAULT SECOND:%@",@"Completed");
                       } andErrorBlock:^(NSError *anyError) {
                           NSLog(@"BEGIN SENT TO CHAR FROM VAULT SECOND Error:%@",anyError.description);
                       }];
                    }
                    //END SENT TO CHAR FROM VAULT SECOND
                    
                }else{
                    
                    NSDictionary *callerInfo = [[NSDictionary alloc]
                                    initWithObjectsAndKeys:@"NetworkAPISingleClient",@"ClassName",
                                                           @"TransferItemToVaultFirst",@"MethodName",
                                                nil];
                    
                    [[NSNotificationCenter defaultCenter]
                            postNotificationName:kDestinyTransferItemNotification
                                            object:forJSONObject
                                            userInfo:callerInfo];
                    
                }
                }];
                 
                [task resume];
            }
            //END SENT TO VAULT FIRST
            
        }
         
        NSLog(@"Completed::TransferItem=%@",servicePath);
    
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
}

+ (AFJSONRequestOperation *)pullItemFromVault:(NSObject *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = nil,
                *servicePath     = nil,
                *tokenValue      = nil;
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    NSData *postData = nil;
    
    TRXBaseClass *trxObject = nil;
    
    @try {

        
        if (anyInstancedItem){
            
            trxObject = (TRXBaseClass *) [anyInstancedItem copy];
            
            //BEGIN SENT TO CHAR FROM VAULT SECOND
            if (trxObject){
                
                NSDictionary *dictData = [trxObject dictionaryRepresentation];
                            
                NSArray *arrayData = [NSArray arrayWithObject:trxObject.dictionaryRepresentation];
                            
                trxObject  = nil;
                            
                NSError *writeError = nil;
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrayData
                                                                   options:NSJSONReadingMutableContainers
                                                                     error:&writeError];
                            
                NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                                     encoding:NSUTF8StringEncoding];
                
                jsonString = [jsonString stringByReplacingOccurrencesOfString:@"[" withString:@""];
                jsonString = [jsonString stringByReplacingOccurrencesOfString:@"]" withString:@""];
                
                NSLog(@"JSON From Vault Output: %@", jsonString);
                
                postData = [jsonString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
                
                appDelegate = [AppDelegate currentDelegate];
                
                servicePath =  [NSString stringWithFormat:@"%@/Actions/Items/TransferItem/",kBungieAPIBaseD2URL];
         
                NSLog(@"Invoking::transferItem from Vault =%@",servicePath);
                
                url = [[NSURL alloc] initWithString:servicePath];
                
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                                       cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                                   timeoutInterval:60.0];
                [request setHTTPMethod:@"POST"];
                
                [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                [request setValue:kDestinyOriginHeader forHTTPHeaderField:@"Origin"];
                [request setValue:@"www.bungie.net" forHTTPHeaderField:@"Authority" ];
                [request setValue:kBungieAPIKey forHTTPHeaderField:@"X-API-Key"];
                
                tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
                
                if (tokenValue ){
                    [request setValue:tokenValue forHTTPHeaderField:@"Authorization"];
                }
            
                [request setHTTPBody:postData];
                
                NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
                
                NSURLSession *session = [NSURLSession sessionWithConfiguration:config
                                                                      delegate:nil
                                                                 delegateQueue:[NSOperationQueue mainQueue]];
                
                NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                        completionHandler:^(NSData * _Nullable data,
                                                                            NSURLResponse * _Nullable response,
                                                                            NSError * _Nullable error) {
                NSLog(@"NetworkAPISingleClient(LinkedProfiles):transferItem from Vault Second:completionHandler...");

                NSHTTPURLResponse *asHTTPResponse = (NSHTTPURLResponse *) response;
                    
                NSLog(@"The Response: %@", asHTTPResponse);
                // set a breakpoint on the last NSLog and investigate the response in the debugger

                // if you get data, you can inspect that, too. If it's JSON, do one of these:
                NSDictionary *forJSONObject = [NSJSONSerialization JSONObjectWithData:data
                                                                              options:kNilOptions
                                                                                error:nil];
                // or
                NSArray *forJSONArray = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:kNilOptions
                                                                          error:nil];

                NSLog(@"One of these might exist - object: %@ \n array: %@", forJSONObject, forJSONArray);
                    
                        
                NSLog(@"NetworkAPISingleClient(LinkedProfiles):TransferItem From Vault :Completed->%@",kDestinyTransferItemNotification);
                   
                    
                    NSDictionary *callerInfo = [[NSDictionary alloc]
                                    initWithObjectsAndKeys:@"NetworkAPISingleClient",@"ClassName",
                                                           @"TransferItemFromVault",@"MethodName",
                                                           anyInstancedItem,@"TransferObject",nil];
                        
                    [[NSNotificationCenter defaultCenter]
                            postNotificationName:kDestinyTransferItemNotification
                                            object:forJSONObject
                                            userInfo:callerInfo];
                        
                    NSLog(@"NetworkAPISingleClient(LinkedProfiles):TransferItem From Vault :completionHandler:Raised->%@",kDestinyTransferItemNotification);
                    
                }];
                [task resume];
            }
            //END SENT TO CHAR FROM VAULT SECOND
        }
         
        NSLog(@"Completed::TransferItemFromVault=%@",servicePath);
    
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
    
    
}

+ (AFJSONRequestOperation *)sendItemToVault:(NSObject *)anyInstancedItem
                                 vaultAction:(NSString *) anyAction
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = nil,
                *servicePath     = nil,
                *tokenValue      = nil,
                *payload         = nil;
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    NSData *postData = nil;
    
    @try {

        
        if (anyInstancedItem){
            payload = anyInstancedItem;
            payload = [payload stringByReplacingOccurrencesOfString:@"[" withString:@""];
            payload = [payload stringByReplacingOccurrencesOfString:@"]" withString:@""];
        }
        
        postData = [payload dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath =  [NSString stringWithFormat:@"%@/Actions/Items/TransferItem/",kBungieAPIBaseD2URL];
 
        NSLog(@"Invoking::TransferItem=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:servicePath];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        [request setHTTPMethod:@"POST"];
        
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:kDestinyOriginHeader forHTTPHeaderField:@"Origin"];
        [request setValue:@"www.bungie.net" forHTTPHeaderField:@"Authority" ];
        [request setValue:kBungieAPIKey forHTTPHeaderField:@"X-API-Key"];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [request setValue:tokenValue forHTTPHeaderField:@"Authorization"];
        }
    
        [request setHTTPBody:postData];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config
                                                              delegate:nil
                                                         delegateQueue:[NSOperationQueue mainQueue]];
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData * _Nullable data,
                                                                    NSURLResponse * _Nullable response,
                                                                    NSError * _Nullable error) {
                NSLog(@"NetworkAPISingleClient(LinkedProfiles):sendItemToVault:completionHandler...");

                NSHTTPURLResponse *asHTTPResponse = (NSHTTPURLResponse *) response;
            
                NSLog(@"The Response: %@", asHTTPResponse);
                // set a breakpoint on the last NSLog and investigate the response in the debugger

                // if you get data, you can inspect that, too. If it's JSON, do one of these:
                NSDictionary *forJSONObject = [NSJSONSerialization JSONObjectWithData:data
                                                                            options:kNilOptions
                                                                                error:nil];
                // or
                NSArray *forJSONArray = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:kNilOptions
                                                                          error:nil];

                NSLog(@"One of these might exist - object: %@ \n array: %@", forJSONObject, forJSONArray);
            
            
            NSDictionary *callerInfo = [[NSDictionary alloc]
                            initWithObjectsAndKeys:@"NetworkAPISingleClient",@"ClassName",
                                                    @"TransferItem",@"MethodName",
                                        anyAction, @"vaultAction",
                                        anyInstancedItem,@"InstancedItem",
                                        nil];
                
            [[NSNotificationCenter defaultCenter]
                    postNotificationName:kDestinySendToVaultNotification
                                    object:forJSONObject
                                    userInfo:callerInfo];
                
            NSLog(@"NetworkAPISingleClient(LinkedProfiles):TransferItem:completionHandler:Raised->%@",kDestinySendToVaultNotification);
            
             
                
        }];
       
        [task resume];
         
         
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
    
}

+ (AFJSONRequestOperation *)sendItemToVault:(NSObject *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = nil,
                *servicePath     = nil,
                *tokenValue      = nil,
                *payload         = nil;
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    NSData *postData = nil;
    
    @try {

        
        if (anyInstancedItem){
            payload = anyInstancedItem;
            payload = [payload stringByReplacingOccurrencesOfString:@"[" withString:@""];
            payload = [payload stringByReplacingOccurrencesOfString:@"]" withString:@""];
        }
        
        postData = [payload dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath =  [NSString stringWithFormat:@"%@/Actions/Items/TransferItem/",kBungieAPIBaseD2URL];
 
        NSLog(@"Invoking::TransferItem=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:servicePath];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        [request setHTTPMethod:@"POST"];
        
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:kDestinyOriginHeader forHTTPHeaderField:@"Origin"];
        [request setValue:@"www.bungie.net" forHTTPHeaderField:@"Authority" ];
        [request setValue:kBungieAPIKey forHTTPHeaderField:@"X-API-Key"];
        
        tokenValue = [NetworkAPISingleClient getAuthorizationTokenHeaderValue];
        
        if (tokenValue ){
            [request setValue:tokenValue forHTTPHeaderField:@"Authorization"];
        }
    
        [request setHTTPBody:postData];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config
                                                              delegate:nil
                                                         delegateQueue:[NSOperationQueue mainQueue]];
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData * _Nullable data,
                                                                    NSURLResponse * _Nullable response,
                                                                    NSError * _Nullable error) {
                NSLog(@"NetworkAPISingleClient(LinkedProfiles):sendItemToVault:completionHandler...");

                NSHTTPURLResponse *asHTTPResponse = (NSHTTPURLResponse *) response;
            
                NSLog(@"The Response: %@", asHTTPResponse);
                // set a breakpoint on the last NSLog and investigate the response in the debugger

                // if you get data, you can inspect that, too. If it's JSON, do one of these:
                NSDictionary *forJSONObject = [NSJSONSerialization JSONObjectWithData:data
                                                                            options:kNilOptions
                                                                                error:nil];
                // or
                NSArray *forJSONArray = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:kNilOptions
                                                                          error:nil];

                NSLog(@"One of these might exist - object: %@ \n array: %@", forJSONObject, forJSONArray);
            
            
            NSDictionary *callerInfo = [[NSDictionary alloc]
                            initWithObjectsAndKeys:@"NetworkAPISingleClient",@"ClassName",
                                                    @"TransferItem",@"MethodName", nil];
                
            [[NSNotificationCenter defaultCenter]
                    postNotificationName:kDestinySendToVaultNotification
                                    object:forJSONObject
                                    userInfo:callerInfo];
                
            NSLog(@"NetworkAPISingleClient(LinkedProfiles):TransferItem:completionHandler:Raised->%@",kDestinySendToVaultNotification);
            
             
                
        }];
       
        [task resume];
         
         
    }
    @catch (NSException *exception) {
        message = [exception description];
        NSLog(@"Error::%@",message);
    }
    @finally {
        message = @"";
        api = nil;
        servicePath = nil;
    }
    return request;
    
}


@end

