//
//  NetworkAPISingleClient.m
//  DropDownDigitalAirports
//
//  Created by Engel Alipio on 5/24/16.
//  Copyright © 2016 Digital World International. All rights reserved.
//

#import "NetworkAPISingleClient.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "AbstractModel.h"
#import "DataModels.h"

 
@implementation NetworkAPISingleClient
@synthesize suspendedOperations = _suspendedOperations;

+ (NetworkAPISingleClient *)sharedClient
{
    static NetworkAPISingleClient *_sharedClient = nil;
    static dispatch_once_t		onceToken;
    
    dispatch_once(&onceToken, ^{
        NSString *stringBaseURL = [NSString stringWithFormat:@"%@", kBungieAPIBaseURL];
        NSLog(@"Singleton getting FlightStats Base URL %@",stringBaseURL);
        _sharedClient = [[NetworkAPISingleClient alloc] initWithBaseURL:[NSURL URLWithString:stringBaseURL]];
    });
    
    return _sharedClient;
}

+ (NSString *)getBaseUrl{
    static NSString* baseURL = kBungieAPIBaseURL;
    return baseURL;
}

#pragma mark -Init

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setDefaultHeader:@"Content-type" value:@"application/json"];
    [self setDefaultHeader:@"X-API-Key" value:kBungieAPIKey];
    [self setParameterEncoding:AFJSONParameterEncoding];
    
    return self;
}

#pragma mark - Request methods

/*
 *   Make GET operations to the path especified and parser transform the JSON to the recived "Class" object model
 *   @params
 *   model: class of the model object to use to generate the mapping
 *   path: path to generate the request URL
 *   successBlock: block to execute on success
 *   errorBlock: block to execute on fail
 */

- (AFJSONRequestOperation *)getOperationWithObjecModel:(Class)model
                                                atPath:(NSString *)path
                                       completionBlock:(void (^) (NSArray *modelObject))successBlock
                                         andErrorBlock:(void (^)(NSError *error))errorBlock
{
    
    AFJSONRequestOperation *operation = [self JSONRequestWithPath:path
                                                    requestMethod:@"GET"
                                                       parameters:nil
                                                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                              //  [[amsAppDelegate currentDelegate] resetTimer];
                                                              if (successBlock) {
                                                                  if ([model key] != nil) {
                                                                      NSArray *array = [model objectFromJSONObject:[JSON objectForKey:[model key]]
                                                                                                           mapping:[model mapping]];
                                                                      
                                                                      successBlock(array);
                                                                  } else {
                                                                      NSMutableArray *array = [NSMutableArray new];
                                                                      [array addObject:[model objectFromJSONObject:JSON
                                                                                                           mapping:[model mapping]]];
                                                                      successBlock(array);
                                                                  }
                                                              }
                                                          } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                              if (errorBlock) {
                                                                  errorBlock(error);
                                                              }
                                                          }];
    
    __weak NetworkAPISingleClient *me = self;
    
    /*[operation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection *connection, NSURLAuthenticationChallenge *challenge) {
     [me validateCertificateWithChallege:challenge];
     }];*/
    
    return operation;
}

- (AFJSONRequestOperation *)makeGetOperationWithObjecModel:(Class)model atPath:(NSString *)path completionBlock:(void (^) (NSArray *modelObject))successBlock andErrorBlock:(void (^)(NSError *error))errorBlock
{
    AFJSONRequestOperation *operation = [self makeJSONRequestWithPath:path
                                                        requestMethod:@"GET"
                                                           parameters:nil
                                                              success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
                                         {
                                             // [[amsAppDelegate currentDelegate] resetTimer];
                                             if (successBlock) {
                                                 if ([model key] != nil) {
                                                     NSArray *array = [model objectFromJSONObject:[JSON objectForKey:[model key]] mapping:[model mapping]];
                                                     successBlock(array);
                                                 } else {
                                                     NSMutableArray *array = [NSMutableArray new];
                                                     [array addObject:[model objectFromJSONObject:JSON mapping:[model mapping]]];
                                                     successBlock(array);
                                                 }
                                             }
                                         } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                             if (errorBlock) {
                                                 errorBlock(error);
                                             }
                                         }];
    
    __weak NetworkAPISingleClient *me = self;
    
    /*[operation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection *connection, NSURLAuthenticationChallenge *challenge) {
     [me validateCertificateWithChallege:challenge];
     }];*/
    
    return operation;
}

- (void)makePostOperationWithObject:(NSObject *)object atPath:(NSString *)path completionBlock:(void (^) (id result))successBlock andErrorBlock:(void (^)(NSError *error))errorBlock
{
    NSMutableDictionary *parameters = nil;
    
    
    if ([object isKindOfClass:[NSMutableDictionary class]]){
        parameters = (NSMutableDictionary *) object;
    }else{
        parameters =  [self convertModelToDictionary:object];
    }
    
   
    
    [self postPath:path
        parameters:parameters
          success :^(AFHTTPRequestOperation *operation, id responseObject)
     {
         //[[amsAppDelegate currentDelegate] resetTimer];
         if (successBlock) {
             successBlock(responseObject);
         }
     }
     
          failure :^(AFHTTPRequestOperation *operation, NSError *error)
     {
         if ([self hasChallengeInPostRequest:operation.request error:error]) {
             // stop queue to avoid more challenges
             [self.operationQueue setSuspended:YES];
         }
         
         if (errorBlock) {
             errorBlock(error);
         }
     }];
}

- (AFJSONRequestOperation *)makePostOperationWithObject:(NSObject *)object atPath:(NSString *)path insertedOrUpdatedModel:(Class)model completionBlock:(void (^) (id result))successBlock andErrorBlock:(void (^)(NSError *error))errorBlock
{
    NSMutableDictionary *parameters = [self convertModelToDictionary:object];
    
    /*AFJSONRequestOperation *operation = [self makeJSONRequestWithPath:path
     requestMethod:@"POST"
     parameters:parameters
     success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
     {
     // [[amsAppDelegate currentDelegate] resetTimer];
     if (successBlock) {
     NSMutableArray *array = [NSMutableArray new];
     [array addObject:[CBPostRespose objectFromJSONObject:JSON mapping:[CBPostRespose mapping]]];
     
     if ((array != nil) && (array.count != 0)) {
     CBPostRespose *resp = array[0];
     
     if (resp.data != nil) {
     resp.data = [CBPostDataResponse objectFromJSONObject:(id)resp.data
     mapping:[CBPostDataResponse mapping]];
     
     if ((resp.data.insertedOrUpdatedObject != nil) && (model != nil)) {
     resp.data.insertedOrUpdatedObject = [model objectFromJSONObject:resp.data.insertedOrUpdatedObject mapping:[model mapping]];
     }
     }
     }
     
     successBlock(array);
     }
     } failure	:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
     if (errorBlock) {
     errorBlock(error);
     }
     }];
     
     __weak MFNetworkAPISingleClient *me = self;*/
    
    /*[operation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection *connection, NSURLAuthenticationChallenge *challenge) {
     [me validateCertificateWithChallege:challenge];
     }];*/
    
    return nil;// operation;
}

- (NSMutableDictionary *)convertModelToDictionary:(id)object
{
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    
    NSArray		*mapKeys = [[[object class] mapping] allKeys];
    NSString	*strcheck;
    
    for (NSString *key in mapKeys) {
        NSObject *obj = [object valueForKey:[[[object class] mapping] objectForKey:key]];
        
        if (obj != nil) {
            strcheck = [NSString stringWithFormat:@"%@", obj];
            
            if ((strcheck != nil) && (strcheck.length != 0)) {
                [parameters setObject:obj forKey:key];
                NSLog(@"\"%@\" : \"%@\" ,\n", key, obj);
            }
        }
    }
    
    return parameters;
}

#pragma mark Private

- (AFJSONRequestOperation *)JSONRequestWithPath:(NSString *)path requestMethod:(NSString *)requestMethod parameters:(id)params success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))successBlock failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failureBlock
{
    NSMutableURLRequest *request = [self requestWithMethod:requestMethod path:path parameters:params];
    
    __weak NetworkAPISingleClient *me	= self;
    __block AFJSONRequestOperation	*operation	= [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                                success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                                    NSLog(@"Base request header: %@ \n\n\nRequest Successful: \n\n\nrequest = %@ \n\n\nresponse = %@ \n\n\nresponseString = %@", [me description], [request description], [[operation request] allHTTPHeaderFields], [operation responseString]);
                                                                                                    
                                                                                    
                                                                                    
                                                                                                    // [[amsAppDelegate currentDelegate] resetTimer];
                                                                                                    
                                                                                                    if (successBlock) {
                                                                                                        successBlock(request, response, JSON);
                                                                                                    }
                                                                                                } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                                    NSLog(@"Base request header: %@ \n\n\nRequest failure: \nrequest = %@ \nresponse = %@ \nerror = %@ \nJSON = %@", [self description], request, response, error, JSON);
                                                                                                    
                                                                                                    /* If it is not a time out issues */
                                                                                                    if (error.domain != NSURLErrorDomain && error.code != -1001) {
                                                                                                        
                                                                                                        if ([self hasChallengeInJSONRequest:request response:response]) {
                                                                                                            // stop queue and store request for later
                                                                                                            [self.operationQueue setSuspended:YES];
                                                                                                            AFJSONRequestOperation *suspendedOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                                                successBlock(request, response, JSON);
                                                                                                            } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                                                failureBlock(request, response, error, JSON);
                                                                                                            }];
                                                                                                            [self.suspendedOperations addObject:suspendedOperation];
                                                                                                        }
                                                                                                    }
                                                                                                    
                                                                                                    
                                                                                                    if (failureBlock) {
                                                                                                        if (![self validteIfLogginPage:error]) {
                                                                                                            failureBlock(request, response, error, JSON);
                                                                                                        }
                                                                                                    }
                                                                                                }];
    
    /*[operation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection *connection, NSURLAuthenticationChallenge *challenge) {
     [me validateCertificateWithChallege:challenge];
     }];*/
    
    return operation;
}

- (AFJSONRequestOperation *)makeJSONRequestWithPath:(NSString *)path requestMethod:(NSString *)requestMethod parameters:(id)params success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))successBlock failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failureBlock
{
    AFJSONRequestOperation *operation = [self JSONRequestWithPath:path requestMethod:requestMethod parameters:params success:successBlock failure:failureBlock];
    
    __weak NetworkAPISingleClient *me = self;
    
    /*[operation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection *connection, NSURLAuthenticationChallenge *challenge) {
     [me validateCertificateWithChallege:challenge];
     }];*/
    
    [self enqueueHTTPRequestOperation:operation];
    return operation;
}

#pragma mark SSOChallenge

- (BOOL)hasChallengeInJSONRequest:(NSURLRequest *)request response:(NSHTTPURLResponse *)response
{
    BOOL	hasChallenge	= NO;
    NSURL	*url			= request.URL;
    NSRange rangeInUrl		= [[url description] rangeOfString:@"siteminderagent"];
    NSURL	*responseURL	= [response URL];
    NSRange rangeInContent	= [[responseURL description] rangeOfString:@"siteminderagent"];
    
    BOOL rangeUrlBool = FALSE;
    BOOL rangeResponseBool = FALSE;
    
    if (request != nil) {
        rangeUrlBool = (rangeInUrl.location != NSNotFound);
    }
    
    if (response != nil) {
        rangeResponseBool = (rangeInContent.location != NSNotFound);
    }
    
    if (rangeUrlBool || rangeResponseBool) {
        hasChallenge = YES;
        [self resolveChallenge];
    }
    
    return hasChallenge;
}

- (BOOL)hasChallengeInPostRequest:(NSURLRequest *)request error:(NSError *)error
{
    BOOL	hasChallenge	= NO;
    NSURL	*url			= request.URL;
    NSRange rangeInUrl		= [[url description] rangeOfString:@"siteminderagent"];
    NSRange rangeInError	= [[error description] rangeOfString:@"siteminderagent"];
    
    /* If timeout, there is not challenge to validate */
    if (error.domain == NSURLErrorDomain && error.code == -1001) {
        return NO;
    }
    
    if ((rangeInUrl.location != NSNotFound) || (rangeInError.location != NSNotFound)) {
        hasChallenge = YES;
        [self resolveChallenge];
    }
    
    return hasChallenge;
}


- (void)resolveChallenge
{
    AppDelegate *appDelegate = [AppDelegate currentDelegate];
    
    //[appDelegate showMDFLoginWithAnimation:YES];
    
    if (!self.suspendedOperations) {
        self.suspendedOperations = [[NSMutableArray alloc] init];
    }
    
    NSLog(@"triggered SSO Challenge");
}

- (void)resumeOperations
{
    [self.operationQueue setSuspended:NO];
    [self.operationQueue addOperations:self.suspendedOperations waitUntilFinished:NO];
    [self.suspendedOperations removeAllObjects];
}

#pragma mark - Check Login Page

-(BOOL)validteIfLogginPage:(NSError*)afNetworkingError
{
    if (!afNetworkingError ) {
        return FALSE;
    }
    
    if (afNetworkingError.domain != AFNetworkingErrorDomain) {
        return FALSE;
    }
    
    if (afNetworkingError.code != -1016) {
        return FALSE;
    }
    
    NSString *response = [[afNetworkingError userInfo] objectForKey:@"NSLocalizedRecoverySuggestion"];
    
    if ([response rangeOfString:@"<title>SSO Login Page</title>"].location != NSNotFound ) {
        return TRUE;
    }
    
    return FALSE;
}

#pragma mark - Utils for MDFCertPinning library

- (void)validateCertificateWithChallege:(NSURLAuthenticationChallenge *)challenge
{
    /*
     *   NSDictionary	*pListDict	= [[[NSDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:PROPERTY_LIST_CONFIG ofType:@"plist"]] autorelease];
     *   NSString		*urlString	= [pListDict objectForKey:@"MDFServicePushDeviceRegister"];
     */
    
    /*NSError *certError = [MDFCertPinning getResultOfCertificatePinning:challenge URL:self.baseURL];
     
     id <NSURLAuthenticationChallengeSender> sender				= challenge.sender;
     NSURLProtectionSpace					*protectionSpace	= challenge.protectionSpace;
     SecTrustRef								serverTrustContext	= protectionSpace.serverTrust;
     
     if (certError == nil) {
     NSURLCredential *credential = [NSURLCredential credentialForTrust:serverTrustContext];
     [sender useCredential:credential forAuthenticationChallenge:challenge];
     } else {
     [sender cancelAuthenticationChallenge:challenge];
     
     NSString	*title;
     NSString	*message;
     
     NSError *originalError = [certError.userInfo objectForKey:@"kOriginalError"];
     switch ([originalError code]) {
     case kErrorCodeNetworkDown:
     case kErrorCodeNetworkUnreachable:
     case kErrorCodeTimeout:
     case kErrorCodeUnknown:
     //				title	= @"CONNECTION ERROR";
     //				message = @"There was a connection error or the connection is not available";
     title = @"MDFCertPinning ERROR";
     message = [NSString stringWithFormat:@"%@", certError];
     break;
     
     default:
     title	= @"VALIDATION ERROR";
     message = @"This application needs to be removed and reinstalled from the JPMC App Store.  Contact MDF Support with any questions";
     break;
     }
     
     dispatch_async(dispatch_get_main_queue(), ^{
     [[[UIAlertView alloc]initWithTitle:title
     message				:message
     delegate			:nil
     cancelButtonTitle	:@"cancel"
     otherButtonTitles	:nil]show];
     });
     }
     */
}

@end
