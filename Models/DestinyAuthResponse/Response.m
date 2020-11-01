//
//  Response.m
//
//  Created by Engel Alipio on 4/27/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Response.h"
#import "RefreshToken.h"
#import "AccessToken.h"


NSString *const kResponseMembershipId = @"membershipId";
NSString *const kResponseScope = @"scope";
NSString *const kResponseRefreshToken = @"refreshToken";
NSString *const kResponseAccessToken = @"accessToken";


@interface Response ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Response

@synthesize membershipId = _membershipId;
@synthesize scope = _scope;
@synthesize refreshToken = _refreshToken;
@synthesize accessToken = _accessToken;


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
            self.membershipId = [self objectOrNilForKey:kResponseMembershipId fromDictionary:dict];
            self.scope = [[self objectOrNilForKey:kResponseScope fromDictionary:dict] doubleValue];
            self.refreshToken = [RefreshToken modelObjectWithDictionary:[dict objectForKey:kResponseRefreshToken]];
            self.accessToken = [AccessToken modelObjectWithDictionary:[dict objectForKey:kResponseAccessToken]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.membershipId forKey:kResponseMembershipId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.scope] forKey:kResponseScope];
    [mutableDict setValue:[self.refreshToken dictionaryRepresentation] forKey:kResponseRefreshToken];
    [mutableDict setValue:[self.accessToken dictionaryRepresentation] forKey:kResponseAccessToken];

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

    self.membershipId = [aDecoder decodeObjectForKey:kResponseMembershipId];
    self.scope = [aDecoder decodeDoubleForKey:kResponseScope];
    self.refreshToken = [aDecoder decodeObjectForKey:kResponseRefreshToken];
    self.accessToken = [aDecoder decodeObjectForKey:kResponseAccessToken];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_membershipId forKey:kResponseMembershipId];
    [aCoder encodeDouble:_scope forKey:kResponseScope];
    [aCoder encodeObject:_refreshToken forKey:kResponseRefreshToken];
    [aCoder encodeObject:_accessToken forKey:kResponseAccessToken];
}

- (id)copyWithZone:(NSZone *)zone
{
    Response *copy = [[Response alloc] init];
    
    if (copy) {

        copy.membershipId = [self.membershipId copyWithZone:zone];
        copy.scope = self.scope;
        copy.refreshToken = [self.refreshToken copyWithZone:zone];
        copy.accessToken = [self.accessToken copyWithZone:zone];
    }
    
    return copy;
}


@end
