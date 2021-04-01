/*
 Verb: GET



 https://www.bungie.net/common/destiny2_content/json/en/DestinyClassDefinition-8be3755a-c24b-4892-a75a-0ecd92a19a05.json
 
*/
#import "NetworkAPISingleClient.h"


@interface NetworkAPISingleClient (Definition)

+ (AFJSONRequestOperation *)retrieveClassDefinition:(NSString *)anyLocale
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;
 
+ (AFJSONRequestOperation *)retrieveGenderDefinition:(NSString *)anyLocale
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)retrieveRaceDefinition:(NSString *)anyLocale
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)retrieveProgressionDefinition:(NSString *)anyLocale
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)retrieveActivityDefinition:(NSString *)anyLocale
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)retrieveAchievementDefinition:(NSString *)anyLocale
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *) retrieveStaticEntityDefinitionByManifestType:(NSString *)anyManifest
                         staticHashId:(NSString *) anyHashId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;


@end

