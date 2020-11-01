//
//  RefreshToken.m
//
//  Created by Engel Alipio on 4/27/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RefreshToken.h"


NSString *const kRefreshTokenValue = @"value";
NSString *const kRefreshTokenReadyin = @"readyin";
NSString *const kRefreshTokenExpires = @"expires";


@interface RefreshToken ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RefreshToken

@synthesize value = _value;
@synthesize readyin = _readyin;
@synthesize expires = _expires;


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
            self.value = [self objectOrNilForKey:kRefreshTokenValue fromDictionary:dict];
            self.readyin = [[self objectOrNilForKey:kRefreshTokenReadyin fromDictionary:dict] doubleValue];
            self.expires = [[self objectOrNilForKey:kRefreshTokenExpires fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.value forKey:kRefreshTokenValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.readyin] forKey:kRefreshTokenReadyin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expires] forKey:kRefreshTokenExpires];

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

    self.value = [aDecoder decodeObjectForKey:kRefreshTokenValue];
    self.readyin = [aDecoder decodeDoubleForKey:kRefreshTokenReadyin];
    self.expires = [aDecoder decodeDoubleForKey:kRefreshTokenExpires];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_value forKey:kRefreshTokenValue];
    [aCoder encodeDouble:_readyin forKey:kRefreshTokenReadyin];
    [aCoder encodeDouble:_expires forKey:kRefreshTokenExpires];
}

- (id)copyWithZone:(NSZone *)zone
{
    RefreshToken *copy = [[RefreshToken alloc] init];
    
    if (copy) {

        copy.value = [self.value copyWithZone:zone];
        copy.readyin = self.readyin;
        copy.expires = self.expires;
    }
    
    return copy;
}


@end
