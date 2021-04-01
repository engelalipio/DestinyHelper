
#import "NetworkAPISingleClient+Definition.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "DataModels.h"

 

@implementation NetworkAPISingleClient(Definition)

//Path: /Destiny2/Manifest/{entityType}/{hashIdentifier}/
+ (AFJSONRequestOperation *) retrieveStaticEntityDefinitionByManifestType:(NSString *)anyManifest
                         staticHashId:(NSString *) anyHashId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
 
    @try {

        appDelegate = [AppDelegate currentDelegate];
        
    
        servicePath = [NSString stringWithFormat:@"%@/Manifest/%@/%@/",kBungieAPIBaseD2URL,anyManifest,anyHashId];
        
        NSLog(@"NetworkAPISingleClient(LinkedProfiles):getInstancedItem->%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieAPIBaseD2URL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
        
        request = [api makeGetOperationWithObjecModel:[INVDDestinyInventoryBaseClass class]
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


#pragma mark-> common/destiny2_content/json/en/DestinyClassDefinition-8be3755a-c24b-4892-a75a-0ecd92a19a05.json
+ (AFJSONRequestOperation *)retrieveClassDefinition:(NSString *)anyLocale
                             completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    
    NSString    *message         = @"",
                *servicePath     = @"",
                *code            = @"";
    
    NSURL       *url  = nil;
    
    AFJSONRequestOperation *request = nil;
    
    NetworkAPISingleClient *api = nil;
    
    AppDelegate *appDelegate = nil;
    
    //https://www.bungie.net/common/destiny2_content/json/en/DestinyClassDefinition-8be3755a-c24b-4892-a75a-0ecd92a19a05.json
    
    
    @try {
        
        appDelegate = [AppDelegate currentDelegate];
        
        servicePath = [NSString stringWithFormat:@"%@", anyLocale];
 
        NSLog(@"Invoking::retrieveClassDefinition=%@",servicePath);
        
        url = [[NSURL alloc] initWithString:kBungieBaseURL];
        
        api = [[NetworkAPISingleClient sharedClient] initWithBaseURL:url];
        
       
        request = [api makeGetOperationWithObjecModel:[DCDBaseClass class]
                                               atPath:servicePath
                                      completionBlock:completionBlock
                                        andErrorBlock:errorBlock];
        
       
        message = servicePath;
        
        NSLog(@"Completed Invoking::%@%@",url,message);
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

+ (AFJSONRequestOperation *)retrieveGenderDefinition:(NSString *)anyLocale
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    return nil;
}

+ (AFJSONRequestOperation *)retrieveRaceDefinition:(NSString *)anyLocale
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    return nil;
}
+ (AFJSONRequestOperation *)retrieveProgressionDefinition:(NSString *)anyLocale
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    return nil;
}
+ (AFJSONRequestOperation *)retrieveActivityDefinition:(NSString *)anyLocale
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    return nil;
}

+ (AFJSONRequestOperation *)retrieveAchievementDefinition:(NSString *)anyLocale
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock{
    return nil;
}

 




@end

