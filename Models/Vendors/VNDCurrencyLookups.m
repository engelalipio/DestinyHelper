//
//  CurrencyLookups.m
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDCurrencyLookups.h"


NSString *const kCurrencyLookupsPrivacy = @"privacy";


@interface VNDCurrencyLookups ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDCurrencyLookups

@synthesize privacy = _privacy;


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
            self.privacy = [[self objectOrNilForKey:kCurrencyLookupsPrivacy fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.privacy] forKey:kCurrencyLookupsPrivacy];

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

    self.privacy = [aDecoder decodeDoubleForKey:kCurrencyLookupsPrivacy];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_privacy forKey:kCurrencyLookupsPrivacy];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDCurrencyLookups *copy = [[VNDCurrencyLookups alloc] init];
    
    if (copy) {

        copy.privacy = self.privacy;
    }
    
    return copy;
}


@end
