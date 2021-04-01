//
//  ClanInfo.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "ClanInfo.h"
#import "ClanBannerData.h"
#import "D2ClanProgressions.h"


NSString *const kClanInfoClanBannerData = @"clanBannerData";
NSString *const kClanInfoClanCallsign = @"clanCallsign";
NSString *const kClanInfoD2ClanProgressions = @"d2ClanProgressions";


@interface ClanInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ClanInfo

@synthesize clanBannerData = _clanBannerData;
@synthesize clanCallsign = _clanCallsign;
@synthesize d2ClanProgressions = _d2ClanProgressions;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kClanInfoClanCallsign,@"clanCallsign",
                         nil];
    
    return map;
}

+ (NSString *)key{
    return nil;
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.clanBannerData = [ClanBannerData modelObjectWithDictionary:[dict objectForKey:kClanInfoClanBannerData]];
            self.clanCallsign = [self objectOrNilForKey:kClanInfoClanCallsign fromDictionary:dict];
            self.d2ClanProgressions = [D2ClanProgressions modelObjectWithDictionary:[dict objectForKey:kClanInfoD2ClanProgressions]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.clanBannerData dictionaryRepresentation] forKey:kClanInfoClanBannerData];
    [mutableDict setValue:self.clanCallsign forKey:kClanInfoClanCallsign];
    [mutableDict setValue:[self.d2ClanProgressions dictionaryRepresentation] forKey:kClanInfoD2ClanProgressions];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.clanBannerData = [aDecoder decodeObjectForKey:kClanInfoClanBannerData];
    self.clanCallsign = [aDecoder decodeObjectForKey:kClanInfoClanCallsign];
    self.d2ClanProgressions = [aDecoder decodeObjectForKey:kClanInfoD2ClanProgressions];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_clanBannerData forKey:kClanInfoClanBannerData];
    [aCoder encodeObject:_clanCallsign forKey:kClanInfoClanCallsign];
    [aCoder encodeObject:_d2ClanProgressions forKey:kClanInfoD2ClanProgressions];
}

- (id)copyWithZone:(NSZone *)zone
{
    ClanInfo *copy = [[ClanInfo alloc] init];
    
    if (copy) {

        copy.clanBannerData = [self.clanBannerData copyWithZone:zone];
        copy.clanCallsign = [self.clanCallsign copyWithZone:zone];
        copy.d2ClanProgressions = [self.d2ClanProgressions copyWithZone:zone];
    }
    
    return copy;
}


@end
