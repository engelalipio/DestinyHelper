/*
 GroupV2

 Verb: Get

 Path: /GroupV2/Name/

 Search for Groups.
 
*/
#import "NetworkAPISingleClient.h"


@interface NetworkAPISingleClient (SearchGroup)

+ (AFJSONRequestOperation *) searchGroupByName: (NSString *)searchTerm
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)retrieveGroupMembers:(NSString *)groupId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

 


@end

