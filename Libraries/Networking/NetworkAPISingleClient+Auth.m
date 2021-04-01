
#import "NetworkAPISingleClient+Auth.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "DataModels.h"

 
@implementation NetworkAPISingleClient(Auth)


#pragma mark-> https://www.bungie.net/en/oauth/authorize
+ (AFJSONRequestOperation *)authorize:(NSString *)anyLocale
                             completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *client_id       = @"",
                *client_locale   = @"en";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    @try {

        //{locale}/oauth/authorize?client_id={client_id}&response_type=code/
        
        if (anyLocale){
            client_locale = anyLocale;
        }
        
        client_id = kBungieClientID;
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath =  [NSString stringWithFormat:@"%@%@",kBungieBaseURL,kDestinyOAuthAuthorize];
        
        
        servicePath = [servicePath stringByReplacingOccurrencesOfString:@"{locale}" withString:anyLocale];
        
        servicePath = [servicePath stringByReplacingOccurrencesOfString:@"{client_id}" withString:client_id];
        
        NSLog(@"Invoking::authorize::%@",servicePath);
        
        url = [[NSURL alloc] initWithString:@"https://www.bungie.net/en/oauth/authorize"];
        
        api =  [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        request =  [api  makeGetOperationWithObjecModel:[BaseClass class]
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

/*

 Access Token Request

 The client makes a request to the token endpoint by sending the following parameters
 using the “application/x-www-form-urlencoded” format in the body of a POST request.

 grant_type: Value must be set to “authorization_code”. code: Authorization code received from the authorization endpoint. client_id: Public clients must provide this parameter. It is optional for confidential clients if they are providing credentials using the Authorization header. client_secret: Confidential clients may provide this parameter if they are not using the Authorization header. Public clients must not provide the client_secret parameter.

 The redirect_uri parameter is optional. If it is present, it must be a case sensitive exact match with the value registered in the portal.

 The following is a request by a confidential client using the Authorization header.
 */

#pragma mark-> https://www.bungie.net/platform/app/oauth/token/
+ (AFJSONRequestOperation *)retrieveToken:(NSString *)authCode
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message          = @"",
                *servicePath      = @"",
                *client_id        = @"";
    
    NSURL        *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    NSMutableDictionary *params = nil;
 
    @try {
        
        client_id = kBungieClientID;
        
       
        params = [[NSMutableDictionary alloc] init];
        
       // [params setValue:@"application/x-www-form-urlencoded" forKey:@"Content-Type"];
        [params setValue:@"authorization_code" forKey:@"grant_type"];
        [params setValue:authCode forKey:@"code"];
        [params setValue:client_id forKey:@"client_id"];

        
        
        servicePath =  [NSString stringWithFormat:@"%@%@",kBungieAPIBaseURL,kDestinyOAuthRefreshToken];
        
        NSLog(@"Invoking::retrieveToken::%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieBaseURL];
        
        api =  [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
    
        [api setDefaultHeader:@"Content-Type" value:@"application/json;charset=UTF-8;"];
        [api setParameterEncoding:AFFormURLParameterEncoding];
       
        [api setDefaultHeader:@"Origin" value:kDestinyOriginHeader];
        [api setDefaultHeader:@"Accept" value:@"application/json"];
       
        [api setDefaultHeader:@"Access-Control-Allow-Origin" value:kBungieBaseURL];
        [api setDefaultHeader:@"Access-Control-Allow-Methods" value:@"POST, GET, PUT, UPDATE, DELETE, OPTIONS"];
        [api setDefaultHeader:@"Access-Control-Allow-Headers" value:@"Authorization, Origin, Content-Type, Accept, X-requested-With"];
        [api setDefaultHeader:@"Access-Control-Allow-Credentials" value:@"true"];
        
        
        [api makePostOperationWithObject:params
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
#pragma -> /Platform/Destiny2/Manifest
+ (AFJSONRequestOperation *)retrieveManifest:(NSString *)maxCount
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message          = @"",
                *servicePath      = @"";
    
    NSURL        *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
 
    
    @try {
         
        servicePath =  [NSString stringWithFormat:@"%@/Manifest", kBungieAPIBaseD2URL];
        
        
        NSLog(@"Invoking::RetrieveManifest::%@",servicePath);
        
        url = [[NSURL alloc] initWithString:servicePath];
        
        api =  [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        request =  [api  makeGetOperationWithObjecModel:[BaseClass class]
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


@end

