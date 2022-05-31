
#import "NetworkAPISingleClient+Clan.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "CLNDataModels.h"

 
@implementation NetworkAPISingleClient(SearchGroup)


#pragma mark-> /GroupV2/Name
+ (AFJSONRequestOperation *)searchGroupByName:(NSString *)searchTerm
                             completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *groupType       = @"1";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
  
    @try {
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath = [NSString stringWithFormat:@"GroupV2/Name/%@/%@", searchTerm,groupType];
 
        NSLog(@"Invoking::SearchGroupByAme=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseURL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        request = [api makeGetOperationWithObjecModel:[CLNBaseClass class]
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
#pragma mark-> /GroupV2/User/1/{membershipId}}/0/1/
+ (AFJSONRequestOperation *)retrieveGroupsByMember:(NSString *)membershipId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *code            = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    //https://www.bungie.net/Platform/GroupV2/User/1/4611686018450941209/0/1/
    
    @try {
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath = [NSString stringWithFormat:@"GroupV2/User/1/%@/0/1/", membershipId];
 
        NSLog(@"Invoking::retrieveGroupsByMember=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseURL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        request = [api makeGetOperationWithObjecModel:[CLNMBaseClass class]
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

#pragma mark-> /GroupV2/{groupid}}/Members
+ (AFJSONRequestOperation *)retrieveGroupMembers:(NSString *)groupId
                             completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *code            = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    //https://www.bungie.net/Platform/GroupV2/1741503/Members/
    
    @try {
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath = [NSString stringWithFormat:@"GroupV2/%@/Members/", groupId];
 
        NSLog(@"Invoking::GetMembershipsById=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseURL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        request = [api makeGetOperationWithObjecModel:[CLNMBaseClass class]
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

