
#import "NetworkAPISingleClient+SearchUser.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "DataModels.h"

//https://www.bungie.net/Platform/Destiny2/2/Profile/11429775/LinkedProfiles/

@implementation NetworkAPISingleClient(SearchUser)


#pragma mark-> /User/SearchUsers/
+ (AFJSONRequestOperation *)searchUser:(NSString *)searchTerm
                             completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *code            = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    //https://www.bungie.net/Platform/User/SearchUsers?q=BrazucaShredog
    
    
    @try {
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath = [NSString stringWithFormat:@"User/SearchUsers?q=%@", searchTerm];
 
        NSLog(@"Invoking::SearchUsers=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseURL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        request = [api makeGetOperationWithObjecModel:[SRCBaseClass class]
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

#pragma mark-> /User/GetMembershipsById/{membershipId}/{membershipType}/
+ (AFJSONRequestOperation *)retrieveMembershipData:(NSString *)membershipTypeAndId
                             completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *code            = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    //https://www.bungie.net/Platform/User/GetMembershipsById/11429775/1/
    
    
    @try {
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath = [NSString stringWithFormat:@"User/GetMembershipsById/%@", membershipTypeAndId];
 
        NSLog(@"Invoking::GetMembershipsById=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseURL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        request = [api makeGetOperationWithObjecModel:[MBRBaseClass class]
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

