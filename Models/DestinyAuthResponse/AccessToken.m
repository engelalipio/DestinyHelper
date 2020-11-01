//
//  AccessToken.m
//
//  Created by Engel Alipio on 4/27/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AccessToken.h"


NSString *const kAccessTokenValue = @"value";
NSString *const kAccessTokenReadyin = @"readyin";
NSString *const kAccessTokenExpires = @"expires";


@interface AccessToken ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AccessToken

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
            self.value = [self objectOrNilForKey:kAccessTokenValue fromDictionary:dict];
            self.readyin = [[self objectOrNilForKey:kAccessTokenReadyin fromDictionary:dict] doubleValue];
            self.expires = [[self objectOrNilForKey:kAccessTokenExpires fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.value forKey:kAccessTokenValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.readyin] forKey:kAccessTokenReadyin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expires] forKey:kAccessTokenExpires];

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

    self.value = [aDecoder decodeObjectForKey:kAccessTokenValue];
    self.readyin = [aDecoder decodeDoubleForKey:kAccessTokenReadyin];
    self.expires = [aDecoder decodeDoubleForKey:kAccessTokenExpires];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_value forKey:kAccessTokenValue];
    [aCoder encodeDouble:_readyin forKey:kAccessTokenReadyin];
    [aCoder encodeDouble:_expires forKey:kAccessTokenExpires];
}

- (id)copyWithZone:(NSZone *)zone
{
    AccessToken *copy = [[AccessToken alloc] init];
    
    if (copy) {

        copy.value = [self.value copyWithZone:zone];
        copy.readyin = self.readyin;
        copy.expires = self.expires;
    }
    
    return copy;
}


@end
