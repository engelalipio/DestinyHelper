/*
Authorization endpoint: https://www.bungie.net/en/oauth/authorize
Token Endpoint: https://www.bungie.net/platform/app/oauth/token/
Redirection endpoint: Developer provides this value in the application portal.
 */

/*
Authorization Request

The client constructs the request URI by adding the following parameters to the query component of the authorization endpoint.

response_type: Must be “code”
client_id: Provided by the portal
state:
    An opaque value used by the client to maintain state between the request and the callback. The parameter should be used for preventing cross-site request forgery as described in section 10.12 of the OAuth 2.0 specification.
The redirect_uri parameter is optional. If it is present, it must be a case sensitive exact match with the value registered in the portal.

Do not include the scope parameter. Bungie.net does not define a syntax for this parameter and will reject requests that specify a scope.

GET https://www.bungie.net/en/oauth/authorize?client_id=12345&response_type=code&state=6i0mkLx79Hp91nzWVeHrzHG4
*/
#import "NetworkAPISingleClient.h"


@interface NetworkAPISingleClient (Auth)

+ (AFJSONRequestOperation *)authorize:(NSString *)maxCount
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)retrieveToken:(NSString *)maxCount
                          completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)retrieveManifest:(NSString *)maxCount
                          completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

@end

