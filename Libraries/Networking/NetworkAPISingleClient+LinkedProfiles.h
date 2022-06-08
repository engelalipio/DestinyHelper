/*
 Verb: GET

 Path: /MembershipType/Profile/MembershipId?components?
 //https://www.bungie.net/Platform/Destiny2/1/Profile/4611686018450941209?components=100
=
*/
#import "NetworkAPISingleClient.h"

enum Destiny2ComponentType{
    NONE = 0,
    PROFILES = 100,
    VENDORRECEIPTS = 101,
    PROFILEINVENTORIES = 102,
    PROFILECURRENCIES = 103,
    PROFILEPROGRESSION = 104,
    PLATFORMSILVER = 105,
    CHARACTERS = 200,
    CHARACTERINVENTORIES = 201,
    CHARACTERPROGRESSIONS = 202,
    CHARACTERRENDERDATA = 203,
    CHARACTERACTIVITIES = 204,
    CHARACTEREQUIPMENT = 205,
    ITEMINSTANCES = 300,
    ITEMOBJECTIVES = 301,
    ITEMPERKS = 302,
    ITEMRENDERDATA = 303,
    ITEMSTATS = 304,
    ITEMSOCKETS = 305,
    ITEMTALENTGRIDS = 306,
    ITEMCOMMONDATA = 307,
    ITEMPLUGSTATES = 308,
    ITEMPLUGOBJECTIVES = 309,
    ITEMREUSABLEPLUGS = 310,
    VENDORS = 400,
    VENDORCATEGORIES = 401,
    VENDORSALES = 402,
    KIOSKS = 500,
    CURRENCYLOOKUPS = 600,
    PRESENTATIONNODES = 700,
    COLLECTIBLES = 800,
    RECORDS = 900,
    TRANSITORY = 1000
};


@interface NetworkAPISingleClient (LinkedProfiles)

+ (AFJSONRequestOperation *)getCharacters:(NSString *)anyComponents
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)getCharacterSummary:(NSString *)anyCharId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)getCharacterInventoryItems:(NSString *)anyCharId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)getCharacterEquipedItems:(NSString *)anyCharId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;


+ (AFJSONRequestOperation *)getCharacterUniqueWeaponsStats:(NSString *)anyCharId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)getVaultItems:(NSString *)anyComponents
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;


+ (AFJSONRequestOperation *)getVendors:(NSString *)anyComponents
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;


+ (AFJSONRequestOperation *)getPublicVendors:(NSString *)anyComponents
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;


+ (AFJSONRequestOperation *)getVendor:(NSString *)anyVendorId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)getInstancedItem:(NSString *)anyInstancedId
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)pullFromPostMaster:(NSObject *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)sendItemToVault:(NSObject *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)pullItemFromVault:(NSObject *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)transferItem:(NSObject *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)equipItem:(NSObject *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;

+ (AFJSONRequestOperation *)lockStateItem:(NSObject *)anyInstancedItem
                         completionBlock:(void(^) (NSArray * values))
completionBlock andErrorBlock:(void(^) (NSError *))errorBlock;




@end

