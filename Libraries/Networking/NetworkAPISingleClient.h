//
//  NetworkAPISingleClient.h
//  DropDownDigitalAirports
//
//  Created by Engel Alipio on 5/24/16.
//  Copyright © 2016 Digital World International. All rights reserved.
//

#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@interface NetworkAPISingleClient : AFHTTPClient

#pragma mark Class Methods

+ (NetworkAPISingleClient *)sharedClient;

+ (NSString *)getBaseUrl;

#pragma mark Member Methods

- (AFJSONRequestOperation *)makeJSONRequestWithPath:(NSString *)path
                                      requestMethod:(NSString *)requestMethod
                                         parameters:(id)params
                                            success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))successBlock
                                            failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failureBlock;


- (AFJSONRequestOperation *)makeGetOperationWithObjecModel:(Class)model
                                                    atPath:(NSString *)path
                                           completionBlock:(void (^) (NSArray *modelObject))successBlock
                                             andErrorBlock:(void (^) (NSError *error))errorBlock;

- (void)makePostOperationWithObject:(NSObject *)object
                             atPath:(NSString *)path
                    completionBlock:(void (^) (id result))successBlock
                      andErrorBlock:(void (^) (NSError *error))errorBlock;

- (AFJSONRequestOperation *)makePostOperationWithObject:(NSObject *)object
                                                 atPath:(NSString *)path
                                 insertedOrUpdatedModel:(Class)model
                                        completionBlock:(void (^) (id result))successBlock
                                          andErrorBlock:(void (^) (NSError *error))errorBlock;

- (AFJSONRequestOperation *)getOperationWithObjecModel:(Class)model
                                                atPath:(NSString *)path
                                       completionBlock:(void (^) (NSArray *modelObject))successBlock
                                         andErrorBlock:(void (^) (NSError *error))errorBlock;

- (void)resumeOperations;

#pragma mark Properties
@property (nonatomic, strong) NSMutableArray *suspendedOperations;

@end
