/*
 Verb: GET

 Path: /User/SearchUsers/

     Returns a list of possible users based on the search string

     Querystring Parameters
     q
     The search string.
     Type: string
     Response
     Look at the Response property for more information about the nature of this response
     Content Type: application/json
     Type: object
     Object Properties

     Response
     Type: array
     Array Contents: User.GeneralUser
     ErrorCode
     Type: int32
     ThrottleSeconds
     Type: int32
     ErrorStatus
     Type: string
     Message
     Type: string
     MessageData
     Type: object
     Dictionary Contents: string
     Dictionary Key Type: string
     DetailedErrorTrace
     Type: string
*/
#import "NetworkAPISingleClient.h"


@interface NetworkAPISingleClient (SearchUser)

+ (AFJSONRequestOperation *)searchUser:(NSString *)searchTerm
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)retrieveMembershipData:(NSString *)membershipTypeAndId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

 


@end

