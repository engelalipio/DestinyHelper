/*
 Verb: GET

 Path: /MembershipType/Profile/MembershipId?components?
 //https://www.bungie.net/Platform/Destiny2/1/Profile/4611686018450941209?components=100
=
*/
#import "NetworkAPISingleClient.h"


@interface NetworkAPISingleClient (LinkedProfiles)

+ (AFJSONRequestOperation *)getCharacters:(NSString *)anyComponents
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)getCharacter:(NSString *)anyCharId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

 


@end

